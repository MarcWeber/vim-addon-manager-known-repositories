let s:dbdir=expand('<sfile>:h:h').'/db'
function! s:GetJSON(filepart)
    return eval(join(readfile(s:dbdir.'/'.a:filepart.'.json')))
endfunction
function! vamkr#GetNamesDb()
    let r=s:GetJSON('namenrshist')
    " TODO Add non-nr renaming
    return r
endfunction
function! vamkr#GetNrsDb()
    return s:GetJSON('nrnameshist')
endfunction
