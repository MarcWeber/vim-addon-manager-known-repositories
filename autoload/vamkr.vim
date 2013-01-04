if exists('g:vam_kr_running_hook_test')
    function s:Log(message)
        throw a:message
    endfunction
else
    let s:Log=function('vam#Log')
endif
let s:dbdir=expand('<sfile>:h:h').'/db'
function! vamkr#LoadDBFile(file) abort
    let ext=fnamemodify(a:file, ':e')
    let file=s:dbdir.'/'.a:file
    if ext is# 'vim'
        " The following code executes content of a .vim file returning the r var 
        " which should be defined. Its similar to using autoload functions. 
        " However autoload functions would not be garbage collected. Whether its 
        " insane to think about this small details - I don't know. Its ZyX idea 
        " and gets the job done. Little bit uncommon :)
        "
        " limitations: You can’t use line continuation here
        execute "function s:Vim()\n".join(readfile(file, 'b'), "\n")."\nreturn r\nendfunction"
        try
            let r=s:Vim()
        endtry
        delfunction s:Vim
        return r
    elseif ext is# 'json'
        try
            return eval(join(readfile(file, 'b'), ''))
        catch /.*/
            throw 'Failed to read json file “'.file.'”: '.v:exception
        endtry
    else
        throw 'Unknown file type: '.ext
    endif
endfunction

function! vamkr#SuggestNewName(name)
    let messages = []
    for [nr, names] in items(vamkr#LoadDBFile('script-id-to-name-log.json'))
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

function! vamkr#GetSCMSources(snr_to_name, www_vim_org)
    let [scm, scmnr]=vamkr#LoadDBFile('scmsources.vim')
    let scmvoconflicts=s:FilterConflicts(scm, a:www_vim_org, '!')
    if !empty(scmvoconflicts)
        call s:Log('The following scm keys are the same as vim.org ones: '.join(scmvoconflicts, ', ').".\n".
                  \'These plugins should either be renamed or put into scmnr dictionary.')
    endif
    let missingscmnr=s:FilterConflicts(scmnr, a:snr_to_name, '')
    if !empty(missingscmnr)
        call s:Log('The following scmnr keys are not known: '.join(missingscmnr, ', ').'.')
    endif
    " Merge scmnr sources into scm, rewriting numbers as names. But first add 
    " vim_script_nr key so that AddonInfo still finds the plugin even if scm 
    " overwrites www_vim_org sources
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
    let [add_by_snr, mai_snr, mai_snr_deps]=vamkr#LoadDBFile('patchinfo.vim')
    for [snr, deps] in items(mai_snr_deps)
        if !has_key(mai_snr, snr)
            let mai_snr[snr]={}
        endif
        let ms = mai_snr[snr]
        let ms.dependencies = get(mai_snr, 'dependencies', {})
        call map(deps, 'extend( ms.dependencies, {(type(v:val) == type(0) ? a:snr_to_name[v:val] : v:val) : {}})')
    endfor
    call filter(mai_snr, 'has_key(a:snr_to_name, v:key)')
    call map(mai_snr, 'extend(add_by_snr, {v:key : extend(get(add_by_snr, v:key, {}), {"addon-info": v:val})})')
    let add_by_name={}
    call map(add_by_snr, 'extend(add_by_name, {a:snr_to_name[v:key] : v:val})')
    call map(filter(add_by_name, 'has_key(a:sources, v:key)'), 'extend(a:sources[v:key], v:val)')
    return a:sources
endfunction

function! vamkr#AddCopyHook(repository, files)
    let hook=[]
    let dirs={}
    for [file, dir] in items(a:files)
        let dirs[dir]=1
        " Assuming that no one is crazy enough to really have newlines in 
        " filename
        let hook+=['call vam#utils#CopyFile(%d.'.string('/'.file).', %d.'.string('/'.dir.'/'.file).')']
    endfor
    let a:repository['addon-info']={}
    let a:repository['addon-info']['post-install-hook']=join(map(keys(dirs), '"call mkdir(%d.".string("/".v:val).(stridx(v:val, "/")==-1 ? "" : ", ''p''").")"')+hook, ' | ')
    let a:repository['addon-info']['post-scms-update-hook']=join(hook, ' | ')
    return a:repository " Make it possible to use let scmnr.XXXX = vamkr#AddCopyHook({...}, {...})
endfunction
" vim: ft=vim ts=4 sts=4 sw=4 et fmr=▶,▲
