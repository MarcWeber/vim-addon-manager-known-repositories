" See documentation at vamkr#GetVim
" custom plugins - drop me an email to get you repository added
let scm = {}
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
let scmnr.3432 = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
let scm['theonevimlib'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let scm['vim-addon-lout'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
let scm['vim-addon-urweb'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-urweb'}
let scm['vim-addon-swfmill'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-swfmill'}
let scm['vim-addon-views'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-views'}
let scm['vim-addon-goto-thing-at-cursor'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-goto-thing-at-cursor'}
let scm['scion-backend-vim'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/scion-backend-vim'}
let scm['vim-addon-haskell'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
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
let scm['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell'}
let scm['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
let scm['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
let scm['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
let scm['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}

" ZyX
let scmnr.3056 = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
let scmnr.3185 = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
let scmnr.3113 = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
let scmnr.3189 = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
let scmnr.3190 = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
let scmnr.3828 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}
" The following plugin is not present on vim.org:
let scm['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}

" David Terei
let scmnr.3022 = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}

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
let scmnr.1891 = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
let scmnr.2120 = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
let scmnr.1617 = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
let scmnr.1545 = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
let scmnr.1624 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
let scmnr.3695 = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
let scmnr.3669 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
" The following plugin is not present on vim.org:
let scm['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}
let scm['markdown@tpope'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}
" " The following plugin is present on vim.org, but does not belong to Tim Pope
" let scmnr.1626 = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}

" Marty Grenfell
let scmnr.1218 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
let scmnr.1658 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
let scmnr.2736 = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

" Luc Hermitte
let scmnr.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scmnr.50 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let scmnr.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
let scmnr.229 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
" Others were not included as they are absent on www.vim.org

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
" The following plugin is not present on vim.org:
let scm['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}

" Kim Silkebækken
let scmnr.3526 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-easymotion'}
let scmnr.3529 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-distinguished'}
" The following plugin is not present on vim.org:
let scm['powerline'] = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-powerline'}

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
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3608 = {'type': 'git', 'url': 'git://github.com/xuhdev/nautilus-py-vim'}

" Vincent T.
let scmnr.3606 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let scmnr.3707 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let scmnr.3596 = {'type': 'git', 'url': 'git://github.com/Vayn/Fanfou'}

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
" Using “@hg” here because we need to alter runtimepath, but only for mercurial 
" source
let scm['vimwiki@hg'] = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki/'}

" Christian Ebert
let scmnr.1512 = {'type': 'hg', 'url': 'http://www.blacktrash.org/hg/screenpaste'}

" Ted Pavlic
" Note: it is not an actual vim script, it is a command-line (shell 
" command-line) utility
let scmnr.2182 = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

" Jonas Kramer
let scmnr.2446 = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

" Jannis Pohlmann
" Following repository does not contain correct directory tree
" let scmnr.2278 = {'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate'}

" Rykka Krin
let scmnr.3597 = {'type': 'git', 'url': 'git://github.com/Rykka/ColorV'}
let scmnr.3729 = {'type': 'git', 'url': 'git://github.com/Rykka/vim-galaxy'}

" Andrew Radev
let scmnr.3613 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/splitjoin.vim'}
let scmnr.3771 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/tagfinder.vim'}
let scmnr.3745 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/linediff.vim'}

" Radek Kowalski
let scmnr.3331 = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

" Vincent Velociter
let scmnr.3673 = {'type': 'git', 'url': 'git://github.com/veloce/vim-aldmeris'}

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

" David JH
let scmnr.2442 = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

" Micah Elliott
" Following repository does not contain correct directory tree
" let scmnr.1365 = {'type': 'git', 'url': 'git://gist.github.com/720355'}

" Kien Nguyen
let scmnr.3626 = {'type': 'git', 'url': 'git://github.com/kien/autosavesetting.vim'}
let scmnr.3699 = {'type': 'git', 'url': 'git://github.com/kien/premailer.vim'}
let scmnr.3696 = {'type': 'git', 'url': 'git://github.com/kien/prefixer.vim'}
let scmnr.3697 = {'type': 'git', 'url': 'git://github.com/kien/cssbaseline.vim'}
let scmnr.3698 = {'type': 'git', 'url': 'git://github.com/kien/html_emogrifier.vim'}
let scmnr.3772 = {'type': 'git', 'url': 'git://github.com/kien/rainbow_parentheses.vim'}
let scmnr.3736 = {'type': 'git', 'url': 'git://github.com/kien/ctrlp.vim'}

" Andy Dawson
let scmnr.3447 = {'type': 'git', 'url': 'git://github.com/AD7six/vim-activity-log'}

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
" Requires postupdate hook // though non-SCM source does also
let scmnr.687 = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
" The following plugins are not present on vim.org:
let scm['webapi-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
let scm['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
let scm['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}

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

" Alessio Bolognino
let scmnr.3871 = {'type': 'git', 'url': 'git://github.com/molok/vim-smartusline'}

" Mick Koch
let scmnr.3590 = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
let scmnr.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scmnr.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
" The following plugins are not present on vim.org:
let scm['lh-brackets'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let scm['build-tools-wrapper'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/BTW/trunk'}
let scm['lh-tags'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/tags/trunk'}
let scm['lh-dev'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/dev/trunk'}
let scm['lh-refactor'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/refactor/trunk'}
let scm['search-in-runtime'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
let scm['system-tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/system-tools/trunk'}
let scm['UT'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/UT/trunk'}
" Not owned by Luc Hermitte
" let scmnr.222 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}

" Jan Larres
let scmnr.3465 = {'type': 'git', 'url': 'git://github.com/majutsushi/tagbar'}

" Jeet Sukumaran
let scmnr.3619 = {'type': 'git', 'url': 'git://github.com/jeetsukumaran/vim-buffergator'}

" Thomas Allen
let scmnr.2719 = {'type': 'git', 'url': 'git://github.com/tmallen/proj-vim'}

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
" The following plugins are not present on vim.org:
let scm['rtputil'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-rtputil'}
let scm['ambicmd'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ambicmd'}
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
let scm['textobj-function-perl'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-perl'}
let scm['textobj-function-javascript'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-javascript'}
let scm['textobj-between'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-between'}
let scm['vim-ft-rst_header'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-rst_header'}
let scm['vim-ft-diff_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-diff_fold'}
let scm['befunge'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-befunge'}
let scm['textobj-plugins'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-plugins'}
let scm['vparsec'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vparsec'}
let scm['tabrecent'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-tabrecent'}
let scm['qfreplace'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-qfreplace'}
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
let scmnr.2715 = {'type': 'bzr', 'url': 'lp:ultisnips'}

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

" Peter Hosey
" The following plugin does not have normal directory structure:
let scmnr.2475 = {'url': 'https://bitbucket.org/boredzo/vim-ini-syntax/raw/default/ini.vim', 'archive_name': 'ini.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'ini syntax definition'}

" Jochen Bartl
" The following plugin does not have normal directory structure:
let scmnr.2479 = {'url': 'https://bitbucket.org/lobo/grsecurityvim/raw/default/grsecurity.vim', 'archive_name': 'grsecurity.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'grsecurity.vim'}

" Weakish Jiang
" The following repository does not have normal directory structure:
" let scm['rc'] = {'type': 'git', 'url': 'git://gist.github.com/986788'}

" " xolox
" " Commented until author puts vim files in proper directories or somebody implements postinstall hooks
" let scmnr.3242 = {'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}

" others:
let scm['mustache'] = {'type': 'git', 'url': 'git://github.com/juvenn/mustache.vim'}
let scm['Vim-R-plugin2'] = {'type': 'git', 'url': 'git://github.com/jimmyharris/vim-r-plugin2'}
let scm['vim-ruby-debugger'] = {'type': 'git', 'url': 'git://github.com/astashov/vim-ruby-debugger'}
let scm['codefellow'] = {'type': 'git', 'url': 'git://github.com/romanroe/codefellow'}
let scm['space'] = {'type': 'git', 'url': 'git://github.com/spiiph/vim-space'}
let scm['vim-comment-object'] = {'type': 'git', 'url': 'git://github.com/ConradIrwin/vim-comment-object'}
let scm['git-vim'] = {'type': 'git', 'url': 'git://github.com/motemen/git-vim'}
let scm['vimpager-perlmod'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vimpager-perlmod'}
let scm['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim'}
let scm['sparkup'] = {'type': 'git', 'url': 'git://github.com/rstacruz/sparkup'}
let scm['flake8'] = {'type': 'git', 'url': 'git://github.com/avidal/flake8.vim'}
let scm['css_color@skammer'] = {'type': 'git', 'url': 'git://github.com/skammer/vim-css-color'}
let scm['vim-objc'] = {'type': 'git', 'url': 'git://github.com/b4winckler/vim-objc'}

" Single files under SCM control without proper directory structure
let scm['pgnvim'] = {'url': 'https://github.com/Raimondi/pgnvim/raw/master/pgn.vim', 'archive_name': 'pgn.vim', 'author': 'Israel Chauca Fuentes', 'type': 'archive', 'script-type': 'syntax', 'title': 'pgnvim'}

" Not sure where it should really go
let scm['cscope_macros'] = {'version': '1.0', 'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'vim_version': '6.0', 'type': 'archive', 'script-type': 'utility', 'archive_name': 'cscope_maps.vim', 'author': 'Jason Duell'}

" this is only the vimfiles subdirectory:
let scm['vim-latex'] = {'type': 'svn', 'url': 'https://vim-latex.svn.sourceforge.net/svnroot/vim-latex/trunk/vimfiles'}

" kana (most can be found on www.vim.org. However they all have a different
" subdirectories - So checking out from git seems to be easier to me to
" support them all.
let scmkana = {}
for [n, na] in vamkr#GetJSON('_kana_github_vimorg_name')
  let scmkana[na] = {'type': 'git', 'url': 'git://github.com/kana/'.n}
endfor
call extend(scm, scmkana)
let r=[scm, scmnr]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr={{{,}}}
