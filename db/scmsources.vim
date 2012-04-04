" See documentation at vamkr#GetVim
" custom plugins - drop me an email to get you repository added
let scm = {}

" scmnr: add version controlled sources to plugins also known by www.vim.org
let scmnr = {}

" Marc Weber
let scmnr.3429 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sml'}
let scmnr.1582 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-background-cmd'}
" let scmnr.1963 = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let scmnr.2376 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sql'}
let scmnr.2934 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-actions'}
let scmnr.2933 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-fcsh'}
let scmnr.2940 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-mw-utils'}
let scmnr.3018 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-completion'}
let scmnr.3124 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sbt'}
let scmnr.3143 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-haxe'}
let scmnr.3199 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ocaml'}
let scmnr.3307 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-async'}
let scmnr.3315 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-json-encoding'}
let scmnr.3317 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-signs'}
let scmnr.3320 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-xdebug'}
let scmnr.3432 = {'type': 'git', 'url': 'git://github.com/garbas/vim-snipmate.git'}
let scmnr.3916 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
let scmnr.3977 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-commenting'}
let scm['theonevimlib'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let scm['vim-addon-lout'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
let scm['vim-addon-urweb'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-urweb'}
let scm['vim-addon-swfmill'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-swfmill'}
let scm['vim-addon-views'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-views'}
let scm['vim-addon-goto-thing-at-cursor'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-goto-thing-at-cursor'}
let scm['scion-backend-vim'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/scion-backend-vim'}
let scm['vim-addon-nix'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-nix'}
let scm['vim-addon-scala'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-scala'}
let scm['vim-addon-git'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-git'}
let scm['vim-addon-povray'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-povray'}
let scm['vim-addon-toggle-buffer'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-toggle-buffer'}
let scm['vim-addon-other'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-other'}
let scm['vim-addon-php-manual'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-php-manual'}
let scm['vim-addon-local-vimrc'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-local-vimrc'}
let scm['syntastic2'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/syntastic2'}
let scm['snipmate'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
let scm['vim-ruby'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-ruby'}
let scm['SmartTag'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/SmartTag'}
let scm['ensime'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/ensime', 'branch': 'master-vim-cleaned-up'}
" override snipmate. There is really no reason anymore to use the old version
" snipMate could be dropped. Keep alias
let scmnr.2540 = copy(scm['snipmate'])

" Kana Natsuno
let scmnr.2425 = {'type': 'git', 'url': 'git://github.com/kana/vim-arpeggio'}
let scmnr.2100 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-user'}
let scmnr.2675 = {'type': 'git', 'url': 'git://github.com/kana/vim-altercmd'}
let scmnr.2098 = {'type': 'git', 'url': 'git://github.com/kana/vim-fakeclip'}
let scmnr.2692 = {'type': 'git', 'url': 'git://github.com/kana/vim-operator-user'}
let scmnr.3012 = {'type': 'git', 'url': 'git://github.com/kana/vim-vspec'}
let scmnr.2785 = {'type': 'git', 'url': 'git://github.com/kana/vim-wwwsearch'}
let scmnr.2716 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-syntax'}
let scmnr.2484 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-indent'}
let scmnr.2782 = {'type': 'git', 'url': 'git://github.com/kana/vim-operator-replace'}
let scmnr.2773 = {'type': 'git', 'url': 'git://github.com/kana/vim-grex'}
let scmnr.2355 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-lastpat'}
let scmnr.2276 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-jabraces'}
let scmnr.2619 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-function'}
let scmnr.2275 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-fold'}
let scmnr.2610 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-entire'}
let scmnr.2415 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-diff'}
let scmnr.1697 = {'type': 'git', 'url': 'git://github.com/kana/vim-surround'}
let scmnr.2467 = {'type': 'git', 'url': 'git://github.com/kana/vim-submode'}
let scmnr.2470 = {'type': 'git', 'url': 'git://github.com/kana/vim-smartword'}
let scmnr.2673 = {'type': 'git', 'url': 'git://github.com/kana/vim-smarttill'}
let scmnr.2290 = {'type': 'git', 'url': 'git://github.com/kana/vim-smartchr'}
let scmnr.2291 = {'type': 'git', 'url': 'git://github.com/kana/vim-skeleton'}
let scmnr.2136 = {'type': 'git', 'url': 'git://github.com/kana/vim-repeat'}
let scmnr.2335 = {'type': 'git', 'url': 'git://github.com/kana/vim-metarw'}
let scmnr.2336 = {'type': 'git', 'url': 'git://github.com/kana/vim-metarw-git'}
let scmnr.2274 = {'type': 'git', 'url': 'git://github.com/kana/vim-flydiff'}
let scmnr.2857 = {'type': 'git', 'url': 'git://github.com/kana/vim-exjumplist'}
let scmnr.2338 = {'type': 'git', 'url': 'git://github.com/kana/vim-bundle'}
let scmnr.2101 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-datetime'}
let scmnr.2403 = {'type': 'git', 'url': 'git://github.com/kana/vim-stackreg'}
let scmnr.2455 = {'type': 'git', 'url': 'git://github.com/kana/vim-outputz'}
let scmnr.2514 = {'type': 'git', 'url': 'git://github.com/kana/vim-ctxabbr'}
let scmnr.2402 = {'type': 'git', 'url': 'git://github.com/kana/vim-advice'}
let scmnr.2622 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-quickfix'}
let scmnr.2344 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-metarw'}
let scmnr.2343 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-bundle'}
let scmnr.2410 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-args'}
let scmnr.2337 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku'}
let scmnr.2097 = {'type': 'git', 'url': 'git://github.com/kana/vim-narrow'}
let scmnr.2099 = {'type': 'git', 'url': 'git://github.com/kana/vim-xml-autons'}
let scmnr.2107 = {'type': 'git', 'url': 'git://github.com/kana/vim-scratch'}
let scmnr.2858 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-fatpack'}
let scmnr.3886 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-line'}
let scmnr.3891 = {'type': 'git', 'url': 'git://github.com/kana/vim-gf-user'}
let scmnr.3892 = {'type': 'git', 'url': 'git://github.com/kana/vim-gf-diff'}
" The following plugins are not present on vim.org:
let scm['exfiletype'] = {'type': 'git', 'url': 'git://github.com/kana/vim-exfiletype'}
let scm['xml-move'] = {'type': 'git', 'url': 'git://github.com/kana/vim-xml-move'}
let scm['vcsi'] = {'type': 'git', 'url': 'git://github.com/kana/vim-vcsi'}
let scm['textobj-django-template'] = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-django-template', 'dependencies': {'%2100': {}}}
let scm['flymake'] = {'type': 'git', 'url': 'git://github.com/kana/vim-flymake'}

" Honza Pokorny
" snipmate-snippets depends on snipmate so installing the snippets should be 
" enough
let scmnr.3633 = {'type': 'git', 'url': 'git://github.com/honza/snipmate-snippets'}

" Peter Odding
let scmnr.2252 = {'type': 'git', 'url': 'git://github.com/xolox/vim-publish'}
let scmnr.3104 = {'type': 'git', 'url': 'git://github.com/xolox/vim-pyref'}
let scmnr.3150 = {'type': 'git', 'url': 'git://github.com/xolox/vim-session'}
let scmnr.3114 = {'type': 'git', 'url': 'git://github.com/xolox/vim-easytags'}
let scmnr.3123 = {'type': 'git', 'url': 'git://github.com/xolox/vim-shell'}
let scmnr.3148 = {'type': 'git', 'url': 'git://github.com/xolox/vim-reload'}
let scmnr.3169 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-inspect'}
let scmnr.3375 = {'type': 'git', 'url': 'git://github.com/xolox/vim-notes'}
let scmnr.3625 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-ftplugin'}

" Ciaran McCreesh
let scmnr.1876 = {'type': 'git', 'url': 'git://github.com/ciaranm/securemodelines'}
let scmnr.1143 = {'type': 'git', 'url': 'git://github.com/ciaranm/inkpot'}
let scmnr.1171 = {'type': 'git', 'url': 'git://github.com/ciaranm/detectindent'}

" Shougo
let scmnr.2620 = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache'}
let scmnr.3396 = {'type': 'git', 'url': 'git://github.com/Shougo/unite.vim'}
" The following plugins are not present on vim.org:
let scm['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell', 'addon-info': {'dependencies': {'vimproc': {}}}}
let scm['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
let scm['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
let scm['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
let scm['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}
let scm['neocomplcache-snippets-complete'] = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache-snippets-complete', 'addon-info': {'dependencies': {'%2620': {}}}}

" ZyX
let scmnr.3056 = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
let scmnr.3185 = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
let scmnr.3113 = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
let scmnr.3189 = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
let scmnr.3190 = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
let scmnr.3631 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/frawor'}
let scmnr.3828 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}
" The following plugin is not present on vim.org:
let scm['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}

" David Terei
let scmnr.3022 = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}
" It is not a copy-paste bug, description of both plugins point to the same 
" repository
let scmnr.2828 = {'type': 'git', 'url': 'git://github.com/dterei/VimCobaltColourScheme'}
let scmnr.3439 = {'type': 'git', 'url': 'git://github.com/dterei/VimCobaltColourScheme'}

" Tim Pope
let scmnr.1590 = {'type': 'git', 'url': 'git://github.com/tpope/vim-unimpaired'}
let scmnr.2386 = {'type': 'git', 'url': 'git://github.com/tpope/vim-endwise'}
let scmnr.1697 = {'type': 'git', 'url': 'git://github.com/tpope/vim-surround'}
let scmnr.2973 = {'type': 'git', 'url': 'git://github.com/tpope/vim-cucumber'}
let scmnr.1567 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rails'}
let scmnr.2975 = {'type': 'git', 'url': 'git://github.com/tpope/vim-fugitive'}
let scmnr.1433 = {'type': 'git', 'url': 'git://github.com/tpope/vim-haml'}
let scmnr.1654 = {'type': 'git', 'url': 'git://github.com/tpope/vim-git'}
let scmnr.2332 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pathogen'}
let scmnr.1896 = {'type': 'git', 'url': 'git://github.com/tpope/vim-ragtag'}
let scmnr.2136 = {'type': 'git', 'url': 'git://github.com/tpope/vim-repeat'}
let scmnr.1891 = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
let scmnr.2120 = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
let scmnr.1617 = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
let scmnr.1545 = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
let scmnr.1624 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
let scmnr.3695 = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
let scmnr.3669 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
" The following plugin is not present on vim.org:
let scm['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}
let scm['vim-rvm'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-rvm'}
let scm['markdown@tpope'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}
" " The following plugin is present on vim.org, but does not belong to Tim Pope
" let scmnr.1626 = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}

" Marty Grenfell
let scmnr.1218 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
let scmnr.1658 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
let scmnr.2736 = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

" Viktor Kojouharov
"tiagofalcao asked me to add the svn source:
let scmnr.1702 = {'type': 'svn', 'url': 'http://svn.enlightenment.org/svn/e/trunk/edje/data/vim/'}

" Wincent Colaiuta
let scmnr.3025 = {'type': 'git', 'url': 'git://git.wincent.com/command-t'}

" Antonio Salazar Cardozo
let scmnr.2962 = {'type': 'git', 'url': 'git://github.com/Shadowfiend/liftweb-vim'}

" Nico Raffo
let scmnr.2771 = {'type': 'svn', 'url': 'http://conque.googlecode.com/svn/trunk/'}

" Almaz Karimov
let scmnr.3231 = {'type': 'hg', 'url': 'https://vim-pyinteractive-plugin.googlecode.com/hg/'}

" Steve Losh
let scmnr.3304 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/gundo.vim'}
let scmnr.3721 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/threesome.vim'}
let scmnr.4000 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/clam.vim'}
" The following plugin is not present on vim.org:
let scm['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}

" Kim Silkebækken
let scmnr.3526 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-easymotion'}
let scmnr.3529 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-distinguished'}
let scmnr.3881 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-powerline'}

" H Xu
let scmnr.3115 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/singlecompile'}
let scmnr.3219 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/projecttag'}
let scmnr.3301 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/trimblank'}
let scmnr.3434 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/iniparser'}
let scmnr.3492 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-g95.vim'}
let scmnr.3496 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-gfortran.vim'}
let scmnr.3497 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-ifort.vim'}
let scmnr.3506 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-pcc.vim'}
let scmnr.3747 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/syntax-dosini.vim'}
let scmnr.3899 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/indent-java.vim'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3608 = {'type': 'git', 'url': 'git://github.com/xuhdev/nautilus-py-vim'}

" Vincent T.
let scmnr.3606 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let scmnr.3707 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let scmnr.3596 = {'type': 'git', 'url': 'git://github.com/Vayn/Fanfou'}

" Vincent B
let scmnr.2653 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-cuteErrorMarker'}
let scmnr.2625 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-syntax-haskell-cabal'}
let scmnr.2846 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-haskellFold'}
let scmnr.3200 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-haskellConceal'}
let scmnr.2888 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-codeoverview'}
let scmnr.2672 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-hoogle'}
let scmnr.2837 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-powershellCall'}
let scmnr.2686 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-cuteTodoList'}

" Jie Wu
let scmnr.2627 = {'type': 'git', 'url': 'git://github.com/jwu/exvim'}

" Al Budden
let scmnr.2646 = {'type': 'git', 'url': 'git://github.com/abudden/TagHighlight'}
let scmnr.3950 = {'type': 'git', 'url': 'git://github.com/abudden/EasyColour'}

" Darrick Wiebe
let scmnr.2765 = {'type': 'git', 'url': 'git://github.com/pangloss/vim-javascript'}

" Steven Oliver
" All following four plugins are bundled inside one github repository
let scmnr.2745 = {'type': 'git', 'url': 'git://github.com/steveno/falconpl-vim'}
let scmnr.2752 = {'type': 'git', 'url': 'git://github.com/steveno/falconpl-vim'}
let scmnr.2762 = {'type': 'git', 'url': 'git://github.com/steveno/falconpl-vim'}
let scmnr.2763 = {'type': 'git', 'url': 'git://github.com/steveno/falconpl-vim'}

" Michael Hart
let scmnr.3659 = {'type': 'hg', 'url': 'https://bitbucket.org/mikehart/lycosaexplorer'}

" Preston Masion
let scmnr.3510 = {'type': 'hg', 'url': 'https://bitbucket.org/pentie/vimrepress'}

" Dejan Noveski
" This plugin has both mercurial and github repository. I have chosen to use 
" first one, but I have no idea which is original and which is generated 
" automatically
let scmnr.3416 = {'type': 'hg', 'url': 'https://bitbucket.org/dekomote/w3cvalidate.vim'}

" AJ V
let scmnr.2720 = {'type': 'hg', 'url': 'https://bitbucket.org/fallintothis/arc-vim'}

" Stephen Bach
let scmnr.1890 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}
" It is not a copy-paste bug, description of both plugins point to the same 
" repository
let scmnr.2050 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}

" Daniel Hofstetter
" The following plugin is not present on vim.org:
let scm['scss-syntax'] = {'type': 'git', 'url': 'git://github.com/cakebaker/scss-syntax.vim'}

" Barry Arthur
" The following plugin is not present on vim.org:
let scm['VimLint'] = {'type': 'git', 'url': 'git://github.com/dahu/VimLint'}

" Raimondi (Israel Chauca Fuentes):
let scmnr.3026 = {'type': 'git', 'url': 'git://github.com/Raimondi/PickAColor'}
let scmnr.2754 = {'type': 'git', 'url': 'git://github.com/Raimondi/delimitMate'}
" The following plugins are not present on vim.org:
" let scm['bufring'] = {'type': 'git', 'url': 'git://github.com/Raimondi/bufring'}

" Ned Konz
let scmnr.517 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" intuited - Ted
" The following plugins are not present on vim.org:
let scm['vim-vamoose'] = {'type': 'git', 'url': 'git://github.com/intuited/vim-vamoose'}
let scm['visdo'] = {'type': 'git', 'url': 'git://github.com/intuited/visdo'}

" beyondwords (github)
" The following plugin is not present on vim.org:
let scm['vim-twig'] = {'type': 'git', 'url': 'git://github.com/beyondwords/vim-twig'}

" Tom Link
let scmnr.2594 = {'type': 'git', 'url': 'git://github.com/tomtom/tmarks_vim'}
let scmnr.861 = {'type': 'git', 'url': 'git://github.com/tomtom/viki_vim'}
let scmnr.2033 = {'type': 'git', 'url': 'git://github.com/tomtom/trag_vim'}
let scmnr.2037 = {'type': 'git', 'url': 'git://github.com/tomtom/hookcursormoved_vim'}
let scmnr.1030 = {'type': 'git', 'url': 'git://github.com/tomtom/scalefont_vim'}
let scmnr.1915 = {'type': 'git', 'url': 'git://github.com/tomtom/tbibtools_vim'}
let scmnr.1160 = {'type': 'git', 'url': 'git://github.com/tomtom/tskeleton_vim'}
let scmnr.1173 = {'type': 'git', 'url': 'git://github.com/tomtom/tcomment_vim'}
let scmnr.1284 = {'type': 'git', 'url': 'git://github.com/tomtom/TortoiseSVN_vim'}
let scmnr.1751 = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
let scmnr.1431 = {'type': 'git', 'url': 'git://github.com/tomtom/checksyntax_vim'}
let scmnr.1730 = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}
let scmnr.2580 = {'type': 'git', 'url': 'git://github.com/tomtom/spec_vim'}
let scmnr.3013 = {'type': 'git', 'url': 'git://github.com/tomtom/tcommand_vim'}
let scmnr.1863 = {'type': 'git', 'url': 'git://github.com/tomtom/tlib_vim'}
let scmnr.1864 = {'type': 'git', 'url': 'git://github.com/tomtom/tmru_vim'}
let scmnr.1865 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectfiles_vim'}
let scmnr.1866 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectbuffer_vim'}
let scmnr.2014 = {'type': 'git', 'url': 'git://github.com/tomtom/ttoc_vim'}
let scmnr.2017 = {'type': 'git', 'url': 'git://github.com/tomtom/tregisters_vim'}
let scmnr.2018 = {'type': 'git', 'url': 'git://github.com/tomtom/ttags_vim'}
let scmnr.2040 = {'type': 'git', 'url': 'git://github.com/tomtom/tcalc_vim'}
let scmnr.2055 = {'type': 'git', 'url': 'git://github.com/tomtom/ttagecho_vim'}
let scmnr.2076 = {'type': 'git', 'url': 'git://github.com/tomtom/setsyntax_vim'}
let scmnr.2279 = {'type': 'git', 'url': 'git://github.com/tomtom/cmdlinehelp_vim'}
let scmnr.2292 = {'type': 'git', 'url': 'git://github.com/tomtom/linglang_vim'}
let scmnr.2437 = {'type': 'git', 'url': 'git://github.com/tomtom/shymenu_vim'}
let scmnr.2584 = {'type': 'git', 'url': 'git://github.com/tomtom/quickfixsigns_vim'}
let scmnr.3780 = {'type': 'git', 'url': 'git://github.com/tomtom/indentfolds_vim'}
let scmnr.2894 = {'type': 'git', 'url': 'git://github.com/tomtom/vikitasks_vim'}
let scmnr.2915 = {'type': 'git', 'url': 'git://github.com/tomtom/startup_profile_vim'}
let scmnr.2917 = {'type': 'git', 'url': 'git://github.com/tomtom/tplugin_vim'}
let scmnr.2991 = {'type': 'git', 'url': 'git://github.com/tomtom/rcom_vim'}
let scmnr.3051 = {'type': 'git', 'url': 'git://github.com/tomtom/vimform_vim'}
let scmnr.3214 = {'type': 'git', 'url': 'git://github.com/tomtom/presets_vim'}
let scmnr.3326 = {'type': 'git', 'url': 'git://github.com/tomtom/stakeholders_vim'}
let scmnr.3653 = {'type': 'git', 'url': 'git://github.com/tomtom/brep_vim'}
" The following plugins are not present on vim.org:
let scm['toptions'] = {'type': 'git', 'url': 'git://github.com/tomtom/toptions_vim'}
let scm['worksheet'] = {'type': 'git', 'url': 'git://github.com/tomtom/worksheet_vim'}
let scm['prototype'] = {'type': 'git', 'url': 'git://github.com/tomtom/prototype_vim'}

" Jakson Aquino
let scmnr.2628 = {'type': 'git', 'url': 'git://github.com/jcfaria/Vim-R-plugin'}

" Robert Gleeson
" The following plugin is not present on vim.org:
let scm['hammer.vim'] = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

" Nathanael Kane
let scmnr.3361 = {'type': 'git', 'url': 'git://github.com/nathanaelkane/vim-indent-guides'}

" Michael Sanders
let scmnr.2674 = {'type': 'git', 'url': 'git://github.com/msanders/cocoa.vim'}

" Devin Weaver (sukima)
let scmnr.301 = {'type': 'git', 'url': 'git://github.com/sukima/xmledit'}

" Thiago Alves
let scmnr.2009 = {'type': 'git', 'url': 'git://github.com/Townk/vim-autoclose'}

" Ethan Schoonover
let scmnr.3520 = {'type': 'git', 'url': 'git://github.com/altercation/vim-colors-solarized'}

" Manpreet Singh
let scmnr.1563 = {'type': 'git', 'url': 'git://github.com/junkblocker/patchreview-vim'}

" jonathan hartley
let scmnr.3281 = {'type': 'hg', 'url': 'https://bitbucket.org/tartley/vim_run_python_tests'}

" Shrikant Sharat Kandula
let scmnr.3285 = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-looks'}
" The following plugins are not present on vim.org:
let scm['t-syntax'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/t-syntax'}
" There is already another “gotofile” plugin on vim.org
let scm['gotofile@sharat87'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-gotofile'}

" ali va
" Yes, these are git repositories on bitbucket. Unfortunately, git:// URLs are 
" not supported.
let scmnr.3853 = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-dokuwiki'}
" The following plugin is not present on vim.org:
let scm['toggletoolbar'] = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-toggletoolbar'}

" Ryan Mechelke
let scmnr.3262 = {'type': 'hg', 'url': 'https://bitbucket.org/thetoast/diff-fold'}

" Roman Dobosz
let scmnr.3367 = {'type': 'hg', 'url': 'https://bitbucket.org/gryf/vimblogger_ft'}

" shellholic
let scmnr.3400 = {'type': 'hg', 'url': 'https://bitbucket.org/shellholic/vim-creole'}

" Ludovic Chabant
let scmnr.3861 = {'type': 'hg', 'url': 'https://bitbucket.org/ludovicchabant/vim-lawrencium'}

" Kosei Kitahara
let scmnr.2827 = {'type': 'hg', 'url': 'https://bitbucket.org/Surgo/rtm.vim'}

" Maxim Kim
let scmnr.2226 = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki', 'addon-info': {'runtimepath': 'src'}}

" Christian Ebert
let scmnr.1512 = {'type': 'hg', 'url': 'http://www.blacktrash.org/hg/screenpaste'}

" Ted Pavlic
" Note: it is not an actual vim script, it is a command-line (shell 
" command-line) utility:
let scmnr.2182 = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

" Jonas Kramer
let scmnr.2446 = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

" Rykka Krin
let scmnr.3597 = {'type': 'git', 'url': 'git://github.com/Rykka/ColorV'}
let scmnr.3729 = {'type': 'git', 'url': 'git://github.com/Rykka/vim-galaxy'}
let scmnr.3831 = {'type': 'git', 'url': 'git://github.com/Rykka/lastbuf.vim'}
let scmnr.3882 = {'type': 'git', 'url': 'git://github.com/Rykka/easydigraph.vim'}

" Andrew Radev
let scmnr.3613 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/splitjoin.vim'}
let scmnr.3771 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/tagfinder.vim'}
let scmnr.3745 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/linediff.vim'}
let scmnr.3826 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/simple_bookmarks.vim'}
let scmnr.3829 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/inline_edit.vim'}

" Radek Kowalski
let scmnr.3331 = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

" Vincent Velociter
let scmnr.3673 = {'type': 'git', 'url': 'git://github.com/veloce/vim-aldmeris'}
let scmnr.3865 = {'type': 'git', 'url': 'git://github.com/veloce/vim-behat'}

" Bogdan Popa
let scmnr.3484 = {'type': 'git', 'url': 'git://github.com/Bogdanp/pyrepl.vim'}
let scmnr.3617 = {'type': 'git', 'url': 'git://github.com/Bogdanp/quicksilver.vim'}

" Yo-An Lin
let scmnr.2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let scmnr.2885 = {'type': 'git', 'url': 'git://github.com/c9s/gsession.vim'}
let scmnr.2883 = {'type': 'git', 'url': 'git://github.com/c9s/growlnotify.vim'}
let scmnr.2824 = {'type': 'git', 'url': 'git://github.com/c9s/libperl.vim'}
let scmnr.2786 = {'type': 'git', 'url': 'git://github.com/c9s/cpan.vim'}
let scmnr.2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let scmnr.2847 = {'type': 'git', 'url': 'git://github.com/c9s/pod-helper.vim'}
let scmnr.2852 = {'type': 'git', 'url': 'git://github.com/c9s/perlomni.vim'}
let scmnr.2893 = {'type': 'git', 'url': 'git://github.com/c9s/filetype-completion.vim'}
let scmnr.2922 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let scmnr.2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let scmnr.2925 = {'type': 'git', 'url': 'git://github.com/c9s/apt-complete.vim'}
let scmnr.2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let scmnr.2958 = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
let scmnr.2959 = scmnr.2958
let scmnr.3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
let scmnr.2995 = {'type': 'git', 'url': 'git://github.com/c9s/colorselector.vim'}
let scmnr.3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
let scmnr.3544 = {'type': 'git', 'url': 'git://github.com/c9s/cascading.vim'}
" Following repository does not contain correct directory tree
" let scmnr.3005 = {'type': 'git', 'url': 'git://github.com/c9s/simple-commenter.vim'}
" The following plugins are not present on vim.org:
let scm['vim-dev-plugin'] = {'type': 'git', 'url': 'git://github.com/c9s/vim-dev-plugin'}
let scm['jifty'] = {'type': 'git', 'url': 'git://github.com/c9s/jifty.vim'}

" wei ko kao
let scmnr.3282 = {'type': 'git', 'url': 'git://github.com/othree/eregex.vim'}
let scmnr.3236 = {'type': 'git', 'url': 'git://github.com/othree/html5.vim'}
let scmnr.3232 = {'type': 'git', 'url': 'git://github.com/othree/html5-syntax.vim'}
let scmnr.3453 = {'type': 'git', 'url': 'git://github.com/othree/fecompressor.vim'}
let scmnr.3900 = {'type': 'git', 'url': 'git://github.com/othree/coffee-check.vim'}

" Rene de Zwart
let scmnr.1397 = {'type': 'git', 'url': 'git://github.com/othree/xml.vim'}

" David JH
let scmnr.2442 = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

" Micah Elliott
" Following repository does not contain correct directory tree
" let scmnr.1365 = {'type': 'git', 'url': 'git://gist.github.com/720355'}

" Kien Nguyen
let scmnr.3772 = {'type': 'git', 'url': 'git://github.com/kien/rainbow_parentheses.vim'}
let scmnr.3699 = {'type': 'git', 'url': 'git://github.com/kien/premailer.vim'}
let scmnr.3626 = {'type': 'git', 'url': 'git://github.com/kien/autosavesetting.vim'}
let scmnr.3696 = {'type': 'git', 'url': 'git://github.com/kien/prefixer.vim'}
let scmnr.3697 = {'type': 'git', 'url': 'git://github.com/kien/cssbaseline.vim'}
let scmnr.3698 = {'type': 'git', 'url': 'git://github.com/kien/html_emogrifier.vim'}
let scmnr.3736 = {'type': 'git', 'url': 'git://github.com/kien/ctrlp.vim'}
let scmnr.3960 = {'type': 'git', 'url': 'git://github.com/kien/tabman.vim'}

" Andy Dawson
let scmnr.3447 = {'type': 'git', 'url': 'git://github.com/AD7six/vim-activity-log'}
let scmnr.3887 = {'type': 'git', 'url': 'git://github.com/AD7six/vim-independence'}

" Caleb Cushing
" Following repository does not contain correct directory tree
" let scmnr.2409 = {'type': 'git', 'url': 'git://github.com/xenoterracide/sql_iabbr'}

" Zachary Michaels
let scmnr.2960 = {'type': 'git', 'url': 'git://github.com/mikezackles/Bisect'}

" Daniel Schauenberg
let scmnr.3582 = {'type': 'git', 'url': 'git://github.com/mrtazz/simplenote.vim'}

" Gustaf Sjoberg
let scmnr.3534 = {'type': 'git', 'url': 'git://github.com/strange/strange.vim'}

" Eustaquio Rangel de Oliveira Jr.
let scmnr.3308 = {'type': 'git', 'url': 'git://github.com/taq/vim-refact'}
let scmnr.1966 = {'type': 'git', 'url': 'git://github.com/taq/vim-ruby-snippets'}
let scmnr.2258 = {'type': 'git', 'url': 'git://github.com/taq/vim-git-branch-info'}
let scmnr.2567 = {'type': 'git', 'url': 'git://github.com/taq/vim-rspec'}

" Bryant Hankins
let scmnr.3243 = {'type': 'git', 'url': 'git://github.com/bryanthankins/vim-aspnetide'}

" Nick Reynolds
let scmnr.3650 = {'type': 'git', 'url': 'git://github.com/ndreynolds/vim-cakephp'}

" Javier Rojas
let scmnr.2968 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-nav'}
let scmnr.3156 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-syntax'}

" Taylor Hedberg
let scmnr.3723 = {'type': 'git', 'url': 'git://github.com/tmhedberg/SimpylFold'}
let scmnr.3724 = {'type': 'git', 'url': 'git://github.com/tmhedberg/indent-motion'}

" Susan Potter
let scmnr.3207 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-bundler'}
let scmnr.3488 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-rebar'}

" Vincent Driessen
let scmnr.3258 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyunit'}
let scmnr.3160 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pep8'}
let scmnr.3161 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyflakes'}
let scmnr.3166 = {'type': 'git', 'url': 'git://github.com/nvie/vim-togglemouse'}
let scmnr.3927 = {'type': 'git', 'url': 'git://github.com/nvie/vim-flake8'}

" Trevor Little
let scmnr.3507 = {'type': 'git', 'url': 'git://github.com/bundacia/ScreenPipe'}

" Enlil Dubenstein
let scmnr.3763 = {'type': 'git', 'url': 'git://github.com/dubenstein/vim-google-scribe'}

" Miller Medeiros
let scmnr.3786 = {'type': 'git', 'url': 'git://github.com/millermedeiros/vim-statline'}

" Yasuhiro Matsumoto
let scmnr.52 = {'type': 'git', 'url': 'git://github.com/mattn/calendar-vim'}
let scmnr.2981 = {'type': 'git', 'url': 'git://github.com/mattn/zencoding-vim'}
let scmnr.2423 = {'type': 'git', 'url': 'git://github.com/mattn/gist-vim'}
let scmnr.2678 = {'type': 'git', 'url': 'git://github.com/mattn/googlereader-vim'}
let scmnr.2948 = {'type': 'git', 'url': 'git://github.com/mattn/googlesuggest-complete-vim'}
let scmnr.3505 = {'type': 'git', 'url': 'git://github.com/mattn/pastebin-vim'}
let scmnr.3790 = {'type': 'git', 'url': 'git://github.com/mattn/sonictemplate-vim'}
let scmnr.3819 = {'type': 'git', 'url': 'git://github.com/mattn/lisper-vim'}
" Requires postupdate hook // though non-SCM source does also
let scmnr.687 = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
" The following plugins are not present on vim.org:
let scm['webapi-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
let scm['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
let scm['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}
let scm['wwwrenderer-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/wwwrenderer-vim'}
let scm['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim', 'addon-info': {'dependencies': {'webapi-vim': {}}}}

" Chris Yip
" Following repository does not contain correct directory tree
" let scmnr.3220 = {'type': 'git', 'url': 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'}

" Mike West
let scmnr.3766 = {'type': 'git', 'url': 'git://github.com/mikewest/vimroom'}

" Takeshi NISHIDA
let scmnr.2637 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scmfrontend'}
let scmnr.1879 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-autocomplpop'}
let scmnr.1984 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'}
let scmnr.2199 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-gauref'}
let scmnr.3252 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-l9'}
" The following plugins are not present on vim.org:
let scm['abolish#doc-ja'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-abolish-ja'}
let scm['dsary'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-dsary'}
let scm['fteval'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fteval'}
let scm['jabeige'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-jabeige'}
let scm['luciusmod'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-luciusmod'}
let scm['scriproject'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scriproject'}

" Tamas Kovacs
let scmnr.2531 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/slimv'}
let scmnr.3998 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/paredit'}

" Alessio Bolognino
let scmnr.3871 = {'type': 'git', 'url': 'git://github.com/molok/vim-smartusline'}
let scmnr.3905 = {'type': 'git', 'url': 'git://github.com/molok/vim-vombato-colorscheme'}

" Mick Koch
let scmnr.3590 = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
" Others were not included as they are absent on www.vim.org
let scmnr.50  = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let scmnr.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scmnr.229 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
let scmnr.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
" The following plugins are not present on vim.org:
" let scm['lh-vim-lib']          = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scm['build-tools-wrapper'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/BTW/trunk'}
let scm['lh-tags'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/tags/trunk'}
let scm['lh-dev'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/dev/trunk'}
let scm['lh-refactor'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/refactor/trunk'}
let scm['system-tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/system-tools/trunk'}
let scm['UT'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/UT/trunk'}
" Not owned by Luc Hermitte, but forked and enhanced...
" let scmnr.222 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}
let scm['mu-template@lh'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}

" Jan Larres
let scmnr.3465 = {'type': 'git', 'url': 'git://github.com/majutsushi/tagbar'}

" Jeet Sukumaran
let scmnr.3619 = {'type': 'git', 'url': 'git://github.com/jeetsukumaran/vim-buffergator'}
let scmnr.3620 = {'type': 'git', 'url': 'git://github.com/jeetsukumaran/vim-buffersaurus'}
let scmnr.3646 = {'type': 'git', 'url': 'git://github.com/jeetsukumaran/vim-filesearch'}

" Thomas Allen
let scmnr.2719 = {'type': 'git', 'url': 'git://github.com/tmallen/proj-vim'}
let scmnr.2424 = {'type': 'git', 'url': 'git://github.com/tmallen/transmit-vim'}
let scmnr.3163 = {'type': 'git', 'url': 'git://github.com/tmallen/endline-vim'}

" @kevinwatters
let scmnr.2441 = {'type': 'git', 'url': 'git://github.com/kevinw/pyflakes-vim'}

" Gunther Groenewege
" The following plugin is not present on vim.org:
let scm['vim-less'] = {'type': 'git', 'url':  'git://github.com/groenewege/vim-less'}

" Hallison Batista
let scmnr.2878 = {'type': 'git', 'url': 'git://github.com/hallison/vim-rdoc'}
let scmnr.2573 = {'type': 'git', 'url': 'git://github.com/hallison/vim-darkdevel'}
let scmnr.2882 = {'type': 'git', 'url': 'git://github.com/hallison/vim-markdown'}
let scmnr.2942 = {'type': 'git', 'url': 'git://github.com/hallison/vim-ruby-sinatra'}
let scmnr.3091 = {'type': 'git', 'url': 'git://github.com/edsono/vim-sessions'}

" Eric Van Dewoestine
let scmnr.1643 = {'type': 'git', 'url': 'git://github.com/ervandew/supertab'}
let scmnr.2711 = {'type': 'git', 'url': 'git://github.com/ervandew/screen'}
let scmnr.1093 = {'type': 'git', 'url': 'git://github.com/ervandew/archive'}
let scmnr.3661 = {'type': 'git', 'url': 'git://github.com/ervandew/lookup'}
let scmnr.3668 = {'type': 'git', 'url': 'git://github.com/ervandew/sgmlendtag'}

" Miles Sterrett
let scmnr.2571 = {'type': 'git', 'url': 'git://github.com/mileszs/apidock.vim'}
let scmnr.2572 = {'type': 'git', 'url': 'git://github.com/mileszs/ack.vim'}

" Bob Hiestand
let scmnr.90 = {'type': 'git', 'url': 'git://repo.or.cz/vcscommand'}

" Greg Sexton
let scmnr.3329 = {'type': 'git', 'url': 'git://github.com/gregsexton/VimCalc'}
let scmnr.3481 = {'type': 'git', 'url': 'git://github.com/gregsexton/Atom'}
let scmnr.3521 = {'type': 'git', 'url': 'git://github.com/gregsexton/Gravity'}
let scmnr.3574 = {'type': 'git', 'url': 'git://github.com/gregsexton/gitv'}
let scmnr.3818 = {'type': 'git', 'url': 'git://github.com/gregsexton/MatchTag'}

" Andreas Wålm
let scmnr.3576 = {'type': 'git', 'url': 'git://github.com/walm/jshint.vim'}

" Jezreel Ng
let scmnr.3509 = {'type': 'git', 'url': 'git://github.com/int3/vim-extradite'}
let scmnr.3504 = {'type': 'git', 'url': 'git://github.com/int3/vim-taglist-plus'}
let scmnr.3604 = {'type': 'git', 'url': 'git://github.com/int3/nicer-vim-regexps'}

" Sasha Koss
let scmnr.3387 = {'type': 'git', 'url': 'git://github.com/kossnocorp/perfect.vim'}
let scmnr.3300 = {'type': 'git', 'url': 'git://github.com/kossnocorp/up.vim'}
let scmnr.3362 = {'type': 'git', 'url': 'git://github.com/kossnocorp/janitor.vim'}

" Xavier Deguillard
let scmnr.3302 = {'type': 'git', 'url': 'git://github.com/Rip-Rip/clang_complete'}

" thinca
let scmnr.2931 = {'type': 'git', 'url': 'git://github.com/thinca/vim-fontzoom'}
let scmnr.2860 = {'type': 'git', 'url': 'git://github.com/thinca/vim-prettyprint'}
let scmnr.2834 = {'type': 'git', 'url': 'git://github.com/thinca/vim-template'}
let scmnr.2944 = {'type': 'git', 'url': 'git://github.com/thinca/vim-visualstar'}
let scmnr.3067 = {'type': 'git', 'url': 'git://github.com/thinca/vim-ref'}
let scmnr.3146 = {'type': 'git', 'url': 'git://github.com/thinca/vim-quickrun'}
let scmnr.3393 = {'type': 'git', 'url': 'git://github.com/thinca/vim-localrc'}
let scmnr.3879 = {'type': 'git', 'url': 'git://github.com/thinca/vim-ambicmd'}
" The following plugins are not present on vim.org:
let scm['rtputil'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-rtputil'}
let scm['logcat'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-logcat'}
let scm['editvar'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-editvar'}
let scm['partedit'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-partedit'}
let scm['unite-history'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-unite-history'}
let scm['textobj-comment'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-comment'}
let scm['vim-github'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-github'}
let scm['auto_source'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-auto_source'}
let scm['vim-scouter'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-scouter'}
let scm['poslist'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-poslist'}
let scm['vim-ft-vim_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-vim_fold'}
let scm['operator-sequence'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-operator-sequence'}
let scm['openbuf'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-openbuf'}
let scm['vim-vcs'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vcs'}
let scm['vim-ft-markdown_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-markdown_fold'}
let scm['vim-ft-svn_diff'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-svn_diff'}
let scm['textobj-function-perl'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-perl', 'dependencies': {'%2619': {}}}
let scm['textobj-function-javascript'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-javascript', 'dependencies': {'%2619': {}}}
let scm['textobj-between'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-between', 'dependencies': {'%2100': {}}}
let scm['vim-ft-rst_header'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-rst_header'}
let scm['vim-ft-diff_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-diff_fold'}
let scm['befunge'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-befunge'}
let scm['textobj-plugins'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-plugins', 'dependencies': {'%2619': {}, '%2100': {}}}
let scm['vparsec'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vparsec'}
let scm['tabrecent'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-tabrecent'}
let scm['qfreplace'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-qfreplace'}
let scm['ku_source'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ku_source', 'dependencies': {'%2337': {}}}
let scm['guicolorscheme@thinca'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-guicolorscheme'}

" Josh Adams
let scmnr.3464 = {'type': 'git', 'url': 'git://github.com/godlygeek/tabular'}
" The following plugins are not present on vim.org:
let scm['csapprox'] = {'type': 'git', 'url': 'git://github.com/godlygeek/csapprox'}
let scm['colorchart'] = {'type': 'git', 'url': 'git://github.com/godlygeek/colorchart'}
let scm['netlib'] = {'type': 'git', 'url': 'git://github.com/godlygeek/netlib'}
let scm['vim-plugin-bundling'] = {'type': 'git', 'url': 'git://github.com/godlygeek/vim-plugin-bundling'}
let scm['windowlayout'] = {'type': 'git', 'url': 'git://github.com/godlygeek/windowlayout'}

" drdr xp
let scmnr.2611 = {'type': 'git', 'url': 'git://github.com/drmingdrmer/xptemplate'}

" Holger Rapp
let scmnr.2715 = {'type': 'git', 'url': 'git://github.com/SirVer/ultisnips'}

" Bruno Michel
let scmnr.2416 = {'type': 'git', 'url': 'git://github.com/nono/jquery.vim'}

" Drew Neil
let scmnr.3382 = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-textobj-rubyblock'}
" The following plugin is not present on vim.org:
let scm['vim-pml'] = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-pml'}

" Scott Bronson
let scmnr.3201 = {'type': 'git', 'url': 'git://github.com/bronson/vim-trailing-whitespace'}
" The following plugin is not present on vim.org:
let scm['vim-toggle-wrap'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-toggle-wrap'}

" Chris Vertonghen
let scmnr.603 = {'type': 'git', 'url': 'git://github.com/chrisv/vim-chrisv'}

" eric johnson
" Also requires post-installation hook
let scmnr.663 = {'type': 'git', 'url': 'git://github.com/kablamo/VimDebug'}

" atsushi moriki
let scmnr.830 = {'type': 'git', 'url': 'git://github.com/petdance/vim-perl'}

" Niklas Lindström
let scmnr.328 = {'type': 'git', 'url': 'git://github.com/niklasl/vimheap'}
let scmnr.3417 = {'type': 'git', 'url': 'git://github.com/niklasl/vim-toner'}

" André Kelpe
let scmnr.910 = {'type': 'git', 'url': 'git://github.com/fs111/pydoc.vim'}

" John Wellesz
let scmnr.1120 = {'type': 'git', 'url': 'git://github.com/2072/PHP-Indenting-for-VIm'}

" Anders Thøgersen
let scmnr.1167 = {'type': 'git', 'url': 'git://github.com/aklt/vim-substitute'}
let scmnr.2564 = {'type': 'git', 'url': 'git://github.com/aklt/vim-simple_comments'}
let scmnr.3538 = {'type': 'git', 'url': 'git://github.com/aklt/plantuml-syntax'}

" Ben Williams
let scmnr.1242 = {'type': 'git', 'url': 'git://github.com/plasticboy/vim-markdown'}

" Oscar Hellström
let scmnr.1584 = {'type': 'git', 'url': 'git://github.com/oscarh/vimerl'}

" Andrey Vakarev
let scmnr.3746 = {'type': 'git', 'url': 'git://github.com/avakarev/vim-watchdog'}

" Kirill Klenov
let scmnr.3748 = {'type': 'git', 'url': 'git://github.com/klen/pylint-mode'}
let scmnr.3770 = {'type': 'git', 'url': 'git://github.com/klen/python-mode'}

" Rafael Kitover
let scmnr.2526 = {'type': 'git', 'url': 'git://github.com/rkitover/perl-vim-mxd'}
" Note: it is not an actual vim script, it is a command-line (shell 
" command-line) utility:
let scmnr.1723 = {'type': 'git', 'url': 'git://github.com/rkitover/vimpager'}

" Josh O'Rourke
let scmnr.1995 = {'type': 'git', 'url': 'git://github.com/jpo/vim-railscasts-theme'}
" Not present on github:
" let scmnr.2517 = {'type': 'git', 'url': 'git://github.com/jpo/vim-norwaytoday-theme'}

" Will Gray
let scmnr.2024 = {'type': 'git', 'url': 'git://github.com/graywh/vim-brew'}
" The following plugin does not have a separate repository:
let scmnr.2616 = {'url': 'https://github.com/graywh/dotfiles/raw/master/.vim/colors/graywh.vim', 'archive_name': 'graywh.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Michael Brown
let scmnr.2147 = {'type': 'git', 'url': 'git://github.com/mjbrownie/Trac.vim'}
let scmnr.2294 = {'type': 'git', 'url': 'git://github.com/mjbrownie/swapit'}
let scmnr.2999 = {'type': 'git', 'url': 'git://github.com/mjbrownie/django-template-textobjects'}
let scmnr.3000 = {'type': 'git', 'url': 'git://github.com/mjbrownie/html-textobjects'}
let scmnr.3010 = {'type': 'git', 'url': 'git://github.com/mjbrownie/delete-surround-html'}
let scmnr.3533 = {'type': 'git', 'url': 'git://github.com/mjbrownie/GetFilePlus'}
" The following plugins do not have normal directory structure:
let scmnr.2780 = {'url': 'https://github.com/mjbrownie/Python-Tag-Import/raw/master/python_tag_import.vim', 'archive_name': 'python_tag_import.vim', 'type': 'archive', 'script-type': 'utility'}
let scmnr.2781 = {'url': 'https://github.com/mjbrownie/django_helper.vim/raw/master/django_helper.vim', 'archive_name': 'django_helper.vim', 'type': 'archive', 'script-type': 'utility'}

" Victor Bogado da Silva Lins
let scmnr.2184 = {'type': 'git', 'url': 'git://github.com/bogado/file-line'}

" Brian Lewis
let scmnr.2212 = {'type': 'git', 'url': 'git://github.com/bsl/obviousmode'}

" Bruno Michel
let scmnr.2416 = {'type': 'git', 'url': 'git://github.com/nono/jquery.vim'}
let scmnr.2417 = {'type': 'git', 'url': 'git://github.com/nono/merb.vim'}
let scmnr.3638 = {'type': 'git', 'url': 'git://github.com/nono/vim-handlebars'}
" The following plugin is not present on vim.org:
" The following plugin does not have normal directory structure:
" This should possibly be named github_theme@nono
let scm['github_vim_scheme'] = {'url': 'https://github.com/nono/github_vim_theme/raw/master/github.vim', 'archive_name': 'github.vim', 'type': 'archive', 'script-type': 'color scheme'}

" ujihisa .
let scmnr.2419 = {'type': 'git', 'url': 'git://github.com/ujihisa/quickrun'}
let scmnr.2638 = {'type': 'git', 'url': 'git://github.com/ujihisa/blogger.vim'}
let scmnr.3318 = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-colorscheme'}
let scmnr.3319 = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-font'}
let scmnr.3330 = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-locate'}
let scmnr.3348 = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-gem'}
let scmnr.3358 = {'type': 'git', 'url': 'git://github.com/ujihisa/tabpagecolorscheme'}
let scmnr.3384 = {'type': 'git', 'url': 'git://github.com/ujihisa/shadow.vim'}
let scmnr.3410 = {'type': 'git', 'url': 'git://github.com/ujihisa/nclipper.vim'}
let scmnr.3423 = {'type': 'git', 'url': 'git://github.com/ujihisa/neco-ghc'}
let scmnr.3440 = {'type': 'git', 'url': 'git://github.com/ujihisa/neco-look'}
let scmnr.3614 = {'type': 'git', 'url': 'git://github.com/ujihisa/vimshell-ssh'}
" The following plugins are not present on vim.org:
let scm['vital'] = {'type': 'git', 'url': 'git://github.com/ujihisa/vital.vim'}
let scm['unite-haskellimport'] = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-haskellimport', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['neco-rubymf'] = {'type': 'git', 'url': 'git://github.com/ujihisa/neco-rubymf', 'addon-info': {'dependencies': {'%2620': {}}}}
let scm['neco-rake'] = {'type': 'git', 'url': 'git://github.com/ujihisa/neco-rake', 'addon-info': {'dependencies': {'%2620': {}}}}
let scm['repl'] = {'type': 'git', 'url': 'git://github.com/ujihisa/repl.vim', 'addon-info': {'dependencies': {'%2419': {}, 'vimshell': {}}}}
let scm['neco-drikin'] = {'type': 'git', 'url': 'git://github.com/ujihisa/neco-drikin', 'addon-info': {'dependencies': {'%2620': {}}}}
let scm['unite-launch'] = {'type': 'git', 'url': 'git://github.com/ujihisa/unite-launch', 'addon-info': {'dependencies': {'%3396': {}, '%2419': {}}}}
let scm['rdoc@ujihisa'] = {'type': 'git', 'url': 'git://github.com/ujihisa/rdoc.vim'}
let scm['correr'] = {'type': 'git', 'url': 'git://github.com/ujihisa/correr'}
let scm['unite-help'] = {'type': 'git', 'url': 'git://github.com/tsukkee/unite-help', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['ref-hoogle'] = {'type': 'git', 'url': 'git://github.com/ujihisa/ref-hoogle'}
let scm['vimshell-repl'] = {'type': 'git', 'url': 'git://github.com/ujihisa/vimshell-repl'}
" The following plugin does not have normal directory structure:
let scm['kami'] = {'url': 'https://github.com/ujihisa/vim-kami/raw/master/kami.vim', 'archive_name': 'kami.vim', 'type': 'archive', 'script-type': 'ftplugin'}

" tyru
let scmnr.3311 = {'type': 'git', 'url': 'git://github.com/tyru/savemap.vim'}
let scmnr.3197 = {'type': 'git', 'url': 'git://github.com/tyru/current-func-info.vim'}
let scmnr.3133 = {'type': 'git', 'url': 'git://github.com/tyru/open-browser.vim'}
let scmnr.2990 = {'type': 'git', 'url': 'git://github.com/tyru/stickykey.vim'}
let scmnr.2910 = {'type': 'git', 'url': 'git://github.com/tyru/restart.vim'}
let scmnr.3046 = {'type': 'git', 'url': 'git://github.com/tyru/operator-camelize.vim'}
let scmnr.3610 = {'type': 'git', 'url': 'git://github.com/tyru/operator-star.vim'}
let scmnr.3118 = {'type': 'git', 'url': 'git://github.com/tyru/skk.vim'}
let scmnr.3167 = {'type': 'git', 'url': 'git://github.com/tyru/regbuf.vim'}
let scmnr.3490 = {'type': 'git', 'url': 'git://github.com/tyru/visualctrlg.vim'}
let scmnr.3489 = {'type': 'git', 'url': 'git://github.com/tyru/urilib.vim'}
let scmnr.3615 = {'type': 'git', 'url': 'git://github.com/tyru/vimtemplate.vim'}
let scmnr.3312 = {'type': 'git', 'url': 'git://github.com/tyru/operator-html-escape.vim'}
let scmnr.2576 = {'type': 'git', 'url': 'git://github.com/tyru/winmove.vim'}
let scmnr.3294 = {'type': 'git', 'url': 'git://github.com/tyru/grass.vim'}
let scmnr.2783 = {'type': 'git', 'url': 'git://github.com/tyru/DumbBuf.vim'}
let scmnr.3211 = {'type': 'git', 'url': 'git://github.com/tyru/operator-reverse.vim'}
let scmnr.3273 = {'type': 'git', 'url': 'git://github.com/tyru/kirikiri.vim'}
let scmnr.2712 = {'type': 'git', 'url': 'git://github.com/tyru/sign-diff.vim'}
let scmnr.2605 = {'type': 'git', 'url': 'git://github.com/tyru/nextfile.vim'}
let scmnr.2989 = {'type': 'git', 'url': 'git://github.com/tyru/pummode.vim'}
let scmnr.2615 = {'type': 'git', 'url': 'git://github.com/tyru/vimtemplate.vim'}
" The following plugins are not present on vim.org:
let scm['caw'] = {'type': 'git', 'url': 'git://github.com/tyru/caw.vim'}
let scm['eskk'] = {'type': 'git', 'url': 'git://github.com/tyru/eskk.vim'}
let scm['make-cmdline-compl'] = {'type': 'git', 'url': 'git://github.com/tyru/make-cmdline-compl.vim'}
let scm['gravit'] = {'type': 'git', 'url': 'git://github.com/tyru/gravit.vim'}
let scm['merryxmas'] = {'type': 'git', 'url': 'git://github.com/tyru/merryxmas.vim'}
let scm['banban'] = {'type': 'git', 'url': 'git://github.com/tyru/banban.vim'}
let scm['emap'] = {'type': 'git', 'url': 'git://github.com/tyru/emap.vim'}
let scm['pacman'] = {'type': 'git', 'url': 'git://github.com/tyru/pacman.vim'}
let scm['ohmygrep'] = {'type': 'git', 'url': 'git://github.com/tyru/ohmygrep.vim'}
let scm['unite-cmdwin'] = {'type': 'git', 'url': 'git://github.com/tyru/unite-cmdwin', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['skkdict'] = {'type': 'git', 'url': 'git://github.com/tyru/skkdict.vim', 'addon-info': {'dependencies': {'%3118': {}}}}
let scm['simpletap'] = {'type': 'git', 'url': 'git://github.com/tyru/simpletap.vim', 'addon-info': {'dependencies': {'openbuf': {}}}}
let scm['cul'] = {'type': 'git', 'url': 'git://github.com/tyru/cul.vim'}
let scm['vice'] = {'type': 'git', 'url': 'git://github.com/tyru/vice.vim'}
let scm['quickey'] = {'type': 'git', 'url': 'git://github.com/tyru/quickey.vim'}
let scm['autocmd-tabclose'] = {'type': 'git', 'url': 'git://github.com/tyru/autocmd-tabclose.vim'}
let scm['dutil'] = {'type': 'git', 'url': 'git://github.com/tyru/dutil.vim'}
let scm['auto-source'] = {'type': 'git', 'url': 'git://github.com/tyru/auto-source.vim'}
let scm['init-loader'] = {'type': 'git', 'url': 'git://github.com/tyru/init-loader.vim'}
let scm['unretab'] = {'type': 'git', 'url': 'git://github.com/tyru/unretab.vim'}
let scm['prompt'] = {'type': 'git', 'url': 'git://github.com/tyru/prompt.vim'}
let scm['detect-coding-style'] = {'type': 'git', 'url': 'git://github.com/tyru/detect-coding-style.vim'}
let scm['tjs'] = {'type': 'git', 'url': 'git://github.com/tyru/tjs.vim'}
let scm['syslib'] = {'type': 'git', 'url': 'git://github.com/tyru/syslib.vim'}
let scm['undoclosewin'] = {'type': 'git', 'url': 'git://github.com/tyru/undoclosewin.vim'}
let scm['cmdwincomplete'] = {'type': 'git', 'url': 'git://github.com/tyru/cmdwincomplete.vim', 'addon-info': {'dependencies': {'%2620': {}}}}
let scm['wim'] = {'type': 'git', 'url': 'git://github.com/tyru/wim', 'addon-info': {'dependencies': {'wwwrenderer-vim': {}, 'openbuf': {}}}}

" Marcin Sztolcman
let scmnr.2492 = {'type': 'git', 'url': 'git://github.com/mysz/viblip'}

" Daniel Schierbeck
let scmnr.2488 = {'type': 'git', 'url': 'git://github.com/dasch/vim-rack'}

" NanoTech
let scmnr.2555 = {'type': 'git', 'url': 'git://github.com/nanotech/jellybeans.vim'}

" Eddie Carle
let scmnr.2570 = {'type': 'git', 'url': 'git://github.com/eddic/vimdecdef'}

" Joe Stelmach
let scmnr.2578 = {'type': 'git', 'url': 'git://github.com/joestelmach/javaScriptLint.vim'}

" Derek McLoughlin
let scmnr.2596 = {'type': 'git', 'url': 'git://github.com/derekmcloughlin/gvimfullscreen_win32'}

" jan
let scmnr.2612 = {'type': 'git', 'url': 'git://github.com/janx/vim-rubytest'}

" Doug McInnes
let scmnr.2869 = {'type': 'git', 'url': 'git://github.com/dmcinnes/ruby_single_test'}

" Teemu Matilainen
let scmnr.2900 = {'type': 'git', 'url': 'git://github.com/tmatilai/gitolite.vim'}

" Maciej Konieczny
let scmnr.2911 = {'type': 'git', 'url': 'git://github.com/narfdotpl/selfdot.vim'}

" Christian Brabandt
let scmnr.2709 = {'type': 'git', 'url': 'git://github.com/chrisbra/SudoEdit.vim'}
let scmnr.3075 = {'type': 'git', 'url': 'git://github.com/chrisbra/NrrwRgn'}
let scmnr.2822 = {'type': 'git', 'url': 'git://github.com/chrisbra/unicode.vim'}
let scmnr.2830 = {'type': 'git', 'url': 'git://github.com/chrisbra/csv.vim'}
let scmnr.2796 = {'type': 'git', 'url': 'git://github.com/chrisbra/CheckAttach'}
let scmnr.2932 = {'type': 'git', 'url': 'git://github.com/chrisbra/histwin.vim'}
let scmnr.3068 = {'type': 'git', 'url': 'git://github.com/chrisbra/Recover.vim'}
let scmnr.3216 = {'type': 'git', 'url': 'git://github.com/chrisbra/Replay'}
let scmnr.2992 = {'type': 'git', 'url': 'git://github.com/chrisbra/SaveSigns.vim'}
let scmnr.3052 = {'type': 'git', 'url': 'git://github.com/chrisbra/changesPlugin'}
let scmnr.2766 = {'type': 'git', 'url': 'git://github.com/chrisbra/Join'}
let scmnr.3298 = {'type': 'git', 'url': 'git://github.com/chrisbra/vim_faq'}
let scmnr.3877 = {'type': 'git', 'url': 'git://github.com/chrisbra/improvedft'}
let scmnr.3963 = {'type': 'git', 'url': 'git://github.com/chrisbra/color_highlight'}
let scmnr.3965 = {'type': 'git', 'url': 'git://github.com/chrisbra/DynamicSigns'}
" The following plugin does not have normal directory structure:
let scmnr.2998 = {'url': 'https://github.com/chrisbra/BackgroundColor.vim/raw/master/backgroundColor.vim', 'archive_name': 'backgroundColor.vim', 'type': 'archive', 'script-type': 'utility'}

" Francisco Garcia
let scmnr.2946 = {'type': 'git', 'url': 'git://github.com/fgarcia/agtd'}
let scmnr.3098 = {'type': 'git', 'url': 'git://github.com/fgarcia/pnote'}

" lilydjwg
let scmnr.3567 = {'type': 'git', 'url': 'git://github.com/lilydjwg/colorizer'}
" The following is not a vim plugin, but it is posted on vim.org:
" The following plugin does not have a separate repository:
let scmnr.2778 = {'type': 'git', 'url': 'git://github.com/lilydjwg/winterpy'}

" Andrei Nicholson
" The following plugin does not have normal directory structure:
let scmnr.2548 = {'url': 'https://github.com/tetsuo13/Vim-PHP-Doc/raw/master/php.vim', 'archive_name': 'php.vim', 'type': 'archive', 'script-type': 'after/syntax'}

" Shuhei Kubota
" The following plugins do not have normal directory structure:
let scmnr.2542 = {'url': 'https://bitbucket.org/shu/starrange/raw/default/starrange.vim', 'archive_name': 'starrange.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'StarRange'}
let scmnr.1283 = {'url': 'https://bitbucket.org/shu/tinybufferexplorer/raw/default/tbe.vim', 'archive_name': 'tbe.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'TinyBufferExplorer'}
let scmnr.1477 = {'url': 'https://bitbucket.org/shu/modeliner/raw/default/modeliner.vim', 'archive_name': 'modeliner.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Modeliner'}
let scmnr.2205 = {'url': 'https://bitbucket.org/shu/coremosearch/raw/default/coremo_search.vim', 'archive_name': 'coremo_search.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'CoremoSearch'}
let scmnr.3162 = {'url': 'https://bitbucket.org/shu/tabops/raw/default/tabops.vim', 'archive_name': 'tabops.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'tabops'}
let scmnr.2496 = {'url': 'https://bitbucket.org/shu/changed/raw/default/changed.vim', 'archive_name': 'changed.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Changed'}
let scmnr.2843 = {'url': 'https://bitbucket.org/shu/fliplr/raw/default/fliplr.vim', 'archive_name': 'fliplr.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'FlipLR'}
let scmnr.3640 = {'url': 'https://bitbucket.org/shu/theoldones/raw/default/theoldones.vim', 'archive_name': 'theoldones.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'The Old Ones'}

" Liam Cooke
let scmnr.3011 = {'type': 'git', 'url': 'git://github.com/inky/tumblr'}

" Michael Smith
let scmnr.3037 = {'type': 'git', 'url': 'git://github.com/michaeljsmith/vim-indent-object'}
" The following plugins are not present on vim.org:
let scm['vim-colours-dark-lord'] = {'type': 'git', 'url': 'git://github.com/michaeljsmith/vim-colours-dark-lord'}
let scm['vimdbg'] = {'type': 'git', 'url': 'git://github.com/michaeljsmith/vimdbg', 'addon-info': {'runtimepath': 'src'}}

" Robby Colvin
let scmnr.3077 = {'type': 'git', 'url': 'git://github.com/geetarista/ego.vim'}

" Clayton Parker
let scmnr.3057 = {'type': 'git', 'url': 'git://github.com/claytron/vimsizer'}
let scmnr.3290 = {'type': 'git', 'url': 'git://github.com/claytron/RevealExtends'}

" dos Santos
let scmnr.3092 = {'url': 'https://github.com/andre-luiz-dos-santos/autocomp/raw/master/autocomp.vim', 'archive_name': 'autocomp.vim', 'type': 'archive', 'script-type': 'utility'}

" Silas Silva
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3102 = {'type': 'git', 'url': 'git://github.com/silasdb/vplinst'}
let scmnr.3173 = {'type': 'hg', 'url': 'https://code.google.com/p/vimgcwsyntax'}

" David Munger
let scmnr.3108 = {'type': 'bzr', 'url': 'lp:vim-gui-box'}
let scmnr.3109 = {'type': 'bzr', 'url': 'lp:vim-latex-box'}

" Finlay Cannon
let scmnr.3110 = {'type': 'git', 'url': 'git://github.com/findango/mdxdotvim'}

" Steve Francia
let scmnr.3125 = {'type': 'git', 'url': 'git://github.com/spf13/PIV'}
" The following plugin is not present on vim.org:
let scm['Autostamp'] = {'type': 'git', 'url': 'git://github.com/spf13/Autostamp'}

" mihaly himics
let scmnr.3127 = {'url': 'https://github.com/trialsolution/gamsvim/raw/master/gams.vim', 'archive_name': 'gams.vim', 'type': 'archive', 'script-type': 'syntax'}

" Mario Gutierrez
" All following two plugins are bundled inside one github repository
let scmnr.3132 = {'type': 'git', 'url': 'git://github.com/mgutz/vim-colors'}
let scmnr.3347 = {'type': 'git', 'url': 'git://github.com/mgutz/vim-colors'}

" Christopher Sexton
let scmnr.3134 = {'type': 'git', 'url': 'git://github.com/csexton/rvm.vim'}
let scmnr.3938 = {'type': 'git', 'url': 'git://github.com/csexton/trailertrash.vim'}
" The following plugins are not present on vim.org:
let scm['jekyll'] = {'type': 'git', 'url': 'git://github.com/csexton/jekyll.vim'}
let scm['viceroy'] = {'type': 'git', 'url': 'git://github.com/csexton/viceroy'}

" Wannes Meert
let scmnr.3147 = {'type': 'git', 'url': 'git://github.com/wannesm/wmgraphviz.vim'}
let scmnr.3858 = {'type': 'git', 'url': 'git://github.com/wannesm/rmvim.vim'}
" The following plugins are not present on vim.org:
let scm['wmnusmv'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmnusmv.vim'}
let scm['wmnotes'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmnotes.vim'}
let scm['wmpycalc'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmpycalc.vim'}

" Yaroslav Korshak
let scmnr.3168 = {'type': 'git', 'url': 'git://github.com/yko/mojo.vim'}

" Shawn Biddle
let scmnr.3171 = {'type': 'git', 'url': 'git://github.com/shawncplus/phpcomplete.vim'}
let scmnr.3947 = {'type': 'git', 'url': 'git://github.com/shawncplus/skittles_berry'}
let scmnr.2924 = {'type': 'git', 'url': 'git://github.com/shawncplus/Vim-toCterm'}

" Miao Jiang
let scmnr.3227 = {'type': 'git', 'url': 'git://github.com/jiangmiao/simple-javascript-indenter'}
let scmnr.3598 = {'type': 'git', 'url': 'git://github.com/jiangmiao/advancer-abbreviation'}
let scmnr.3599 = {'type': 'git', 'url': 'git://github.com/jiangmiao/auto-pairs'}

" Mitchell Bowden
let scmnr.3228 = {'type': 'git', 'url': 'git://github.com/msbmsb/porter-stem.vim'}
let scmnr.3229 = {'type': 'git', 'url': 'git://github.com/msbmsb/stem-search.vim'}

" Dimitar Dimitrov
let scmnr.3237 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-blockinsert'}
let scmnr.3250 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-swap'}
let scmnr.3255 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-sequence'}
let scmnr.3284 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-quotes'}
" The following plugin does not have a separate repository:
let scmnr.3456 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vimfiles', 'addon-info': {'runtimepath': 'bundle/pgn'}}
" The following plugin is not present on vim.org:
let scm['vim-blanklines'] = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-blanklines'}

" Oliver Uvman
let scmnr.3239 = {'type': 'git', 'url': 'git://github.com/fholgado/minibufexpl.vim'}

" Ton van den Heuvel
let scmnr.3241 = {'type': 'git', 'url': 'git://github.com/ton/vim-bufsurf'}

" Mark Harrison
let scmnr.3264 = {'type': 'git', 'url': 'git://github.com/mivok/vimtodo'}

" Mohammad Satrio
let scmnr.3324 = {'type': 'git', 'url': 'git://github.com/tyok/js-mask'}

" Herbert Sitz
let scmnr.3327 = {'type': 'git', 'url': 'git://github.com/hsitz/PyScratch'}
let scmnr.3342 = {'type': 'git', 'url': 'git://github.com/hsitz/VimOrganizer'}

" Dan Lowe
let scmnr.3339 = {'type': 'git', 'url': 'git://github.com/tangledhelix/vim-rdist'}
let scmnr.3817 = {'type': 'git', 'url': 'git://github.com/tangledhelix/vim-kickstart'}
let scmnr.3835 = {'type': 'git', 'url': 'git://github.com/tangledhelix/vim-octopress'}

" Sergey Potapov
let scmnr.3344 = {'type': 'git', 'url': 'git://github.com/greyblake/vim-preview'}

" x aizek
let scmnr.3345 = {'type': 'git', 'url': 'git://github.com/xaizek/vim-inccomplete'}
let scmnr.3351 = {'type': 'git', 'url': 'git://github.com/xaizek/vim-qthelp'}

" Johannes Holzfuß
let scmnr.3352 = {'type': 'git', 'url': 'git://github.com/DataWraith/auto_mkdir'}

" basyura
let scmnr.3356 = {'type': 'git', 'url': 'git://github.com/basyura/unite-yarm', 'addon-info': {'dependencies': {'%3396':{}, '%3133':{}, 'webapi-vim':{}}}}
let scmnr.3476 = {'type': 'git', 'url': 'git://github.com/basyura/bitly.vim'}
" The following plugins are not present on vim.org:
let scm['twibill'] = {'type': 'git', 'url': 'git://github.com/basyura/twibill.vim', 'addon-info': {'dependencies': {'%3133':{}, 'webapi-vim':{}}}}
let scm['TweetVim'] = {'type': 'git', 'url': 'git://github.com/basyura/TweetVim', 'addon-info': {'dependencies': {'%3396':{}, '%3476':{}, '%3133':{}, 'twibill':{}, 'unite-outline':{}}}}
let scm['outline-cs'] = {'type': 'git', 'url': 'git://github.com/basyura/outline-cs', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['unite-uiki'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-uiki', 'addon-info': {'dependencies': {'%3396':{}, '%3133':{}}}}
let scm['unite-twitter'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-twitter', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['unite-converter-erase-bufnr'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-converter-erase-bufnr', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['unite-hiki'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-hiki', 'addon-info': {'dependencies': {'%3396':{}, '%3133':{}}}}
let scm['unite-rails'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-rails', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['outline-cobol'] = {'type': 'git', 'url': 'git://github.com/basyura/outline-cobol', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['rubytter'] = {'type': 'git', 'url': 'git://github.com/basyura/rubytter.vim'}
let scm['unite-oreore'] = {'type': 'git', 'url': 'git://github.com/basyura/unite-oreore', 'addon-info': {'dependencies': {'%3396':{}}}}
let scm['b@basyura'] = {'type': 'git', 'url': 'git://github.com/basyura/b.vim'}

" Chris Pickel
let scmnr.3381 = {'type': 'git', 'url': 'git://github.com/sfiera/vim-emacsmodeline'}

" Alfredo Deza
let scmnr.3395 = {'type': 'git', 'url': 'git://github.com/alfredodeza/chapa.vim'}
let scmnr.3424 = {'type': 'git', 'url': 'git://github.com/alfredodeza/pytest.vim'}
let scmnr.3549 = {'type': 'git', 'url': 'git://github.com/alfredodeza/plexer.vim'}
" The following plugins are not present on vim.org:
let scm['coveragepy'] = {'type': 'git', 'url': 'git://github.com/alfredodeza/coveragepy.vim'}
let scm['konira'] = {'type': 'git', 'url': 'git://github.com/alfredodeza/konira.vim'}

" Magnus Woldrich
let scmnr.3397 = {'type': 'git', 'url': 'git://github.com/trapd00r/neverland-vim-theme'}
" The following plugins are not present on vim.org:
let scm['todo-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-todo'}
let scm['perldoc-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/perldoc.vim'}
let scm['irc-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/irc.vim'}
let scm['ratpoison-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-ratpoison'}
let scm['github-recent-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-github-recent'}
let scm['vidir-ls-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-vidir-ls'}
let scm['vim-extendedcolors'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-extendedcolors'}
let scm['vim-highlight-default-highlight-groups'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-highlight-default-highlight-groups'}

" Maksim Ryzhikov
let scmnr.3404 = {'type': 'git', 'url': 'git://github.com/maksimr/vim-translator'}

" Sung Pae
let scmnr.3408 = {'type': 'git', 'url': 'git://github.com/guns/jellyx.vim'}
let scmnr.3412 = {'type': 'git', 'url': 'git://github.com/guns/xterm-color-table.vim'}

" Aydar Khabibullin
let scmnr.3428 = {'url': 'https://github.com/abra/obsidian2/raw/master/obsidian2.vim', 'archive_name': 'obsidian2.vim', 'type': 'archive', 'script-type': 'color scheme'}

" MURAOKA Yusuke
let scmnr.3430 = {'type': 'git', 'url': 'git://github.com/jbking/vim-pep8'}

" David Briscoe
let scmnr.3431 = {'type': 'git', 'url': 'git://github.com/pydave/AsyncCommand'}
" The following plugin does not have a separate repository:
let scmnr.3540 = {'url': 'https://github.com/pydave/daveconfig/raw/master/multi/vim/.vim/plugin/save_current_font.vim', 'archive_name': 'save_current_font.vim', 'type': 'archive', 'script-type': 'utility'}

" Tom Stuart
let scmnr.3443 = {'type': 'git', 'url': 'git://github.com/mortice/pbcopy.vim'}

" Lars Smit
let scmnr.3445 = {'type': 'git', 'url': 'git://github.com/larssmit/Getafe'}

" jelle vandebeeck
let scmnr.3454 = {'type': 'git', 'url': 'git://github.com/fousa/vim-flog'}

" Mohammed Badran
let scmnr.3455 = {'type': 'git', 'url': 'git://github.com/mbadran/headlights'}

" Yukihiro Nakadaira
let scmnr.3804 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-diff'}
let scmnr.3517 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-iconv'}
let scmnr.3457 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-paint'}
let scmnr.1939 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/autofmt'}
let scmnr.2193 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/fpdf-vim'}
let scmnr.2375 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/if_v8'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3482 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-remote'}
" The following plugin does not have a separate repository:
let scmnr.2972 = {'url': 'https://github.com/ynkdir/vim-funlib/raw/master/autoload/hmac.vim', 'archive_name': 'hmac.vim', 'type': 'archive', 'script-type': 'utility'}
" The following plugins are not present on vim.org:
let scm['vim-patch'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-patch'}
let scm['vim-samegame'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-samegame'}
let scm['vim-print'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-print'}
let scm['vim-funlib'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-funlib'}
let scm['vim-guess'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-guess'}

" gmarik gmarik
let scmnr.3458 = {'type': 'git', 'url': 'git://github.com/gmarik/vundle'}

" Maycon Sambinelli
let scmnr.3462 = {'type': 'git', 'url': 'git://github.com/msambinelli/Compile'}

" Brian Wigginton
let scmnr.3474 = {'type': 'git', 'url': 'git://github.com/bawigga/vim-neopro'}

" t9 md
let scmnr.3485 = {'type': 'git', 'url': 'git://github.com/t9md/vim-phrase', 'addon-info': {'dependencies': {'%3396':{}}}}
let scmnr.3700 = {'type': 'git', 'url': 'git://github.com/t9md/vim-tryit'}
let scmnr.3494 = {'type': 'git', 'url': 'git://github.com/t9md/vim-underlinetag'}
let scmnr.3491 = {'type': 'git', 'url': 'git://github.com/t9md/vim-textmanip'}
let scmnr.3623 = {'type': 'git', 'url': 'git://github.com/t9md/vim-chef'}
let scmnr.3692 = {'type': 'git', 'url': 'git://github.com/t9md/vim-quickhl'}
let scmnr.3627 = {'type': 'git', 'url': 'git://github.com/t9md/vim-resizewin'}
let scmnr.3701 = {'type': 'git', 'url': 'git://github.com/t9md/vim-fthook'}
" The following plugins are not present on vim.org:
let scm['textobj-function-ruby'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-textobj-function-ruby'}
let scm['quicktag'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-quicktag'}
let scm['ruby_eval'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-ruby_eval'}
let scm['surround_custom_mapping'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-surround_custom_mapping'}
let scm['unite-ack'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-unite-ack', 'addon-info': {'dependencies': {'%3396':{}}}}

" adam rutkowski
let scmnr.3503 = {'type': 'git', 'url': 'git://github.com/aerosol/vim-erlang-skeletons'}

" Marc Harter
let scmnr.3513 = {'type': 'git', 'url': 'git://github.com/wavded/vim-stylus'}

" Vim Outliner
let scmnr.3515 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" Bill Odom
let scmnr.3518 = {'type': 'git', 'url': 'git://github.com/wnodom/vim-accentuate'}

" Guten Ye
let scmnr.3523 = {'type': 'git', 'url': 'git://github.com/GutenYe/gem.vim'}

" Samson Wu
let scmnr.3535 = {'type': 'git', 'url': 'git://github.com/samsonw/vim-task'}

" Dave Aitken
let scmnr.3537 = {'type': 'git', 'url': 'git://github.com/actionshrimp/vim-xpath'}

" William Estoque
let scmnr.3546 = {'type': 'git', 'url': 'git://github.com/westoque/molly.vim'}

" Houtsnip -
let scmnr.3554 = {'type': 'git', 'url': 'git://github.com/houtsnip/vim-emacscommandline'}

" Jan Christoph Ebersbach
let scmnr.3557 = {'type': 'git', 'url': 'git://github.com/jceb/vim-editqf'}
let scmnr.3564 = {'type': 'git', 'url': 'git://github.com/jceb/vim-hier'}
let scmnr.3642 = {'type': 'git', 'url': 'git://github.com/jceb/vim-orgmode'}
let scmnr.3809 = {'type': 'git', 'url': 'git://github.com/jceb/vim-ipi'}
" The following plugins are not present on vim.org:
let scm['vim-fastwordcompleter'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-fastwordcompleter'}
let scm['vim-multiedit'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-multiedit'}
let scm['vim-cd'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-cd'}
let scm['vim-qf_toggle'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-qf_toggle'}
let scm['vim-rfc'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-rfc'}
let scm['vim-visualsearch'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-visualsearch'}
let scm['vim-helpwrapper'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-helpwrapper'}

" Matej Svec
let scmnr.3558 = {'type': 'git', 'url': 'git://github.com/triglav/vim-visual-increment'}

" wang yicuan
let scmnr.3559 = {'type': 'git', 'url': 'git://github.com/bolasblack/gtrans.vim'}
let scmnr.3823 = {'type': 'git', 'url': 'git://github.com/bolasblack/csslint.vim'}

" Martin Lafreniere
let scmnr.3560 = {'type': 'git', 'url': 'git://github.com/MartinLafreniere/vim-PairTools'}

" Matthew Margolis
let scmnr.3571 = {'type': 'git', 'url': 'git://github.com/mrmargolis/dogmatic.vim'}

" Anderson Custódio de Oliveira
let scmnr.3575 = {'type': 'git', 'url': 'git://github.com/acustodioo/vim-enter-indent'}

" Michiel Roos
let scmnr.3585 = {'type': 'git', 'url': 'git://github.com/Tuurlijk/typofree.vim'}

" Pranesh Srinivasan
let scmnr.3586 = {'type': 'git', 'url': 'git://github.com/spranesh/Redhawk', 'addon-info': {'runtimepath': 'editors/vim'}}

" Dugan Chen
let scmnr.3587 = {'type': 'git', 'url': 'git://github.com/duganchen/vim-soy'}

" Yuhei Kagaya
let scmnr.3589 = {'type': 'git', 'url': 'git://github.com/violetyk/cake.vim'}

" Aaron Stacy
let scmnr.3594 = {'type': 'git', 'url': 'git://github.com/aaronj1335/ucompleteme'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3593 = {'type': 'git', 'url': 'git://github.com/aaronj1335/pdub'}

" omi taku
let scmnr.2326 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-batch-source'}
let scmnr.3602 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-reorder-columns'}
let scmnr.3601 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-cmdline-insertdatetime'}
let scmnr.1456 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-copypath'}
let scmnr.2327 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-catn'}
let scmnr.3595 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-ethna-switch'}
let scmnr.2321 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-zoom'}
let scmnr.2789 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-rargs'}
let scmnr.2173 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-head'}
let scmnr.3572 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-ro-when-swapfound'}
let scmnr.2341 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-postmail'}
let scmnr.2877 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-spinner'}
" The following plugins are not present on vim.org:
let scm['vim-logging'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-logging'}
let scm['vim-holdspace'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-holdspace'}
let scm['vim-editexisting-ext'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-editexisting-ext'}
let scm['vim-funlib-map'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-funlib-map', 'addon-info': {'dependencies': {'vim-funlib':{}}}}
let scm['vim-fix-numbering'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-fix-numbering'}
let scm['vim-chardet'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-chardet'}
let scm['vim-mmatch'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-mmatch'}

" tell k
let scmnr.3612 = {'type': 'git', 'url': 'git://github.com/tell-k/vim-browsereload-mac'}

" julien stechele
let scmnr.3616 = {'type': 'git', 'url': 'git://github.com/Fl4t/warez-colorscheme'}

" Shrey Banga
let scmnr.3630 = {'type': 'git', 'url': 'git://github.com/milkbikis/IDSearch.vim'}

" Venkateswara Rao Mandela
let scmnr.3635 = {'type': 'git', 'url': 'git://github.com/vmandela/WinFastFind'}

" Aleksandr Batsuev
let scmnr.3651 = {'type': 'git', 'url': 'git://github.com/batsuev/google-closure-vim'}
" The following plugins are not present on vim.org:
let scm['google-closure-linter-for-vim'] = {'type': 'git', 'url': 'git://github.com/batsuev/google-closure-linter-for-vim'}
let scm['csscomb-vim'] = {'type': 'git', 'url': 'git://github.com/batsuev/csscomb-vim'}

" Stephen Bell
let scmnr.3662 = {'type': 'git', 'url': 'git://github.com/bahejl/Intelligent_Tags'}

" Tamir Lavi
let scmnr.3664 = {'type': 'git', 'url': 'git://github.com/tlavi/SnipMgr'}

" Nathan Witmer
let scmnr.3676 = {'type': 'git', 'url': 'git://github.com/aniero/vim-copy-as-rtf'}

" Roman Gonzalez
let scmnr.3690 = {'type': 'git', 'url': 'git://github.com/roman/golden-ratio'}

" Lorance Stinson
let scmnr.3792 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaBufMgr'}
let scmnr.3738 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaTips'}
let scmnr.3749 = {'type': 'git', 'url': 'git://github.com/LStinson/Nagelfar-Vim'}
let scmnr.3750 = {'type': 'git', 'url': 'git://github.com/LStinson/TclShell-Vim'}
let scmnr.3765 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaTasks'}
" The following plugin does not have a separate repository:
let scmnr.3702 = {'url': 'https://github.com/LStinson/Vim/raw/master/syntax/sql.vim', 'archive_name': 'sql.vim', 'type': 'archive', 'script-type': 'syntax'}

" Alexandru Tica
let scmnr.3706 = {'type': 'git', 'url': 'git://github.com/talek/obvious-resize'}
let scmnr.3154 = {'type': 'svn', 'url': 'http://vorax.googlecode.com/svn/trunk'}

" Paul Ivanov
let scmnr.3709 = {'type': 'git', 'url': 'git://github.com/ivanov/vim-ipython'}

" Matt Sacks
let scmnr.3716 = {'type': 'git', 'url': 'git://github.com/mattsa/vim-fuzzee'}
let scmnr.3864 = {'type': 'git', 'url': 'git://github.com/mattsa/vim-eddie'}

" danny obrien
let scmnr.3722 = {'type': 'git', 'url': 'git://github.com/dannyob/quickfixstatus'}

" Sebastian Tramp
let scmnr.3727 = {'type': 'git', 'url': 'git://github.com/seebi/easychair.vim'}

" David Sanson
let scmnr.3730 = {'type': 'git', 'url': 'git://github.com/vim-pandoc/vim-pandoc'}
let scmnr.3744 = {'type': 'git', 'url': 'git://github.com/vim-pandoc/vim-markdownfootnotes'}

" Pavel Argentov
let scmnr.3732 = {'type': 'git', 'url': 'git://github.com/argent-smith/vim-rpsl'}

" Bit Connor
let scmnr.3735 = {'type': 'git', 'url': 'git://github.com/bitc/vim-bad-whitespace'}

" Oguz Bilgic
let scmnr.3737 = {'type': 'git', 'url': 'git://github.com/oguzbilgic/sexy-railscasts-theme'}

" Jason Felice
let scmnr.3741 = {'type': 'git', 'url': 'git://github.com/eraserhd/vim-kiwi'}

" Ricardo Catalinas Jiménez
let scmnr.3743 = {'type': 'git', 'url': 'git://github.com/jimenezrick/vimerl'}

" Felipe Morales
let scmnr.3753 = {'type': 'git', 'url': 'git://github.com/fmoralesc/vim-pad'}
let scmnr.3101 = {'type': 'git', 'url': 'git://github.com/fmoralesc/Tumble'}

" Leonid Shevtsov
let scmnr.3758 = {'type': 'git', 'url': 'git://github.com/leonid-shevtsov/ambient_theme.vim'}

" Florian Preinstorfer
let scmnr.3760 = {'type': 'git', 'url': 'git://github.com/nblock/vim-dokuwiki'}

" Jonathan Rascher
let scmnr.3774 = {'type': 'git', 'url': 'git://github.com/bcat/abbott.vim'}

" Josh Perez
let scmnr.3779 = {'type': 'git', 'url': 'git://github.com/goatslacker/mango.vim'}

" Rogerz Zhang
let scmnr.3783 = {'type': 'git', 'url': 'git://github.com/rogerz/vim-json'}

" Rainux Luo
let scmnr.3793 = {'type': 'git', 'url': 'git://github.com/rainux/vim-desert-warm-256'}

" Bruno Silva
let scmnr.3794 = {'type': 'git', 'url': 'git://github.com/brunosilva/html-source-explorer'}

" Maciej Małecki
let scmnr.3798 = {'type': 'git', 'url': 'git://github.com/mmalecki/vim-node.js'}

" Rory McKinley
let scmnr.3803 = {'type': 'git', 'url': 'git://github.com/rorymckinley/vim-symbols-strings'}

" Bartłomiej Danek
let scmnr.3820 = {'type': 'git', 'url': 'git://github.com/bartekd/vim-dart'}
let scmnr.3830 = {'type': 'git', 'url': 'git://github.com/bartekd/better-snipmate-snippets'}

" Paul Meng
let scmnr.3821 = {'type': 'git', 'url': 'git://github.com/MnO2/vim-ocaml-conceal'}

" Alisue Lambda
let scmnr.3840 = {'type': 'git', 'url': 'git://github.com/lambdalisue/vim-python-virtualenv'}
let scmnr.3841 = {'type': 'git', 'url': 'git://github.com/lambdalisue/vim-django-support'}
let scmnr.3842 = {'type': 'git', 'url': 'git://github.com/lambdalisue/nose.vim'}
let scmnr.3843 = {'type': 'git', 'url': 'git://github.com/lambdalisue/nodeunit.vim'}
let scmnr.3948 = {'type': 'git', 'url': 'git://github.com/lambdalisue/django.vim'}
let scmnr.3949 = {'type': 'git', 'url': 'git://github.com/lambdalisue/pyunit.vim'}

" Zhao Cai
let scmnr.3854 = {'type': 'git', 'url': 'git://github.com/zhaocai/unite-scriptnames'}

" Matthias Guenther
let scmnr.3856 = {'type': 'git', 'url': 'git://github.com/matthias-guenther/tocdown'}
let scmnr.3962 = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

" Jonatan Anauati
let scmnr.3857 = {'type': 'git', 'url': 'git://github.com/jaanauati/vim-wordfuzzycompletion-plugin'}

" Daniel Schaefer
let scmnr.3863 = {'type': 'git', 'url': 'git://github.com/epegzz/epegzz.vim'}

" Yasuhiro Ikeda
let scmnr.3869 = {'type': 'git', 'url': 'git://github.com/wipple/lightdiff'}

" Matan Nassau
let scmnr.3071 = {'type': 'git', 'url': 'git://github.com/wilhelmtell/reimin'}

" Caio Romão
let scmnr.3379 = {'type': 'git', 'url': 'git://github.com/caio/jumpnextlongline.vim'}

" Alex Efros
let scmnr.3883 = {'type': 'hg',  'url': 'https://code.google.com/p/vim-plugin-autosess'}
let scmnr.3885 = {'type': 'hg',  'url': 'https://code.google.com/p/vim-plugin-ruscmd'}
let scmnr.3893 = {'type': 'hg',  'url': 'https://code.google.com/p/vim-plugin-viewdoc'}

" Roman Podolyaka
let scmnr.3903 = {'type': 'git', 'url': 'git://github.com/bloodeclipse/vim-xsnippet'}

" Dmitry Frank
let scm['indexer.tar.gz@development'] = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/indexer_development'}
let scmnr.3221 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/indexer_stable'}
let scmnr.3872 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/vimprj'}
let scmnr.3884 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/dfrank_util'}
let scmnr.3911 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/vim-punto-switcher'}
" The following plugin is not present on vim.org:
let scm['envcontrol'] = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/envcontrol'}

" adam r
let scmnr.3902 = {'type': 'git', 'url': 'git://github.com/aerosol/vim-compot'}

" Sandeep CR
let scmnr.3896 = {'type': 'git', 'url': 'git://github.com/sandeepcr529/Buffet.vim'}

" Zefei Xuan
let scmnr.3890 = {'type': 'git', 'url': 'git://github.com/zefei/simple-dark'}

" Alex Meade
let scmnr.3888 = {'type': 'git', 'url': 'git://github.com/ameade/qtpy-vim'}

" Kamil Dworakowski
let scmnr.2032 = {'type': 'svn', 'url': 'http://swap-params-for-vim.googlecode.com/svn/trunk'}

" Jose Elera Campana
let scmnr.3922 = {'type': 'git', 'url': 'git://github.com/jelera/vim-gummybears-colorscheme'}
let scmnr.3425 = {'type': 'git', 'url': 'git://github.com/jelera/vim-javascript-syntax'}
let scmnr.3427 = {'type': 'git', 'url': 'git://github.com/jelera/vim-nazca-colorscheme'}

" Michael Härtl
let scmnr.3943 = {'type': 'git', 'url': 'git://github.com/mikehaertl/pdv-standalone'}
let scmnr.3944 = {'type': 'git', 'url': 'git://github.com/mikehaertl/yii-api-vim'}

" Łukasz Korecki
let scmnr.3959 = {'type': 'git', 'url': 'git://github.com/lukaszkorecki/workflowish'}

" Jason Duell
let scmnr.51   = {'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'archive_name': 'cscope_maps.vim', 'type': 'archive', 'script-type': 'utility'}

" Peter Provost
let scmnr.1327 = {'type': 'git', 'url': 'git://github.com/PProvost/vim-ps1'}

" Endel Dreyer
let scmnr.3961 = {'type': 'git', 'url': 'git://github.com/endel/flashdevelop.vim'}

" Jeremy Cantrell
let scmnr.2158 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-diffchanges'}
let scmnr.3487 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-reporoot'}
" let scmnr.2152 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-snippets'}
let scmnr.2251 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-journal'}
let scmnr.3578 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-lastmod'}
let scmnr.3293 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-numbered'}
let scmnr.3486 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-virtualenv'}
let scmnr.3541 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-fatrat'}
let scmnr.3543 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-opener'}

" Jon Suderman
let scmnr.3969 = {'type': 'git', 'url': 'git://github.com/suderman/source.vim'}

" Jean-Denis Vauguet
let scmnr.3970 = {'type': 'git', 'url': 'git://github.com/chikamichi/mediawiki.vim'}

" Junqing Wang
let scmnr.3972 = {'type': 'git', 'url': 'git://github.com/kight/CSS3-syntax-file-for-vim'}

" Odin Dutton
let scmnr.3973 = {'type': 'git', 'url': 'git://github.com/twe4ked/vim-diff-toggle'}

" yu xie
let scmnr.3975 = {'type': 'git', 'url': 'git://github.com/xieyu/Finder'}

" Maximilian Nickel
let scmnr.3979 = {'type': 'git', 'url': 'git://github.com/mnick/vim-pomodoro'}

" Jon Cairns
let scmnr.3780 = {'type': 'git', 'url': 'git://github.com/joonty/vim-phpqa'}
let scmnr.3992 = {'type': 'git', 'url': 'git://github.com/joonty/vim-sauce'}

" Suan Yeo
let scmnr.3994 = {'type': 'git', 'url': 'git://github.com/suan/vim-instant-markdown'}

" Mike Skalnik
let scmnr.3995 = {'type': 'git', 'url': 'git://github.com/skalnik/vim-vroom'}

" G Ltis
let scmnr.3997 = {'type': 'git', 'url': 'git://github.com/glts/vim-spacebox'}

" lorry lee
let scmnr.3999 = {'type': 'git', 'url': 'git://github.com/lorry-lee/vim-ayumi'}

"-----------------------------------------------------------------------------------------------------------------------

" Derek Wyatt
" Script page and the only download suggest using git, but referenced repository 
" is absent. Adding it here so that VAM users will get error from git if they 
" ignore deprecation instead of “Don’t know how to unpack” error.
let scmnr.3524 = {'type': 'git', 'url': 'git://github.com/ewiplayer/vim-scala'}

" Sergey Vakulenko
" The following plugins do not have a separate repository:
let scmnr.2733 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/vimfiles/plugin/bufReminderRemake.vim', 'archive_name': 'bufReminderRemake.vim', 'type': 'archive', 'script-type': 'utility'}
let scmnr.3946 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/binaries/hop.zip',       'archive_name': 'hop.zip',       'type': 'archive', 'script-type': 'utility'}
let scmnr.3956 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/binaries/fwk_notes.zip', 'archive_name': 'fwk_notes.zip', 'type': 'archive', 'script-type': 'utility'}
" You can use the following to pull all his plugins:
let scm['plugins@svakulenko'] = {'type': 'git', 'url': 'git://github.com/svakulenko/gvim_extention', 'addon-info': {'runtimepath': 'vimfiles'}}

" Phui-Hock Chang
" The following plugin does not have normal directory structure:
let scmnr.3917 = {'url': 'https://github.com/phuihock/tagport.vim/raw/master/tagport.vim', 'archive_name': 'tagport.vim', 'type': 'archive', 'script-type': 'ftplugin'}

" Michael Nussbaum
" The following plugin does not have a separate repository:
let scmnr.3851 = {'url': 'https://github.com/michaelnussbaum08/Mark-Ring/raw/master/mark_ring.vim', 'archive_name': 'mark_ring.vim', 'type': 'archive', 'script-type': 'utility'}

" Aldis Berjoza
" The following plugin does not have a separate repository:
let scmnr.3674 = {'url': 'github.com/graudeejs/dot.vim/raw/master/colors/universal-blue.vim', 'archive_name': 'universal-blue.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Jevgeni Tarasov
" The following plugin does not have normal directory structure:
let scmnr.3571 = {'url': 'https://github.com/wolfsund/terse/raw/DEPLOY/terse.vim', 'archive_name': 'terse.vim', 'type': 'archive', 'script-type': 'utility'}

" tien le
" The following plugin does not have normal directory structure:
let scmnr.3414 = {'url': 'https://github.com/tienle/bocau/raw/master/bocau.vim', 'archive_name': 'bocau.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Jiri Kratochvil
" The following plugin does not have normal directory structure:
let scmnr.3399 = {'url': 'https://github.com/klokane/vim-phpunit/raw/master/phpunit.vim', 'archive_name': 'phpunit.vim', 'type': 'archive', 'script-type': 'utility'}

" Daniel B
" The following plugins do not have a separate repository:
let scmnr.3140 = {'url': 'https://github.com/dbb/vim/raw/master/obsidian.vim', 'archive_name': 'obsidian.vim', 'type': 'archive', 'script-type': 'color scheme'}
let scmnr.3470 = {'url': 'https://github.com/dbb/vim/raw/master/tidydiff.vim', 'archive_name': 'tidydiff.vim', 'type': 'archive', 'script-type': 'ftplugin'}
let scmnr.3693 = {'url': 'https://github.com/dbb/vim/raw/master/FixCSS.vim', 'archive_name': 'FixCSS.vim', 'type': 'archive', 'script-type': 'ftplugin'}
let scmnr.3913 = {'url': 'https://github.com/dbb/vim/raw/master/CapsulaPigmentorum.vim', 'archive_name': 'CapsulaPigmentorum.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Steffen Siering
" The following plugin does not have a separate repository:
let scmnr.3034 = {'url': 'https://github.com/urso/dotrc/raw/master/vim/syntax/haskell.vim', 'archive_name': 'haskell.vim', 'type': 'archive', 'script-type': 'syntax'}

" C. Coutinho
" The following plugin does not have normal directory structure:
let scmnr.3023 = {'url': 'https://github.com/kikijump/tslime.vim/raw/master/tslime.vim', 'archive_name': 'tslime.vim', 'type': 'archive', 'script-type': 'utility'}

" joseph wecker
" The following plugins do not have normal directory structure:
let scmnr.2964 = {'url': 'https://github.com/josephwecker/neutron.vim/raw/master/neutron.vim', 'archive_name': 'neutron.vim', 'type': 'archive', 'script-type': 'color scheme'}
" The following plugin is not present on vim.org:
let scm['murphytango'] = {'url': 'https://github.com/josephwecker/murphytango.vim/raw/master/murphytango.vim', 'archive_name': 'murphytango.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Einar Lielmanis
" The following plugin does not have normal directory structure:
let scmnr.2469 = {'url': 'https://github.com/einars/translit.vim/raw/master/translit.vim', 'archive_name': 'translit.vim', 'type': 'archive', 'script-type': 'utility'}

" Chris Gaffney
" The following plugin does not have normal directory structure:
let scmnr.2466 = {'url': 'https://github.com/gaffneyc/vim-cdargs/raw/master/cdargs.vim', 'archive_name': 'cdargs.vim', 'type': 'archive', 'script-type': 'utility'}

" Benjamin Hoffstein
" The following plugin does not have normal directory structure:
let scmnr.2449 = {'url': 'https://github.com/hoffstein/vim-tsql/raw/master/sqlserver.vim', 'archive_name': 'sqlserver.vim', 'type': 'archive', 'script-type': 'syntax'}

" Benjamin Esham
" The following plugin does not have normal directory structure:
let scmnr.432 = {'url': 'https://github.com/bdesham/biogoo/raw/master/biogoo.vim', 'archive_name': 'biogoo.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Hans Fugal
" The following plugin does not have normal directory structure:
let scmnr.105 = {'url': 'https://github.com/fugalh/desert.vim/raw/master/desert.vim', 'archive_name': 'desert.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Peter Hosey
" The following plugin does not have normal directory structure:
let scmnr.2475 = {'url': 'https://bitbucket.org/boredzo/vim-ini-syntax/raw/default/ini.vim', 'archive_name': 'ini.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'ini syntax definition'}

" Jochen Bartl
" The following plugin does not have normal directory structure:
let scmnr.2479 = {'url': 'https://bitbucket.org/lobo/grsecurityvim/raw/default/grsecurity.vim', 'archive_name': 'grsecurity.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'grsecurity.vim'}

" Leandro Penz
" The following repository does not have normal directory structure:
" let scmnr.808 = {'type': 'git', 'url': 'git://github.com/lpenz/vimcommander'}

" xolox
" The following repository does not have normal directory structure:
" let scmnr.3242 = {'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}

" Dmitry Ermolov
" The following repository does not have normal directory structure:
" let scmnr.3648 = {'type': 'git', 'url': 'git://github.com/9uMaH/autocpp'}

" lei fw
" The following repository does not have normal directory structure:
" let scmnr.3684 = {'type': 'git', 'url': 'git://github.com/abadcafe/ctags_cache'}

" Anders Schau Knatten
" The following repository does not have normal directory structure:
" let scmnr.3733 = {'type': 'git', 'url': 'git://github.com/knatten/olga_key'}

" Amit Ranjit
" The following repository does not have normal directory structure:
" let scmnr.3752 = {'type': 'git', 'url': 'git://github.com/amitdev/vimpy'}

" Mathias Fussenegger
" The following repository does not have normal directory structure:
" let scmnr.3754 = {'type': 'git', 'url': 'git://github.com/chobojordi/baancomplete'}

" Jannis Pohlmann
" Following repository does not contain correct directory tree
" let scmnr.2278 = {'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate'}

" Weakish Jiang
" The following repository does not have normal directory structure:
" let scm['rc'] = {'type': 'git', 'url': 'git://gist.github.com/986788'}

" others:
let scm['mustache'] = {'type': 'git', 'url': 'git://github.com/juvenn/mustache.vim'}
let scm['Vim-R-plugin2'] = {'type': 'git', 'url': 'git://github.com/jimmyharris/vim-r-plugin2'}
let scm['vim-ruby-debugger'] = {'type': 'git', 'url': 'git://github.com/astashov/vim-ruby-debugger'}
let scm['codefellow'] = {'type': 'git', 'url': 'git://github.com/romanroe/codefellow', 'addon-info': {'runtimepath': 'vim'}}
let scm['space'] = {'type': 'git', 'url': 'git://github.com/spiiph/vim-space'}
let scm['vim-comment-object'] = {'type': 'git', 'url': 'git://github.com/ConradIrwin/vim-comment-object'}
let scm['git-vim'] = {'type': 'git', 'url': 'git://github.com/motemen/git-vim'}
let scm['vimpager-perlmod'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vimpager-perlmod'}

" let scm['sparkup'] = {'type': 'git', 'url': 'git://github.com/rstacruz/sparkup', 'addon-info': {'runtimepath': 'vim'}}
" See https://github.com/rstacruz/sparkup/issues/57
let scm['sparkup'] = {'type': 'git', 'url': 'git://github.com/chrisgeo/sparkup', 'addon-info': {'runtimepath': 'vim'}}

let scm['flake8@avidal'] = {'type': 'git', 'url': 'git://github.com/avidal/flake8.vim'}
let scm['css_color@skammer'] = {'type': 'git', 'url': 'git://github.com/skammer/vim-css-color'}
let scm['vim-ruby-complexity'] = {'type': 'git', 'url': 'git://github.com/skammer/vim-ruby-complexity'}
let scm['vim-objc'] = {'type': 'git', 'url': 'git://github.com/b4winckler/vim-objc'}
let scm['vimUnit@dsummersl'] = {'type': 'git', 'url': 'git://github.com/dsummersl/vimunit'}
let scm['Processing@sophacles'] = {'type': 'git', 'url': 'git://github.com/sophacles/vim-processing'}
let scm['unite-mark'] = {'type': 'git', 'url': 'git://github.com/tacroe/unite-mark', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['unite-help'] = {'type': 'git', 'url': 'git://github.com/tsukkee/unite-help', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['unite-outline'] = {'type': 'git', 'url': 'git://github.com/h1mesuke/unite-outline', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['unicode-haskell'] = {'type': 'git', 'url': 'git://github.com/frerich/unicode-haskell'}
let scm['vim-makegreen'] = {'type': 'git', 'url': 'git://github.com/reinh/vim-makegreen'}
let scm['vim-rooter'] = {'type': 'git', 'url': 'git://github.com/airblade/vim-rooter'}

" Single files under SCM control without proper directory structure
let scm['pgnvim'] = {'url': 'https://github.com/Raimondi/pgnvim/raw/master/pgn.vim', 'archive_name': 'pgn.vim', 'author': 'Israel Chauca Fuentes', 'type': 'archive', 'script-type': 'syntax', 'title': 'pgnvim'}

" this is only the vimfiles subdirectory:
let scm['vim-latex'] = {'type': 'git', 'url': 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'}

let r=[scm, scmnr]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr=▶,▲
