let s:rtp=expand('<sfile>:h:h')
if stridx(&rtp, ','.s:rtp)==-1
    let &rtp.=','.s:rtp
endif
function! GetAuthor()
    wincmd k
    let view=winsaveview()
    .+1? for \d\+:$?+2
    let a=getline('.')
    call winrestview(view)
    wincmd p
    return matchstr(a, 'Author: \zs.*')
endfunction
function! GetScriptType(nr)
    let nrnamesdb=vamkr#GetJSON('script-id-to-name-log')
    let name=get(nrnamesdb, a:nr, [0])[0]
    if name is 0
        return 'utility'
    endif
    let vodb=vamkr#GetJSON('vimorgsources')
    return get(get(vodb, name, {}), 'script-type', 'utility')
endfunction
function! AddKanaSources()
    let a=[]
    let vodb=vamkr#GetJSON('vimorgsources')
    for [n, na] in vamkr#GetJSON('_kana_github_vimorg_name')
        if has_key(vodb, na)
            let a+=['let scmnr.'.vodb[na].vim_script_nr.' = '.
                        \"{'type': 'git', 'url': 'git://github.com/kana/".n."'}"]
        else
            let a+=['let scm['.string(na).'] = '.
                        \"{'type': 'git', 'url': 'git://github.com/kana/".n."'}"]
        endif
    endfor
    call append('.', a)
endfunction
function! AddKanaPatch()
    let a=[]
    let vodb=vamkr#GetJSON('vimorgsources')
    for [n, na] in vamkr#GetJSON('_kana_github_vimorg_name')
        if has_key(vodb, na) && n=~#'vim-textobj-\%(user\)\@!'
            let a+=['let mai_snr_deps.'.vodb[na].vim_script_nr.' = [2100]']
        endif
    endfor
    call append('.', a)
endfunction
fun! AddGHUrl(url, nr)
    let nr=a:nr
    if nr is 0 | let nr=substitute(matchstr(a:url, '\v^(\w+\:\/\/)?[^/]+\/[^/]+\/\zs[^/]+'), '\v(\.vim)?(\.git)?/*$', '', '') | endif
    call append('.', ((type(nr)==type(0))?
                \       ('let scmnr.'.nr):
                \       ('let scm['.string(nr).']')).' = '.
                \    ((a:url=~#'\v\/(blob|raw)\/master\/.*\.vim$')?
                \       ('{''url'': '.string(substitute(a:url, 'blob/master', 'raw/master', '')).', ''archive_name'': '.string(fnamemodify(a:url, ':t')).', ''type'': ''archive'', ''script-type'': '.string(GetScriptType(nr)).'}'):
                \    ((a:url=~#'^lp:')?
                \       ('{''type'': ''bzr'', ''url'': '.string(a:url).'}'):
                \    ((a:url=~#'svn')?
                \       ('{''type'': ''svn'', ''url'': '.string(a:url).'}'):
                \    ((a:url=~#'bitbucket\.org' || match(a:url, '\v<hg>')!=-1)?
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
nnoremap ,gA :call append('.', ['', '" '.@*])<CR>2j
nmap     ,gn ,ga,gv
nmap     ,gN ,gA,ge
inoremap ,gs <C-r>=GetSNR()<CR>
nnoremap ,gd olet mai_snr_deps.<C-r>=printf("%-4u", +GetSNR())<CR> = []<Left>
nnoremap ,gD olet add_by_snr.<C-r>=printf("%-4u", +GetSNR())<CR>={'deprecated' : ""}<Left><Left>
