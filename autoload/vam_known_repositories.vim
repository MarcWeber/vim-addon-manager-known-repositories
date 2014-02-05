if !exists('g:vim_addon_manager')
    let g:vim_addon_manager={}
endif
let s:c=g:vim_addon_manager

let s:c['MergeSources']=get(g:vim_addon_manager, 'MergeSources', 'vam_known_repositories#MergeSources')

" the function returning the package pool.
" It can be configured in VAM and is run when command completion is used or
" when an update/ install action takes place.
" If you have custom packages overwrite this function and patch whatever you
" want to patch...
" 
" arg www_vim_org: See vimpi#www_vim_org_generated#Sources() (result is patched vamkr#patch#Patch)
" arg scm_plugin_sources: See  vimpi#scm#Sources() (vim_script_nr_X is replaced by plugin's name in keys)
fun! vam_known_repositories#MergeSources(o)
  " old argument list: fun! vam_known_repositories#MergeSources(plugin_sources, www_vim_org, scm_plugin_sources, patch_function, snr_to_name)
  " this was not extensibel, switch to dictionary (sorry for breaking API)
  "
  " keys of o see usage below
  let o = a:o
  if !has_key(o, 'plugin_sources')
    throw "API changed, pass dictionary, please"
  endif

  let merge_strategy = get(s:c, 'scm_merge_strategy', 'force')

  let d = {}

  " (1) merge in www.vim.org sources:
  call extend(d, o.www_vim_org)

  " (2) merge in drchip sources:
  call extend(d, o.drchip_sources)

  " (3) merge in SCM sources only if support isn't disabled
  "     (See VAMs documentation 4. Options -> drop_{scm}_soucres)
  "
  " g:vim_addon_manager['scm_merge_strategy'] options:
  " force: prefer scm version over www.vim.org
  " keep:  only add scm version which have no released versions on www.vim.org
  " never: Don't add scm versions to list of known sources
  if merge_strategy isnot# 'never'
    call filter(o.scm_plugin_sources, '!get(s:c, "drop_".(v:val.type)."_sources", 0)')

    " old code, will be dropped: scm_support was renamed to drop_scm_sources
    call filter(o.scm_plugin_sources, 'get(s:c, (v:val.type)."_support", 1)')

    call extend(d, o.scm_plugin_sources, merge_strategy)
  endif

  let d=call(o.patch_function, [d, o.snr_to_name], {})

  " always keep what the user has set:
  call extend(o.plugin_sources, d, 'keep')
endf

" returns the package pool. Probably you want to overwrite MergeSources instead
" This function preparse www_vim_org and scm sources for MergeSources
" Its the default implementation for the one function returning the pool of
" known addons.
fun! vam_known_repositories#Pool()
  let www_vim_org = vimpi#LoadDBFile('vimorgsources.json')
  let snr_to_name = vimpi#GetNrToNameMap(www_vim_org)
  let scm         = vimpi#GetSCMSources(snr_to_name, www_vim_org)

  "  start from scratch adding plugin sources to pool:
  let pool = copy(get(s:c, 'plugin_sources', {}))

  " now call MergeSources merge function so that user can pick scm over
  " www_vim_org sources as she desires.
  call call(s:c['MergeSources'], [{
        \ 'plugin_sources': pool,
        \ 'www_vim_org'   : www_vim_org,
        \ 'drchip_sources': vimpi#DrChipSources(),
        \ 'scm_plugin_sources'   : scm,
        \ 'patch_function'   : 'vimpi#PatchSources',
        \ 'snr_to_name'   : snr_to_name,
        \ }],{})
  return pool
endf
