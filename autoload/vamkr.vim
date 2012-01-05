let s:dbdir=expand('<sfile>:h:h').'/db'
function! vamkr#GetJSON(filepart)
    return eval(join(readfile(s:dbdir.'/'.a:filepart.'.json')))
endfunction
function! vamkr#GetVim(filepart)
    execute join(filter(readfile(s:dbdir.'/'.a:filepart.'.vim'), 'v:val[0] isnot# "\""'), "\n")
    return r
endfunction
function! vamkr#GetNamesDb()
    let r=vamkr#GetJSON('namenrshist')
    " TODO Add non-nr renaming
    return r
endfunction
function! vamkr#GetNrsDb()
    return vamkr#GetJSON('nrnameshist')
endfunction
function! vamkr#GetVOSources()
    return vamkr#GetJSON('vimorgsources')
endfunction
function! vamkr#GetSCMSources(snr_to_name)
    let [scm, scmnr]=vamkr#GetVim('scmsources')
    call filter(scmnr, 'has_key(a:snr_to_name, v:key)')
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
