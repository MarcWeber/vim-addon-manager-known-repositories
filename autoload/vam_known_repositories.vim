exec vam#DefineAndBind('s:c','g:vim_addon_manager','{}')

let s:c['plugin_sources'] = get(s:c,'plugin_sources', {})

" the function returning the package pool.
" It can be configured in VAM and is run when command completion is used or
" when an update/ install action takes place.
" If you have custom packages overwrite this function and patch whatever you
" want to patch...
" 
" arg www_vim_org: See vamkr#www_vim_org_generated#Sources() (result is patched vamkr#patch#Patch)
" arg scm_plugin_sources: See  vamkr#scm#Sources() (vim_script_nr_X is replaced by plugin's name in keys)
fun! vam_known_repositories#MergeSources(plugin_sources, www_vim_org, scm_plugin_sources, nr_to_name, rename_dict)

  let merge_strategy = get(s:c, 'scm_merge_strategy', 'force')

  let d = {}

  " (1) merge in www.vim.org sources:
  call extend(d, a:www_vim_org )

  " (2) merge in SCM sources only if support isn't disabled
  "     (See VAMs documentation 4. Options -> drop_{scm}_soucres)
  "
  " g:vim_addon_manager['scm_merge_strategy'] options:
  " force: prefer scm version over www.vim.org
  " keep:  only add scm version which have no released versions on www.vim.org
  " never: Don't add scm versions to list of known sources
  let merge_strategy = get(s:c, 'scm_merge_strategy', 'force')
  if merge_strategy isnot# 'never'
    call filter(a:scm_plugin_sources, '!get(s:c, "drop_".(v:val.type)."_sources", 0)')

    " old code, will be dropped: scm_support was renamed to drop_scm_sources
    call filter(a:scm_plugin_sources, 'get(s:c, (v:val.type)."_support", 1)')

    call extend(d, a:scm_plugin_sources, merge_strategy)
  endif

  " always keep what the user has set:
  call extend(a:plugin_sources, d, 'keep')

  " hack: if script_id is known set script_id for SCM sources.
  " This way the name can be found by :AddonInfo
  for k in keys(a:www_vim_org)
    let s_id = get(get(a:www_vim_org, k, {}),'vim_script_nr', 0)
    if s_id != 0
      let a:plugin_sources[k]['vim_script_nr'] = get(a:plugin_sources[k], 'vim_script_nr', s_id)
    endif
  endfor

endf

if !exists('s:first_run')
  let s:first_run = 1
endif

" returns the package pool. Probably you want to overwrite MergeSources instead
" This function preparse www_vim_org and scm sources for MergeSources
" Its the default implementation for the one function returning the pool of
" known addons.
fun! vam_known_repositories#Pool()
  " this automatically resources those files if timestamps have changed:
  let www_vim_org = vamkr#update#TryCall('vamkr#www_vim_org_generated#Sources')
  let scm         = vamkr#update#TryCall('vamkr#scm#Sources')

  " build vim_script_nr to name lookup dictionary:
  " nr_to_name is not exposed to the user (can only be accessed via function
  " arg) because running #Pool() is expensive. That's why its done only when
  " installing or upgrading plugins ..
  let nr_to_name = {}
  for [k,v] in items(www_vim_org)
    let nr_to_name[v.vim_script_nr] = k
    unlet k v
  endfor

  " rewrite script_ids by names:
  for k in keys(scm)
    let id = matchstr(k, '\zs\d\+\ze')
    if (has_key(nr_to_name, id))
      let scm[nr_to_name[id]] = scm[k]
      call remove(scm, k)
    endif
  endfor

  " backup plugins user may have added to plugin_sources before Pool funtion was invoked
  if s:first_run && has_key(s:c, 'plugin_sources')
    let s:pool_user_preset = s:c['plugin_sources']
  else
    let s:pool_user_preset = {}
  endif
  let s:first_run = 0

  "  start from scratch adding plugin sources to pool:
  let pool = copy(s:pool_user_preset)

  let renamings = s:c.renamings_fun == 'vamkr#rename_dict_parts_generated#Renamings'
        \ ? vamkr#update#TryCall("vamkr#rename_dict_parts_generated#Renamings")
        \ : call(s:c.renamings_fun, [])
  " now call MergeSources merge function so that user can pick scm over
  " www_vim_org sources as she desires.
  call call(s:c['MergeSources'], [pool, www_vim_org, scm, nr_to_name, renamings])

  for k in keys(pool)
    if has_key(renamings, k)
      echom "warning: pool contains name ".k." which was taken by another plugin previously. Contact author to change name or remove entry in autoload/vamkr/rename_dict_parts_generated.vim"
    endif
  endfor

  return pool
endf
