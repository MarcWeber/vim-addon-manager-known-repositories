function vam#DefineAndBind(int, ext, def)
    let {a:ext}=eval(a:def)
    let {a:ext}.MergeSources='vam_known_repositories#MergeSources'
    return 'let '.a:int.'='.a:ext
endfunction
