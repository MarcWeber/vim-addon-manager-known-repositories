let s:dbdir=expand('<sfile>:h:h').'/db'
function! vamkr#GetJSON(filepart)
  let file = s:dbdir.'/'.a:filepart.'.json'
  " don't ask me why system and cat is much much faster for very large files
  " call tlib#cmd#Time("call vamkr#GetJSON('vimorgsources')") shows speed up
  " from 35 to 5ms  ... the reason is join being slow
  " windows users: provide your own hack ..
  if !filereadable(file)
    throw 'File “'.file.'” not found'
  endif
  let body =
        \ (executable('cat') && executable('tr'))
        \ ? system('cat '.shellescape(file).' |tr '.shellescape('\n').' '.shellescape(' '))
        \ : join(readfile(file, 'b'), '')
  try
    return eval(body)
  catch /.*/
    throw 'Failed to read json file “'.file.'”: '.v:exception
  endtry
endfunction

" GetVim executes content of a .vim file returning the r var which should be
" defined. Its similar to using autoload functions. However autoload functions
" would not be garbage collected. Whether its insane to think about this small
" details - I don't know. Its ZyX idea and gets the job done. Little bit
" uncommon :)
"
" limitations: You can’t use line continuation here
function! vamkr#GetVim(filepart)
    execute "function s:Vim()\n".join(readfile(s:dbdir.'/'.a:filepart.'.vim', 'b'), "\n")."\nreturn r\nendfunction"
    let r=s:Vim()
    delfunction s:Vim
    return r
endfunction

" function! vamkr#GetNrNamesHist()
"     return vamkr#GetJSON('script-id-to-name-log')
" endfunction

" can be removed?
function! vamkr#GetNameNrOrNewNameMap(nrnameshist)
    let r={}
    for [nr, names] in map(items(a:nrnameshist), '[str2nr(v:val[0]), v:val[1]]')
        for name in names
            let r[name]=nr
        endfor
    endfor
    " XXX Non-nr renaming should go to db/scmrenames.json that looks like 
    " {old_name:new_name}. It is absent so code is commented
    " call extend(r, vamkr#GetJSON("scmrenames"))
    return r
endfunction

function s:NormalizeName(name)
    return substitute(tolower(a:name), '[_/\-]*', '', 'g')
endfunction
function s:GetName(nameOrNr, nrnameshist)
    return type(a:nameOrNr)==type(0) ? a:nrnameshist[a:nameOrNr] : a:nameOrNr
endfunction

function! vamkr#SuggestNewName(name)
    let messages = []
    for [nr, names] in items(vamkr#GetJSON('script-id-to-name-log'))
        if index(names, a:name) > 0
            call add(messages, a:name." was renamed to ".names[0])
        endif
    endfor
    return messages
endfunction

function! s:FilterConflicts(from, with, bang)
    let r=[]
    call filter(a:from, a:bang.'has_key(a:with, v:key) ? 1 : [0, add(r, v:key)][0]')
    return r
endfunction

" It will return 2-tuple: (new_name, [corrected_name])
" why do we need GetNameNrOrNewNameMap here? Isn't the implementation above
" enough?
" function! vamkr#SuggestNewName(name)
"     let nrnameshist=vamkr#GetNrNamesHist()
"     let namemap=vamkr#GetNameNrOrNewNameMap(nrnameshist)
"     let r=[]
"     if has_key(namemap, a:name)
"         let r+=[s:GetName(namemap[a:name], nrnameshist)]
"     else
"         let r+=[0]
"     endif
"     let r+=[keys(filter(copy(namemap), 's:NormalizeName(v:key) is# '.string(s:NormalizeName(a:name))))]
"     call map(r[1], 's:GetName(v:val, nrnameshist)')
"     return r
" endfunction

" read scm sources: rewrite script_nr keys as names
function! vamkr#GetSCMSources(snr_to_name, www_vim_org)
    let [scm, scmnr]=vamkr#GetVim('scmsources')
    let scmvoconflicts=s:FilterConflicts(scm, a:www_vim_org, '!')
    if !empty(scmvoconflicts)
        call vam#Log('The following scm keys are the same as vim.org ones: '.join(scmvoconflicts, ', ').".\n".
                    \'These plugins should either be renamed or put into scmnr dictionary.')
    endif
    let missingscmnr=s:FilterConflicts(scmnr, a:snr_to_name, '')
    if !empty(missingscmnr)
        call vam#Log('The following scmnr keys are not known: '.join(missingscmnr, ', ').'.')
    endif
    " merge scmnr sources into scm. But first add vim_script_nr key so that
    " AddonInfo still finds the plugin even if scm overwrites www_vim_org
    " sources
    call map(scmnr, 'extend(scm, {a:snr_to_name[v:key] : extend(v:val, {"vim_script_nr": v:key})})')
    unlet scmnr
    " Transform names like %{snr} in dependencies dictionary into names used by 
    " VAM
    for repository in filter(values(scm), 'has_key(v:val, "addon-info") && has_key(v:val["addon-info"], "dependencies")')
        let depdict=repository['addon-info'].dependencies
        for depname in filter(keys(depdict), 'v:val[0] is# "%"')
            call remove(depdict, depname)
            let depdict[a:snr_to_name[depname[1:]]]={}
        endfor
    endfor
    return scm
endfunction

function! vamkr#PatchSources(sources, snr_to_name)
    let [add_by_snr, add_by_name, mai_snr, mai_snr_deps]=vamkr#GetVim('patch')
    for [snr, deps] in items(mai_snr_deps)
      if !has_key(mai_snr, snr)
        let mai_snr[snr]={}
      endif
      call map(deps, 'extend(mai_snr.'.snr.', {"dependencies": {((type(v:val)=='.type(0).')?(a:snr_to_name[v:val]):(v:val)) : { } } })')
    endfor
    call filter(mai_snr, 'has_key(a:snr_to_name, v:key)')
    call map(mai_snr, 'extend(add_by_snr, {v:key : extend(get(add_by_snr, v:key, {}), {"addon-info": v:val})})')
    call map(add_by_snr, 'extend(add_by_name, {a:snr_to_name[v:key] : v:val})')
    call map(filter(add_by_name, 'has_key(a:sources, v:key)'), 'extend(a:sources[v:key], v:val)')
    return a:sources
endfunction
" vim: ft=vim ts=4 sts=4 sw=4 et fmr=▶,▲
