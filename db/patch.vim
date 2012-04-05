" See documentation at vamkr#GetVim
let add_by_snr={}
let add_by_name={}
let mai_snr = {}
let mai_snr_deps = {}
"▶1 Hooks
let mai_snr.3025={'post-install-hook': 'execute "lcd" fnameescape(%d."/ruby/command-t") | call vam#utils#RunShell("ruby extconf.rb") | call vam#utils#RunShell("make") | lcd -'}
let mai_snr.3025['post-update-hook']=mai_snr.3025['post-install-hook']
let mai_snr.3025['post-scms-update-hook']=mai_snr.3025['post-install-hook']
"▶1 Wrong archive names
" Author wrote that contents of vert.txt should go to vimrc, but it should work 
" fine as a script in plugin directory
let mai_snr.1742={'archive_name': 'vert.vim'}
"▶1 Type corrections
let add_by_snr.2368={'script-type': 'plugin'}
let add_by_snr.1638={'script-type': 'plugin'}
let add_by_snr.2527={'script-type': 'ftplugin'}
let add_by_snr.1542={'script-type': 'autoload'}
let add_by_snr.1686={'script-type': 'colors'}
let add_by_snr.2150={'script-type': 'after/syntax'}
let add_by_snr.2548={'script-type': 'after/syntax'}
let add_by_snr.1780={'script-type': 'syntax'}
"▶1 Fixing target directories
let add_by_snr.1542={'target_dir': 'autoload'}
let add_by_snr.1662={'target_dir': 'autoload'}
let add_by_snr.2611={'strip-components' : 0}
let add_by_snr.2572={'strip-components' : 0}
let add_by_snr.2429={'strip-components' : 0}
"▶1 Deprecations
let add_by_snr.1780={'deprecated' : "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"}
let add_by_snr.1662={'deprecated' : "you should consider using ruby-vim instead"}
let add_by_snr.113 ={'deprecated' : "greputils supersedes this plugin"}

let add_by_name['lazysnipmate']={'deprecated' : "lazysnipmate’s update is just snipmate"}
" I'm not sure its fair deprecating the plugin - because behavior differs
" let add_by_snr.2736={'deprecated' : "consider using syntastic2 because it is easier to adopt its behaviour to your needs"}

