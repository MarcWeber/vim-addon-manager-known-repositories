fun! vamkr#patch#Patch(www_vim_org_sources)
  let d = a:www_vim_org_sources
  " add / correct some types:
  let d.vim_script_nr_2527['script-type'] = 'ftplugin'
  let d.vim_script_nr_1542['target_dir'] = 'autoload'
  let d.vim_script_nr_1542['script-type'] = 'autoload'
  let d.vim_script_nr_1686['script-type'] = 'colors'
  let d.vim_script_nr_2572['strip-components'] = 0
  let d.vim_script_nr_2429['strip-components'] = 0
  let d.vim_script_nr_2150['script-type'] = 'after/syntax'

  " plugin infos - written if the plugin doesn't ship one itself {{{

  " this is mainly used to add missing dependencies
  let s:mai_snr_deps.884 = [294]
  let s:mai_snr.663 = {'runtimepath': 'vim'}
  " let d.missing_addon_infos['browser_4025'] = {'dependencies': {'synmark':{}}, 'runtimepath': 'vim'}
  "}}}

  " fix target directories {{{1
  let d['rubycomplete']['target_dir'] = 'autoload'

  let d['xptemplate']['strip-components'] = 0

  let d['scala']['script-type'] = 'syntax'

  " deprecations {{{1
  let d.vim_script_nr_1780['deprecated'] = "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"
  let d.vim_script_nr_1662['deprecated'] = "you should consider using ruby-vim instead"
  let d.vim_script_nr_113['deprecated'] = "greputils supersedes this plugin"

  let d.vim_script_nr_2540['deprecated'] = "snipMate is an alias to snipmate now - so use 'snipmate'"
  let d['lazysnipmate']['deprecated'] = "lazysnipmate’s update is just snipmate"
  let d.vim_script_nr_2736['deprecated'] = "consider using syntastic2 because it is easier to adopt its behaviour to your needs"

  let d.vim_script_nr_3184['deprecated'] = "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"
  let d.vim_script_nr_3325['deprecated'] = "All functions from this plugin are available through `os' resource of @/os frawor module"
  let d.vim_script_nr_3187['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
  let d.vim_script_nr_3188['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
  let d.vim_script_nr_3186['deprecated'] = "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"

  let d.vim_script_nr_727['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
  let d.vim_script_nr_441['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
  let d.vim_script_nr_3393['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"

  let d.vim_script_nr_1318['deprecated'] = "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"
endf
