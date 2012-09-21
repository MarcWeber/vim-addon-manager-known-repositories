function CheckVal(s, mes, curauthor)
    try
        if has_key(a:curauthor, 'hook')
            let hook=a:curauthor.hook
        endif
        let val=eval(a:s)
        return (val.type is# 'archive')*2+
                    \(!empty(filter(keys(val), 'stridx(v:val, "hook")!=-1')))
    catch
        throw printf(a:mes, a:s, v:exception)
    finally
        if exists('hook')
            unlet hook
        endif
    endtry
endfunction
let types = ['SCM unhooked source',
            \'SCM hooked source',
            \'archive source',
            \'archive hooked source']
try
    set rtp=.
    let g:vam_kr_running_hook_test=1

    try
        let www_vim_org=vamkr#LoadDBFile('vimorgsources.json')
    catch
        throw 'Error while loading vo DB file: '.v:exception
    endtry

    let snr_to_name={}
    call map(copy(www_vim_org), 'extend(snr_to_name, {v:val.vim_script_nr : v:key})')

    let lines=readfile('db/scmsources.vim')
    let topvars=['scm', 'scmnr']
    let alltopvars=copy(topvars)
    let prevempty=0
    let curauthorempty={'type': 0, 'vo': 1, 'hashook': 0, 'mintype': 5, 'hasvo': 0, 'srcnum': 0}
    let curauthor={}
    let isend=0
    let afterline=0
    let lnr=0
    for line in lines
        let lnr+=1
        if empty(line) && empty(topvars)
            let prevempty=1
            continue
        elseif prevempty && !isend
            if line =~# '" \v\S+(\ \S+)*$'
                if empty(curauthor)
                elseif curauthor.hashook
                    throw lnr.':You must unlet the hook variable (with line exactly matching “unlet hook”) before proceeding to new author'
                elseif !curauthor.srcnum
                    if afterline!=3
                        throw lnr.':Authors without any sources must go after the third line'
                    endif
                elseif !curauthor.hasvo
                    if afterline!=2
                        throw lnr.':Authors without any vim.org sources must go after the second line'
                    endif
                elseif curauthor.mintype>0
                    if afterline!=1
                        throw lnr.':Authors without any non-hooked SCM sources must go after the first line'
                    endif
                endif
                let curauthor=deepcopy(curauthorempty)
            elseif line =~# '^"-\+$'
                let afterline+=1
                let curauthor={}
            else
                throw lnr.':It is allowed to only separate author sections with empty lines'
            endif
        elseif line=~#'\v^%(\".*)?$'
        elseif isend
            throw lnr.':Only comment and empty lines are allowed after “let r=…” line: '.line
        elseif line=~#'\v^let\ %('.join(topvars, '|').')\m\s*=\s*{}$'
            let topvar=matchstr(line, '\a\+\ze\s*=')
            call filter(topvars, 'v:val isnot# topvar')
            if empty(topvars)
                let section=1
            endif
        elseif line=~#'^let scmnr'
            if !curauthor.vo
                throw lnr.':www.vim.org sources must go before scm ones'
            endif
            let match=matchlist(line, 'scmnr\.\v(\d+)\s+\=\s+(.*)$')
            if empty(match)
                throw lnr.':Invalid scmnr line: '.line
            elseif !has_key(snr_to_name, match[1])
                throw lnr.':Absent snr: '.match[1]
            endif
            let curtype=CheckVal(match[2], lnr.':Invalid scmnr value %s: %s', curauthor)
            let curauthor.hasvo=1
            let curauthor.vo=1
        elseif line=~#'^let scm'
            let match=matchlist(line, 'scm\v\[\''([a-zA-Z0-9_\-]+)(\@[a-zA-Z0-9_\-]+|\#[a-zA-Z0-9_\-]+%(\%\d+)?)?\''\]\s+\=\s+(.*)$')
            if empty(match)
                throw lnr.':Invalid scm line: '.line
            elseif has_key(www_vim_org, match[1].match[2])
                throw lnr.':Key '.match[1].match[2].' already present in www_vim_org dictionary'
            endif
            let curtype=CheckVal(match[3], lnr.':Invalid scm value %s: %s', curauthor)
            if curauthor.vo
                let curauthor.vo=0
                let curauthor.type=0
            endif
        elseif line=~#'^let hook'
            let match=matchlist(line, 'hook\s*=\s*\(.*\)$')
            if empty(match)
                throw lnr.':Invalid hook line: '.line
            endif
            try
                let curauthor.hook=eval(match[1])
            catch
                throw lnr.':Invalid hook item: '.match[1]
            endtry
            let curauthor.hashook=1
        elseif line is# 'unlet hook'
            let curauthor.hashook=0
            unlet curauthor.hook
        elseif line is# 'let r=['.join(alltopvars, ', ').']'
            let isend=1
        else
            throw lnr.':Unknown line: '.line
        endif
        if exists('curtype')
            if curauthor.type>curtype
                throw lnr.':Invalid source order: '.g:types[curtype].' should not follow '.g:types[curauthor.type]
            endif
            let curauthor.type=curtype
            if curauthor.mintype>curtype
                let curauthor.mintype=curtype
            endif
            unlet curtype
            let curauthor.srcnum+=1
        endif
        let prevempty=0
    endfor
    if !isend
        throw 'End line not found'
    endif

    let scmsources=vamkr#LoadDBFile('scmsources.vim')

    redir => g:messages
    call vamkr#GetSCMSources(snr_to_name, www_vim_org)
    redir END
    if match(g:messages, '\S')!=-1
        throw 'Not empty messages: '.g:messages
    endif

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
catch
    call writefile([v:exception], 'exception.fail', 'b')
    let exception=1
endtry
try
    " XXX For unknown reason putting the following line into previous :try block 
    "     prevents catching exceptions
    call vam_known_repositories#Pool()
    if !exists('exception')
        qall!
    endif
catch
    call writefile([v:exception], 'exception.fail', 'b')
endtry
redir! > messages.fail
messages
redir END
cquit
