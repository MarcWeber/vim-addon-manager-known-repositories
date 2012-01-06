let s:dbdir=expand('<sfile>:h:h').'/db'
function! vamkr#GetJSON(filepart)
    return eval(join(readfile(s:dbdir.'/'.a:filepart.'.json')))
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
    execute join(map(readfile(s:dbdir.'/'.a:filepart.'.vim'), 'v:val[0] !~ '.string('^\s*"')), "\n")
    return r
endfunction

function! vamkr#GetNrNamesHist()
    return vamkr#GetJSON('names_and_historical_names_by_script_id')
endfunction

function! vamkr#GetNameNrOrNewNameMap()
    let nrnameshist=vamkr#GetNrNamesHist()
    let r={}
    for [nr, names] in map(items(nrnameshist), '[str2nr(v:val[0]), v:val[1]]')
        for name in names
            let r.name=nr
        endfor
    endfor
    " XXX Non-nr renaming should go to db/renames.json that looks like 
    " {old_name:new_name}. It is absent so code is commented
    " call extend(r, vamkr#GetJSON("renames"))
    return r
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
    let [add_by_snr, add_by_name, mai_snr]=vamkr#GetVim('patch')
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
