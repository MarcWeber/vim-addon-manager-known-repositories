let repo=aurum#repository()
let range1=repo.functions.revrange(repo, 1,     618)
let range2=repo.functions.revrange(repo, 705, 'tip')
call filter(range1, 'v:val.description is# "update by cron job"')
call filter(range2, 'v:val.description is# "Cron job update"')
let nrnameshist={}
let namenrshist={}
let fails={}
function! s:InsInto(dict, key, value)
    if !has_key(a:dict, a:key)
        let a:dict[a:key]=[a:value]
    elseif a:dict[a:key][0] isnot# a:value
        call insert(a:dict[a:key], a:value)
    endif
endfunction
function! s:ProcessNameNRDict(vos)
    for [name, nr] in items(a:vos)
        call s:InsInto(g:namenrshist, name, nr  )
        call s:InsInto(g:nrnameshist, nr,   name)
    endfor
endfunction
set laststatus=2
for cs in range1
    let &statusline='Processing revision '.cs.rev
    redrawstatus
    let g:vim_addon_manager={}
    let g:vim_script_manager=g:vim_addon_manager
    try
        source `="aurum://file::".cs.hex.":plugin/vim-addon-manager-known-repositories.vim"`
        let vos=g:vim_addon_manager.plugin_sources
        call map(filter(vos, 'has_key(v:val, "vim_script_nr")'), 'v:val.vim_script_nr')
        call s:ProcessNameNRDict(vos)
        unlet vos
    catch
        let fails[cs.rev]=v:exception
    endtry
endfor
for cs in range2
    let &statusline='Processing revision '.cs.rev
    redrawstatus
    let g:vim_addon_manager={}
    try
        source `="aurum://file::".cs.hex.":plugin/vim.org-scripts.vim"`
        let vos=g:vim_addon_manager.vim_org_sources
        call map(vos, 'v:val.vim_script_nr')
        call s:ProcessNameNRDict(vos)
        unlet vos
    catch
        let fails[cs.rev]=v:exception
    endtry
endfor
call writefile([string(namenrshist)], 'namenrshist', 'b')
call writefile([string(nrnameshist)], 'nrnameshist', 'b')
