" See documentation at vamkr#GetVim
let add_by_snr={}
let add_by_name={}
let mai_snr = {}
let mai_snr_deps = {}
"▶1 Additional sources information, type corrections
let add_by_snr.2527={'script-type'      : 'ftplugin'}
let add_by_snr.1542={'target_dir'       : 'autoload'}
let add_by_snr.1542={'script-type'      : 'autoload'}
let add_by_snr.1686={'script-type'      : 'colors'}
let add_by_snr.2572={'strip-components' : 0}
let add_by_snr.2429={'strip-components' : 0}
let add_by_snr.2150={'script-type'      : 'after/syntax'}
let add_by_snr.2548={'script-type'      : 'after/syntax'}
let add_by_snr.1780={'script-type'      : 'syntax'}
"▶1 Fixing target directories
let add_by_snr.1662={'target_dir' : 'autoload'}
let add_by_snr.2611={'strip-components' : 0}
"▶1 Deprecations
let add_by_snr.1780={'deprecated' : "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"}
let add_by_snr.1662={'deprecated' : "you should consider using ruby-vim instead"}
let add_by_snr.113={'deprecated' : "greputils supersedes this plugin"}

let add_by_name['lazysnipmate']={'deprecated' : "lazysnipmate’s update is just snipmate"}
let add_by_snr.2736={'deprecated' : "consider using syntastic2 because it is easier to adopt its behaviour to your needs"}

let add_by_snr.3184={'deprecated' : "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"}
let add_by_snr.3325={'deprecated' : "All functions from this plugin are available through `os' resource of @/os frawor module"}
let add_by_snr.3187={'deprecated' : "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3188={'deprecated' : "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3186={'deprecated' : "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"}

let add_by_snr.727={'deprecated' : "consider using vim-addon-local-vimrc cause it provides simple hash protection"}
let add_by_snr.441={'deprecated' : "consider using vim-addon-local-vimrc cause it provides simple hash protection"}
let add_by_snr.3393={'deprecated' : "consider using vim-addon-local-vimrc cause it provides simple hash protection"}

let add_by_snr.1318={'deprecated' : "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"}
let add_by_snr.2540={'deprecated' : "snipMate is an alias to snipmate now - so use 'snipmate'"}

let add_by_snr.1272={'deprecated' : "Superseeded by vimscript #1431 (checksyntax)"}
let add_by_snr.3233={'deprecated' : "Superseeded by Buffersaurus (vimscript #3620)"}
let add_by_snr.3134={'deprecated' : "This functionality has been rolled into tpope's vim-rvm"}

let add_by_snr.2554={'deprecated' : "Author says it is buggy and thus should not be used"}

let add_by_snr.2850={'deprecated' : "Functionality of this plugin is present in current NERDTree version"}
"▶1 Missing dependencies
let mai_snr_deps.1984  = [3252]
let mai_snr_deps.3574 = [2975]
let mai_snr_deps.3509 = [2975]
let mai_snr_deps.3382 = [39, 2100]
let mai_snr_deps.2665 = [3464]
let mai_snr_deps.2972 = [2806, 2971]
" Unite.vim plugins
let mai_snr_deps.3318 = [3396]
let mai_snr_deps.3319 = [3396]
let mai_snr_deps.3330 = [3396]
let mai_snr_deps.3348 = [3396]
let mai_snr_deps.3356 = [3396, 3133, 'webapi-vim']
let mai_snr_deps.3854 = [3396]
" Neocemplcache plugins
let mai_snr_deps.3423 = [2620]
let mai_snr_deps.3440 = [2620]
" Operator-user dependents
let mai_snr_deps.3046 = [2692]
let mai_snr_deps.3610 = [2692, 2944]
let mai_snr_deps.3312 = [2692]
let mai_snr_deps.3211 = [2692]
" snipMate dependents
let mai_snr_deps.3249 = [2540]
let mai_snr_deps.3664 = [2540]
"▶1 Missing runtimepath information for vim.org plugins
let mai_snr.2883 = {'runtimepath': 'vimlib'}
let mai_snr.2824 = {'runtimepath': 'vimlib'}
let mai_snr.2847 = {'runtimepath': 'vimlib'}
let mai_snr.663  = {'runtimepath': 'vim'}
"▶1 Missing information for SCM sources
let add_by_name['vimshell'] = {'addon-info': {'dependencies': {'vimproc': {}}}}
let add_by_name['codefellow'] = {'addon-info': {'runtimepath': 'vim'}}
let add_by_name['ideone'] = {'addon-info': {'dependencies': {"webapi-vim": {}}}}
let add_by_name['sparkup'] = {'addon-info': {'runtimepath': 'vim'}}
"▶1 Missing information for kana sources
for [n, na] in vamkr#GetJSON('_kana_github_vimorg_name')
  if n =~ 'vim-textobj-\%(user\)\@!'
    let add_by_name[na] = {'addon-info': {'dependencies': {'textobj-user': {}}}}
  endif
endfor
"▲1
let r=[add_by_snr, add_by_name, mai_snr, mai_snr_deps]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr=▶,▲