let add_by_snr.3184={'deprecated' : "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"}
let add_by_snr.3325={'deprecated' : "All functions from this plugin are available through `os' resource of @/os frawor module"}
let add_by_snr.3187={'deprecated' : "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3188={'deprecated' : "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3186={'deprecated' : "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"}

let consider_valv="Consider using vim-addon-local-vimrc cause it provides simple hash protection and caches your replies"
let add_by_snr.727 ={'deprecated' : consider_valv}
let add_by_snr.441 ={'deprecated' : consider_valv}
let add_by_snr.3393={'deprecated' : consider_valv}

let add_by_snr.1318={'deprecated' : "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"}
let add_by_snr.2540={'deprecated' : "snipMate is an alias to snipmate now - so use 'snipmate'"}

let add_by_snr.1272={'deprecated' : "Superseeded by vimscript #1431 (checksyntax)"}
let add_by_snr.3233={'deprecated' : "Superseeded by Buffersaurus (vimscript #3620)"}
let add_by_snr.3134={'deprecated' : "This functionality has been rolled into tpope's vim-rvm"}
let add_by_snr.108 ={'deprecated' : "Superseeded by vimscript #197 (genutils)"}
let add_by_snr.1815={'deprecated' : "This file is out of date and is now included in the Windows PowerShell Syntax Plugin package (vimscript #1327)"}
let add_by_snr.1816={'deprecated' : "This file is out of date and is now included in the Windows PowerShell Syntax Plugin package (vimscript #1327)"}
let add_by_snr.2518={'deprecated' : "This plugin has been replaced with the HyperList plugin (vimscript #4006)"}

let add_by_snr.3874={'deprecated' : "This script is no longer supported. Please use the matchit.vim plugin(already bundled with vim > 7) instead."}
let add_by_snr.287 ={'deprecated' : "This script has been retired. You should use #273"}

let add_by_snr.2554={'deprecated' : "Author says it is buggy and thus should not be used"}

let add_by_snr.2850={'deprecated' : "Functionality of this plugin is present in current NERDTree version"}

let add_by_snr.103 ={'deprecated' : "This plugin states that it requires Johannes Zellner's ScratchBuffer.vim plugin, but it is not available"}

let add_by_snr.3901={'deprecated': "Accident (?) duplicate of vimscript #3900"}

let add_by_snr.3524={'deprecated': "Script page and the only download suggest using git, but referenced repository is absent"}

let prefer_flake8 = "According to github its superseded by vim-flake8 (vimscript #3927). You probably want to prefer syntastic anyway"
let add_by_snr.3160={'deprecated': prefer_flake8}
let add_by_snr.3161={'deprecated': prefer_flake8}

let suggest_syntastic="Consider giving syntastic a try instead. It supports more backends"
let add_by_snr.2441={'deprecated': suggest_syntastic}
let add_by_snr.2914={'deprecated': suggest_syntastic}
let add_by_snr.3430={'deprecated': suggest_syntastic}
let add_by_snr.3927={'deprecated': 'Also pay attention to alternative syntastic which runs flake and can do much more'}
"▶1 Missing dependencies
let mai_snr_deps.1984 = [3252]
let mai_snr_deps.3574 = [2975]
let mai_snr_deps.3509 = [2975]
let mai_snr_deps.2665 = [3464]
let mai_snr_deps.2972 = [2806, 2971]
let mai_snr_deps.884  = [294]
let mai_snr_deps.337  = [338]
let mai_snr_deps.746  = [745]
let mai_snr_deps.788  = [166]
let mai_snr_deps.1145 = [5]
let mai_snr_deps.1236 = [1235, 935]
let mai_snr_deps.1380 = [31]
let mai_snr_deps.1717 = [1603]
let mai_snr_deps.2561 = [353]
let mai_snr_deps.2742 = [1839]
let mai_snr_deps.2997 = [293]
let mai_snr_deps.3729 = [3597]
let mai_snr_deps.3915 = [3914]
let mai_snr_deps.3873 = [3023]
let mai_snr_deps.3961 = ['vim-rooter']
let mai_snr_deps.3979 = [3431]
" Non-Kana textobj-user dependants
let mai_snr_deps.3382 = [2100, 39]
" Writebackup dependants
let mai_snr_deps.1829 = [1828]
let mai_snr_deps.3107 = [1828]
let mai_snr_deps.3940 = [1828, 1829]
" Non-tom link tlib dependants
let mai_snr_deps.2141 = [1863]
" DfrankUtil dependants
let mai_snr_deps.3872 = [3884]
let mai_snr_deps.3221 = [3884, 3872]
" CountJump dependants
let mai_snr_deps.3179 = [3130]
let mai_snr_deps.3180 = [3130]
let mai_snr_deps.3181 = [3130]
let mai_snr_deps.3182 = [3130]
let mai_snr_deps.3719 = [3130]
let mai_snr_deps.3968 = [3130]
let mai_snr_deps.3990 = [3130]
let mai_snr_deps.3991 = [3130]
let mai_snr_deps.4003 = [3130]
let mai_snr_deps.4004 = [3130]
" VxLib dependants
let mai_snr_deps.2606 = [3061]
let mai_snr_deps.3060 = [3061]
" vsutil dependants
let mai_snr_deps.1038 = [1056]
let mai_snr_deps.1039 = [1056]
let mai_snr_deps.1054 = [1056]
let mai_snr_deps.1060 = [1056]
let mai_snr_deps.1091 = [1056]
" genutils dependants
let mai_snr_deps.107  = [197]
let mai_snr_deps.129  = [197]
let mai_snr_deps.171  = [197]
let mai_snr_deps.598  = [197]
let mai_snr_deps.745  = [197]
let mai_snr_deps.900  = [197]
let mai_snr_deps.953  = [197]
let mai_snr_deps.1014 = [197]
let mai_snr_deps.153  = [197, 166]
" genutils+multvals
let mai_snr_deps.113  = [197, 171]
let mai_snr_deps.158  = [197, 171]
let mai_snr_deps.533  = [197, 171]
let mai_snr_deps.568  = [197, 171]
let mai_snr_deps.1062 = [197, 171]
" multvals
let mai_snr_deps.564  = [171]
let mai_snr_deps.1321 = [171]
let mai_snr_deps.1386 = [171]
" let mai_snr_deps.889  = [171]
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
let mai_snr_deps.2782 = [2692]
" snipMate dependents
let mai_snr_deps.3249 = [2540]
let mai_snr_deps.3664 = [2540]
"▶1 Missing runtimepath information for vim.org plugins
let mai_snr.2883 = {'runtimepath': 'vimlib'}
let mai_snr.2824 = {'runtimepath': 'vimlib'}
let mai_snr.2847 = {'runtimepath': 'vimlib'}
let mai_snr.663  = {'runtimepath': 'vim'}
"▶1 Missing information for kana sources
let mai_snr_deps.2336 = [2335]
let mai_snr_deps.2403 = [2402]
let mai_snr_deps.3892 = [3891]
" Script 2782 above, in operator-user dependants
"▶2 ku dependants
let mai_snr_deps.2410 = [2337]
let mai_snr_deps.2622 = [2337]
let mai_snr_deps.2343 = [2337, 2338]
let mai_snr_deps.2344 = [2337, 2335, 2336]
"▶2 textobj-user dependants
let mai_snr_deps.2716 = [2100]
let mai_snr_deps.2484 = [2100]
let mai_snr_deps.2355 = [2100]
let mai_snr_deps.2276 = [2100]
let mai_snr_deps.2619 = [2100]
let mai_snr_deps.2275 = [2100]
let mai_snr_deps.2610 = [2100]
let mai_snr_deps.2415 = [2100]
let mai_snr_deps.2101 = [2100]
let mai_snr_deps.3886 = [2100]
"▲1
let r=[add_by_snr, add_by_name, mai_snr, mai_snr_deps]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr=▶,▲
