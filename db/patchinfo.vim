" See documentation at vamkr#GetVim
let add_by_snr = {}
let mai_snr = {}
let mai_snr_deps = {}
"▶1 Hooks
let hook = 'execute "lcd" fnameescape(%d."/ruby/command-t") | call vam#utils#RunShell("ruby extconf.rb") | call vam#utils#RunShell("make") | lcd -'
let mai_snr.3025 = {}
let mai_snr.3025['post-install-hook']     = hook
let mai_snr.3025['post-update-hook']      = hook
let mai_snr.3025['post-scms-update-hook'] = hook
unlet hook

" Assuming that system is used right and current user does not have priveleges 
" to write to this directory by default
let hook = 'echohl WarningMsg | echom "Copy vimtweak.dll to the same directory with gvim.exe" | echohl None'
let mai_snr.687 = {}
let mai_snr.687['post-install-hook']     = hook
let mai_snr.687['post-update-hook']      = hook
let mai_snr.687['post-scms-update-hook'] = hook
unlet hook

let hook = 'execute "lcd" fnameescape(%d."/smartgrep") | call vam#utils#RunShell("make") | lcd -'
let mai_snr.4295 = {}
let mai_snr.4295['post-install-hook']     = hook
let mai_snr.4295['post-update-hook']      = hook
let mai_snr.4295['post-scms-update-hook'] = hook
unlet hook

let hook = 'execute "lcd" fnameescape(%d."/plugin") | call vam#utils#RunShell("make") | lcd -'
let mai_snr.4384 = {}
let mai_snr.4384['post-install-hook']     = hook
let mai_snr.4384['post-update-hook']      = hook
let mai_snr.4384['post-scms-update-hook'] = hook
unlet hook
"▶1 Wrong archive names
" Author wrote that contents of vert.txt should go to vimrc, but it should work 
" fine as a script in plugin directory
let mai_snr.1742={'archive_name': 'vert.vim'}
"▶1 Type corrections
let add_by_snr.2368={'script-type': 'plugin'}
let add_by_snr.1638={'script-type': 'plugin'}
let add_by_snr.3868={'script-type': 'plugin'}
let add_by_snr.1780={'script-type': 'syntax'}
let add_by_snr.1686={'script-type': 'colors'}
let add_by_snr.2527={'script-type': 'ftplugin'}
let add_by_snr.1542={'script-type': 'autoload'}
let add_by_snr.2150={'script-type': 'after/syntax'}
let add_by_snr.2548={'script-type': 'after/syntax'}
let add_by_snr.2224={'script-type': 'after/syntax'}
let add_by_snr.2493={'script-type': 'after/syntax'}
let add_by_snr.4388={'script-type': 'ftplugin'}
"▶1 Fixing target directories
call extend(add_by_snr.1542, {'target_dir': 'autoload'})
let add_by_snr.1662={'target_dir': 'autoload'}
let add_by_snr.2611={'strip-components': 0}
let add_by_snr.2572={'strip-components': 0}
let add_by_snr.2429={'strip-components': 0}
"▶1 Deprecations
call extend(add_by_snr.1780, {'deprecated': "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"})
call extend(add_by_snr.1662, {'deprecated': "you should consider using ruby-vim instead"})
let add_by_snr.113 ={'deprecated': "greputils supersedes this plugin"}

let add_by_snr.143 ={'deprecated': "Merged into lh-vim-lib (vimscript #214)"}

let add_by_snr.3432={'deprecated': "lazysnipmate’s update is just snipmate"}

let add_by_snr.1963={'deprecated': "This was one of my biggest mistakes. This library won't be maintained. I'm mvoing contents into individual plugins slowly. Its just bloat"}

