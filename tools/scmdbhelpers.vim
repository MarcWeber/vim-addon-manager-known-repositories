function! GetAuthor()
    wincmd k
    let view=winsaveview()
    .+1? for \d\+:$?+2
    let a=getline('.')
    call winrestview(view)
    wincmd p
    return matchstr(a, 'Author: \zs.*')
endfunction
function! GetScriptType()
    wincmd k
    let view=winsaveview()
    .+1? for \d\+:$?+1
    let a=getline('.')
    call winrestview(view)
    wincmd p
    return matchstr(a, 'Script type: \zs.*')
endfunction
fun! AddGHUrl(url, nr)
    let nr=a:nr
    if nr is 0 | let nr=substitute(matchstr(a:url, '\v^(\w+\:\/\/)?[^/]+\/[^/]+\/\zs[^/]+'), '\v(\.vim)?(\.git)?/*$', '', '') | endif
    call append('.', ((type(nr)==type(0))?
                \       ('let scmnr.'.nr):
                \       ('let scm['.string(nr).']')).' = '.
                \    ((a:url=~#'\v\/(blob|raw)\/master\/.*\.vim$')?
                \       ('{''url'': '.string(substitute(a:url, 'blob/master', 'raw/master', '')).', ''archive_name'': '.string(fnamemodify(a:url, ':t')).', ''type'': ''archive'', ''script-type'': '.string(GetScriptType()).'}'):
                \    ((a:url=~#'^lp:')?
                \       ('{''type'': ''bzr'', ''url'': '.string(a:url).'}'):
                \    ((a:url=~#'svn')?
                \       ('{''type'': ''svn'', ''url'': '.string(a:url).'}'):
                \    ((a:url=~#'bitbucket\.org')?
                \       ('{''type'': ''hg'', ''url'': '.string(a:url).'}'):
                \       ('{''type'': ''git'', ''url'': ''git://'.substitute(substitute(substitute(substitute(a:url, '^\w\+://', '', ''), '/\(/\|$\)\@=', '', ''), '^\([^/]*/[^/]*/[^/]*\).*', '\1', ''), '\.git$', '', '').'''}'))))))
endfunction
function! GetSNR()
    wincmd k
    let view=winsaveview()
    .+1? for \d\+:$?
    let a=getline('.')
    call winrestview(view)
    wincmd p
    return matchstr(a, '\d\+\ze:$')
endfunction
nnoremap ,gv :call AddGHUrl(@+, +GetSNR())<CR>j
nnoremap ,gg :call AddGHUrl(@+, 0)<CR>j
nnoremap ,ge :call AddGHUrl(@+, )<Left>
nnoremap ,ga :call append('.', ['', '" '.GetAuthor()])<CR>2j
nmap     ,gn ,ga,gv
inoremap ,gs <C-r>=GetSNR()<CR>
nnoremap ,gd olet mai_snr_deps.<C-r>=GetSNR()<CR> = []<Left>
