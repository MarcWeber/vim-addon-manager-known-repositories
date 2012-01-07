let s:dbdir=expand('<sfile>:h:h').'/db'
function! vamkr#GetJSON(filepart)
  let file = s:dbdir.'/'.a:filepart.'.json'
  " don't ask me why system and cat is much much faster for very large files
  " call tlib#cmd#Time("call vamkr#GetJSON('vimorgsources')") shows speed up
  " from 35 to 5ms  ... the reason is join being slow
  " windows users: provide your own hack ..
  let body = 
        \ executable('cat') && executable('tr')
        \ ? system('cat '.shellescape(file).' |tr '.shellescape('\n').' '.shellescape(' '))
        \ : join(readfile(file,'b'),"")
    return eval(body)
endfunction

" GetVim executes content of a .vim file returning the r var which should be
" defined. Its similar to using autoload functions. However autoload functions
" would not be garbage collected. Whether its insane to think about this small
" details - I don't know. Its ZyX idea and gets the job done. Little bit
" uncommon :)
"
" limitations:
" You must not use commands here that take “|” as a part of 
" theirs command line, as they also consume newline
function! vamkr#GetVim(filepart)
    execute join(filter(readfile(s:dbdir.'/'.a:filepart.'.vim'), 'v:val[0] isnot# "\""'), "\n")
    return r
endfunction

function! vamkr#GetNrNamesHist()
    return vamkr#GetJSON('names_and_historical_names_by_script_id')
endfunction

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

function! vamkr#SuggestNewName(unkown_name)
    let messages = []
    for [nr, names] in items(vamkr#GetJSON('names_and_historical_names_by_script_id'))
        if index(names, a:unkown_name) > 0
            call add(messages, a:unkown_name." was renamed to ".names[0]
        endif
    endfor
    return messages
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

function! vamkr#SuggestNewName(unkown_name)
    let renamed = []
    for [nr, names] in items(vamkr#GetJSON('names_and_historical_names_by_script_id'))
      if index(names, a:unkown_name) > 0
        call add(renamed, names[0])
      endif
    endfor
    return map(renamed, string(a:unkown_name).'." was renamed to ".v:val')
endfunction

" read scm sources: rewrite script_nr keys as names
function! vamkr#GetSCMSources(snr_to_name)
    let [scm, scmnr]=vamkr#GetVim('scmsources')
    let bad_keys=[]
    call filter(scmnr, 'has_key(a:snr_to_name, v:key) ? 1 : [0, add(bad_keys, v:key)][0]')
    if !empty(bad_keys)
        call vam#Log('There are bad keys inside scmnr dictionary: '.string(bad_keys))
    endif
    " merge scmnr sources into scm. But first add vim_script_nr key so that
    " AddonInfo still finds the plugin even if scm overwrites www_vim_org
    " sources
    call map(scmnr, 'extend(scm, {a:snr_to_name[v:key] : extend(v:val, {"vim_script_nr": v:key})})')
    return scm
endfunction

function! vamkr#PatchSources(sources, snr_to_name)
    let [add_by_snr, add_by_name, mai_snr, mai_snr_deps]=vamkr#GetVim('patch')
    for [snr, deps] in items(mai_snr_deps)
      if !has_key(mai_snr, snr)
        let mai_snr[snr]={}
      endif
      call map(deps, 'extend(mai_snr.'.snr.', {"dependencies": {a:snr_to_name[v:val] : { } } })')
    endfor
    call filter(mai_snr, 'has_key(a:snr_to_name, v:key)')
    call map(mai_snr, 'extend(add_by_snr, {v:key : extend(get(add_by_snr, v:key, {}), {"addon-info": v:val})})')
    call map(add_by_snr, 'extend(add_by_name, {a:snr_to_name[v:key] : v:val})')
    call map(filter(add_by_name, 'has_key(a:sources, v:key)'), 'extend(a:sources[v:key], v:val)')
    return a:sources
endfunction
" vim: ft=vim ts=4 sts=4 sw=4 et fmr=▶,▲