let add_by_snr.3184={'deprecated': "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"}
let add_by_snr.3325={'deprecated': "All functions from this plugin are available through `os' resource of @/os frawor module"}
let add_by_snr.3187={'deprecated': "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3188={'deprecated': "Deprecated in favour of FWC DSL defined in frawor plugin"}
let add_by_snr.3186={'deprecated': "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"}

let add_by_snr.1318={'deprecated': "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"}
let add_by_snr.2540={'deprecated': "snipMate is an alias to snipmate now - so use 'snipmate'"}

let add_by_snr.1272={'deprecated': "Superseded by vimscript #1431 (checksyntax)"}
let add_by_snr.3233={'deprecated': "Superseded by Buffersaurus (vimscript #3620)"}
let add_by_snr.3134={'deprecated': "This functionality has been rolled into tpope's vim-rvm"}
let add_by_snr.108 ={'deprecated': "Superseded by vimscript #197 (genutils)"}
let add_by_snr.1815={'deprecated': "This file is out of date and is now included in the Windows PowerShell Syntax Plugin package (vimscript #1327)"}
let add_by_snr.1816={'deprecated': "This file is out of date and is now included in the Windows PowerShell Syntax Plugin package (vimscript #1327)"}
let add_by_snr.2518={'deprecated': "This plugin has been replaced with the HyperList plugin (vimscript #4006)"}

let add_by_snr.3874={'deprecated': "This script is no longer supported. Please use the matchit.vim plugin (already bundled with vim > 7) instead."}
let add_by_snr.287 ={'deprecated': "This script has been retired. You should use #273"}
let add_by_snr.2765={'deprecated': "Maintainer has changed. You should use #4452 (vim-javascript) now"}

let add_by_snr.2554={'deprecated': "Author says it is buggy and thus should not be used"}

let add_by_snr.2850={'deprecated': "Functionality of this plugin is present in current NERDTree version"}

let add_by_snr.103 ={'deprecated': "This plugin states that it requires Johannes Zellner's ScratchBuffer.vim plugin, but it is not available"}
let add_by_snr.159 ={'deprecated': "No more maintained, use “minibufexplorer” instead. Requires git or you’ll have vimscript #3239 from vim.org which is itself deprecated (changed maintainer, new one posts only to git)"}

let add_by_snr.3901={'deprecated': "Accident (?) duplicate of vimscript #3900"}
let add_by_snr.4577={'deprecated': "Accident (?) duplicate of vimscript #4576"}

let add_by_snr.3881={'deprecated': "Superseded by powerline (https://github.com/Lokaltog/powerline)"}
let add_by_snr.3524={'deprecated': "Script page and the only download suggest using git, but referenced repository is absent"}


let add_by_snr.3160={'deprecated': "According to github its superseded by vim-flake8 (vimscript #3927). You probably want to prefer syntastic anyway"}
let add_by_snr.3161={'deprecated': "According to github its superseded by vim-flake8 (vimscript #3927). You probably want to prefer syntastic anyway"}

let add_by_snr.2914={'deprecated': "Plugin seems to be no longer supported (last update 2 years ago (from Jan 2013)). Consider giving syntastic a try instead. It supports more backends"}
let add_by_snr.3430={'deprecated': "Plugin seems to be no longer supported (last update 1 year ago (from Jan 2013)). Consider giving syntastic a try instead. It supports more backends"}

let add_by_snr.4043={'deprecated': "The author recommends using neosnippet instead"}
"▶1 Missing dependencies
let mai_snr_deps.1984 = [3252]
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
let mai_snr_deps.2742 = [1839]
let mai_snr_deps.2997 = [293]
let mai_snr_deps.3729 = [3597]
let mai_snr_deps.3873 = [3023]
let mai_snr_deps.3961 = [4145]
let mai_snr_deps.3979 = [3431]
let mai_snr_deps.4079 = [4050, 4056]
let mai_snr_deps.4116 = [4115, 2544]
let mai_snr_deps.4117 = [4116]
let mai_snr_deps.4194 = [4193]
let mai_snr_deps.4222 = [2771]
let mai_snr_deps.4253 = [2646]
let mai_snr_deps.4283 = [3736]
let mai_snr_deps.4322 = [4321, 1359]
let mai_snr_deps.4463 = [2467]
let mai_snr_deps.4492 = [4491]
let mai_snr_deps.4511 = [3590]
let mai_snr_deps.4542 = [3736]
let mai_snr_deps.4532 = [3133, 'twibill']
" optional: 3396, 3476, unite-outline, vimproc, favstar-vim
" vimproc dependants
let mai_snr_deps.4336 = ['vimproc']
let mai_snr_deps.4473 = ['vimproc']
" ingo-library dependants
let mai_snr_deps.4449 = [4433]
let mai_snr_deps.4462 = [4433]
let mai_snr_deps.4465 = [4433, 4140]
" fugitive dependants
let mai_snr_deps.3509 = [2975]
let mai_snr_deps.3574 = [2975]
" CompleteHelper dependants
let mai_snr_deps.3915 = [3914]
let mai_snr_deps.4248 = [3914]
let mai_snr_deps.4265 = [3914]
let mai_snr_deps.4313 = [3914]
" MotionComplete dependants
let mai_snr_deps.4266 = [4265]
let mai_snr_deps.4267 = [4265]
" NERDTree plugins
let mai_snr_deps.4138 = [1658]
" Non-Kana textobj-user dependants
let mai_snr_deps.3382 = [2100, 39]
let mai_snr_deps.4304 = [2100]
let mai_snr_deps.4348 = [2100]
let mai_snr_deps.4458 = [2100, 'vim-gitgutter']
let mai_snr_deps.4508 = [2100]
let mai_snr_deps.4570 = [2100]
" getvar dependants
let mai_snr_deps.352  = [353, 354]
let mai_snr_deps.994  = [353]
let mai_snr_deps.2561 = [353]
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
let mai_snr_deps.4338 = [3130]
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
let mai_snr_deps.3854 = [3396]
let mai_snr_deps.3356 = [3396, 3133, 4019]
" webapi dependants
let mai_snr_deps.4143 = [4019]
" Neocomplcache plugins
let mai_snr_deps.3423 = [2620]
let mai_snr_deps.3440 = [2620]
let mai_snr_deps.4043 = [2620]
" let mai_snr_deps.4459 = [2620]
" Operator-user dependents
let mai_snr_deps.3046 = [2692]
let mai_snr_deps.3610 = [2692, 2944]
let mai_snr_deps.3312 = [2692]
let mai_snr_deps.3211 = [2692]
let mai_snr_deps.2782 = [2692]
" snipMate dependents
let mai_snr_deps.3249 = [2540]
let mai_snr_deps.3664 = [2540]
let mai_snr_deps.4276 = [2540, 2926]
" ▶2 Missing information for kana sources
let mai_snr_deps.2336 = [2335]
let mai_snr_deps.2403 = [2402]
let mai_snr_deps.3892 = [3891]
" Script 2782 above, in operator-user dependants
" ku dependants
let mai_snr_deps.2410 = [2337]
let mai_snr_deps.2622 = [2337]
let mai_snr_deps.2343 = [2337, 2338]
let mai_snr_deps.2344 = [2337, 2335, 2336]
" textobj-user dependants
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
"▶1 Missing runtimepath information for vim.org plugins
let mai_snr.2883 = {'runtimepath': 'vimlib'}
let mai_snr.2824 = {'runtimepath': 'vimlib'}
let mai_snr.2847 = {'runtimepath': 'vimlib'}
let mai_snr.663  = {'runtimepath': 'vim'}
call extend(mai_snr.4295, {'runtimepath': 'smartgrep'})
let r=[add_by_snr, mai_snr, mai_snr_deps]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr=▶,▲
