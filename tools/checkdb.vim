try
    let passed=0
    let www_vim_org=vamkr#LoadDBFile('vimorgsources.json')
    let snr_to_name={}
    call map(copy(www_vim_org), 'extend(snr_to_name, {v:val.vim_script_nr : v:key})')
    redir => g:messages
    call vamkr#GetSCMSources(snr_to_name, www_vim_org)
    redir END
    if match(g:messages, '\S')!=-1
        throw 'Not empty messages'
    endif
    let scmsources=vamkr#LoadDBFile('scmsources.vim')
    let keys={'addon-info': {}, 'url': '', 'type': '',
                \'archive_name': '', 'script-type': '',
                \'dependencies': {}, 'archive': '',
                \'branch': ''}
    call map(keys, 'type(v:val)')
    let mandatory_keys=['type', 'url']
    let mandatory_archive_keys=['archive_name', 'script-type']
    let numcheckid='id !~# ''\v^[1-9]\d*$'''
    let strcheckid='id =~# ''[^a-zA-Z0-9_\-@#]'''
    let checkid=numcheckid
    let ai_keys={'post-install-hook': '', 'post-update-hook': '',
                \'post-scm-update-hook': '', 'archive_name': '',
                \'runtimepath': '', 'dependencies': {}}
    call map(ai_keys, 'type(v:val)')
    for [id, src] in items(scmsources[1])+[[0, 1]]+items(scmsources[0])
        if id is 0
            unlet src
            let checkid=strcheckid
            continue
        endif
        let s=id.' '.string(src)
        if type(src)!=type({})
            throw 'Not a dict: '.s
        elseif eval(checkid)
            throw 'Invalid key: '.s
        elseif !empty(filter(copy(mandatory_keys), '!has_key(src, v:val)'))
            throw 'Mandatory key missing: '.s
        elseif !empty(filter(copy(keys), 'has_key(src, v:key) && type(src[v:key])!=v:val'))
            throw 'Type mismatch: '.s
        elseif !empty(filter(keys(src), '!has_key(keys, v:val)'))
            throw 'Unknown key: '.s
        elseif src.type is# 'archive' && !empty(filter(copy(mandatory_archive_keys), '!has_key(src, v:val)'))
            throw 'Mandatory archive key missing: '.s
        elseif src.type is# 'git' && src.url=~#'\vgit\:\/\/github\.com\/.*\.git$|^(git)@!\a+\:\/\/github\.com\/'
            throw 'Invalid github url: '.s
        elseif has_key(src, 'addon-info') && (empty(src['addon-info']) || !empty(filter(copy(ai_keys), 'has_key(src["addon-info"], v:key) && type(src["addon-info"][v:key])!=v:val')))
            throw 'Invalid addon-info: '.s
        endif
        unlet src
    endfor
    let patchinfo=vamkr#LoadDBFile('patchinfo.vim')
    let add_keys={'script-type': '', 'target_dir': '', 'strip-components': 0, 'deprecated': ''}
    call map(add_keys, 'type(v:val)')
    let checkid=numcheckid
    for [id, add] in items(patchinfo[0])+[[0, 1]]+items(patchinfo[1])
        if id is 0
            unlet add
            let checkid=strcheckid
            continue
        endif
        let s=id.' '.string(add)
        if type(add)!=type({})
            throw 'Not a dict: '.s
        elseif eval(checkid)
            throw 'Invalid key: '.s
        elseif empty(add)
            throw 'Empty dict: '.s
        elseif !empty(filter(copy(add_keys), 'has_key(add, v:key) && type(add[v:key])!=v:val'))
            throw 'Type mismatch: '.s
        endif
        unlet add
    endfor
    for [id, mai] in items(patchinfo[2])
        let s=id.' '.string(mai)
        if type(mai)!=type({})
            throw 'Not a dict: '.s
        elseif eval(numcheckid)
            throw 'Invalid key: '.s
        elseif empty(mai)
            throw 'Empty dict: '.s
        elseif !empty(filter(copy(ai_keys), 'has_key(mai, v:key) && type(mai[v:key])!=v:val'))
            throw 'Type mismatch: '.s
        endif
        unlet mai
    endfor
    for [id, msd] in items(patchinfo[3])
        let s=id.' '.string(msd)
        if type(msd)!=type([])
            throw 'Not a list: '.s
        elseif eval(numcheckid)
            throw 'Invalid key: '.s
        elseif !empty(filter(copy(msd), 'type(v:val)>1 || (type(v:val)==type(0) ? (v:val<=0) : (eval(substitute(strcheckid, "id", "v:val", ""))))'))
            throw 'Invalid value '.s
        endif
    endfor
    runtime! tools/vam.vim
    call vam_known_repositories#Pool()
    let passed=1
    qall!
finally
    if !passed
        cquit
    endif
endtry
