exec vam#DefineAndBind('s:c','g:vim_addon_manager','{}')

let s:c['plugin_sources'] = get(s:c,'plugin_sources', {})
let s:c['missing_addon_infos'] = get(s:c,'missing_addon_infos', {})

" arguments:
"   plugin_sources: the global dict you can define in your .vimrc found in
"         g:vim_addon_manager['plugin_sources']
"   www_vim_org: the sources found on www.vim.org which are defined in this file
"   scm_plugin_sources: additional sources which use a version control system
" You can override this function by assigning
" g:vim_addon_manager['MergeSources']
fun! vam_known_repositories#MergeSources(plugin_sources, www_vim_org, scm_plugin_sources)
  " merge www.vim.org sources

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
  "
  let merge_strategy = get(s:c, 'scm_merge_strategy', 'force')
  if merge_strategy != 'never'

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
