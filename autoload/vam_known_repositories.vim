exec vam#DefineAndBind('s:c', 'g:vim_addon_manager', '{}')

" the function returning the package pool.
" It can be configured in VAM and is run when command completion is used or
" when an update/ install action takes place.
" If you have custom packages overwrite this function and patch whatever you
" want to patch...
" 
" arg www_vim_org: See vamkr#www_vim_org_generated#Sources() (result is patched vamkr#patch#Patch)
" arg scm_plugin_sources: See  vamkr#scm#Sources() (vim_script_nr_X is replaced by plugin's name in keys)
fun! vam_known_repositories#MergeSources(plugin_sources, www_vim_org, scm_plugin_sources, patch_function, snr_to_name)

  let merge_strategy = get(s:c, 'scm_merge_strategy', 'force')

  let d = {}

  " (1) merge in www.vim.org sources:
  call extend(d, a:www_vim_org)

  " (2) merge in SCM sources only if support isn't disabled
  "     (See VAMs documentation 4. Options -> drop_{scm}_soucres)
  "
  " g:vim_addon_manager['scm_merge_strategy'] options:
  " force: prefer scm version over www.vim.org
  " keep:  only add scm version which have no released versions on www.vim.org
  " never: Don't add scm versions to list of known sources
  if merge_strategy isnot# 'never'
    call filter(a:scm_plugin_sources, '!get(s:c, "drop_".(v:val.type)."_sources", 0)')

    " old code, will be dropped: scm_support was renamed to drop_scm_sources
    call filter(a:scm_plugin_sources, 'get(s:c, (v:val.type)."_support", 1)')

    call extend(d, a:scm_plugin_sources, merge_strategy)
  endif

  let d=call(a:patch_function, [d, a:snr_to_name], {})

  " always keep what the user has set:
  call extend(a:plugin_sources, d, 'keep')
endf

" returns the package pool. Probably you want to overwrite MergeSources instead
" This function preparse www_vim_org and scm sources for MergeSources
" Its the default implementation for the one function returning the pool of
" known addons.
fun! vam_known_repositories#Pool()
  let www_vim_org = vamkr#GetJSON('vimorgsources')
  let snr_to_name={}
  call map(copy(www_vim_org), 'extend(snr_to_name, {v:val.vim_script_nr : v:key})')
  let scm         = vamkr#GetSCMSources(snr_to_name, www_vim_org)

  " build vim_script_nr to name lookup dictionary:
  " nr_to_name is not exposed to the user (can only be accessed via function
  " arg) because running #Pool() is expensive. That's why its done only when
  " installing or upgrading plugins ..
  let nr_to_name = {}
  for [k,v] in items(www_vim_org)
    let nr_to_name[v.vim_script_nr] = k
    unlet k v
  endfor

  "  start from scratch adding plugin sources to pool:
  let pool = copy(get(s:c, 'plugin_sources', {}))

  " now call MergeSources merge function so that user can pick scm over
  " www_vim_org sources as she desires.
  call call(s:c['MergeSources'], [pool, www_vim_org, scm, 'vamkr#PatchSources', snr_to_name], {})

  return pool
endf
