exec vam#DefineAndBind('s:c','g:vim_addon_manager','{}')

let s:c['plugin_sources'] = get(s:c,'plugin_sources', {})
let s:c['missing_addon_infos'] = get(s:c,'missing_addon_infos', {})
let s:missing_addon_infos = s:c['missing_addon_infos']
let s:mai_snr = {}
let s:mai_snr_deps={}

execute 'source' expand('<sfile>:p:h').'/vim.org-scripts.vim'

let s:plugin_sources = s:c.vim_org_sources
unlet s:c.vim_org_sources

let s:snr_to_name={}
call map(copy(s:plugin_sources), 'extend(s:snr_to_name, {v:val.vim_script_nr : v:key})')

" custom plugins - drop me an email to get you repository added
" SCM plugin sources {{{
" this source seems to be more up to date then the www.vim.org version:
let s:scm_plugin_sources = {}
let s:scm_vim_org_sources = {}

" Marc Weber
let s:scm_vim_org_sources.3429 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sml'}
let s:scm_vim_org_sources.1582 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-background-cmd'}
" let s:scm_vim_org_sources.1963 = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let s:scm_vim_org_sources.2376 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sql'}
let s:scm_vim_org_sources.2934 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-actions'}
let s:scm_vim_org_sources.2933 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-fcsh'}
let s:scm_vim_org_sources.2940 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-mw-utils'}
let s:scm_vim_org_sources.3018 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-completion'}
let s:scm_vim_org_sources.3124 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sbt'}
let s:scm_vim_org_sources.3143 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-haxe'}
let s:scm_vim_org_sources.3199 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ocaml'}
let s:scm_vim_org_sources.3307 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-async'}
let s:scm_vim_org_sources.3315 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-json-encoding'}
let s:scm_vim_org_sources.3317 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-signs'}
let s:scm_vim_org_sources.3320 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-xdebug'}
let s:scm_vim_org_sources.3432 = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
let s:scm_plugin_sources['theonevimlib'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let s:scm_plugin_sources['vim-addon-lout'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
let s:scm_plugin_sources['vim-addon-urweb'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-urweb'}
let s:scm_plugin_sources['vim-addon-swfmill'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-swfmill'}
let s:scm_plugin_sources['vim-addon-views'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-views'}
let s:scm_plugin_sources['vim-addon-goto-thing-at-cursor'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-goto-thing-at-cursor'}
let s:scm_plugin_sources['scion-backend-vim'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/scion-backend-vim'}
let s:scm_plugin_sources['vim-addon-haskell'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
let s:scm_plugin_sources['vim-addon-nix'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-nix'}
let s:scm_plugin_sources['vim-addon-scala'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-scala'}
let s:scm_plugin_sources['vim-addon-git'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-git'}
let s:scm_plugin_sources['vim-addon-povray'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-povray'}
let s:scm_plugin_sources['vim-addon-toggle-buffer'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-toggle-buffer'}
let s:scm_plugin_sources['vim-addon-other'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-other'}
let s:scm_plugin_sources['vim-addon-php-manual'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-php-manual'}
let s:scm_plugin_sources['vim-addon-local-vimrc'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-local-vimrc'}
let s:scm_plugin_sources['syntastic2'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/syntastic2'}
let s:scm_plugin_sources['snipmate'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
let s:scm_plugin_sources['vim-ruby'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-ruby'}
let s:scm_plugin_sources['SmartTag'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/SmartTag'}
let s:scm_plugin_sources['ensime'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/ensime', 'branch': 'master-vim-cleaned-up'}
" override snipmate. There is really no reason anymore to use the old version
" snipMate could be dropped. Keep alias
let s:scm_vim_org_sources.2540 = copy(s:scm_plugin_sources['snipmate'])

" Honza Pokorny
" snipmate-snippets depends on snipmate so installing the snippets should be 
" enough
let s:scm_vim_org_sources.3633 = {'type': 'git', 'url': 'git://github.com/honza/snipmate-snippets'}

" Peter Odding
let s:scm_vim_org_sources.2252 = {'type': 'git', 'url': 'git://github.com/xolox/vim-publish'}
let s:scm_vim_org_sources.3104 = {'type': 'git', 'url': 'git://github.com/xolox/vim-pyref'}
let s:scm_vim_org_sources.3150 = {'type': 'git', 'url': 'git://github.com/xolox/vim-session'}
let s:scm_vim_org_sources.3114 = {'type': 'git', 'url': 'git://github.com/xolox/vim-easytags'}
let s:scm_vim_org_sources.3123 = {'type': 'git', 'url': 'git://github.com/xolox/vim-shell'}
let s:scm_vim_org_sources.3148 = {'type': 'git', 'url': 'git://github.com/xolox/vim-reload'}
let s:scm_vim_org_sources.3169 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-inspect'}
let s:scm_vim_org_sources.3375 = {'type': 'git', 'url': 'git://github.com/xolox/vim-notes'}
let s:scm_vim_org_sources.3625 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-ftplugin'}

" Ciaran McCreesh
let s:scm_vim_org_sources.1876 = {'type': 'git', 'url': 'git://github.com/ciaranm/securemodelines'}
let s:scm_vim_org_sources.1143 = {'type': 'git', 'url': 'git://github.com/ciaranm/inkpot'}
let s:scm_vim_org_sources.1171 = {'type': 'git', 'url': 'git://github.com/ciaranm/detectindent'}

" Shougo
let s:scm_vim_org_sources.2620 = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache'}
let s:scm_vim_org_sources.3396 = {'type': 'git', 'url': 'git://github.com/Shougo/unite.vim'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell'}
let s:missing_addon_infos['vimshell'] = {'dependencies': {'vimproc': { } } }
let s:scm_plugin_sources['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
let s:scm_plugin_sources['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
let s:scm_plugin_sources['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
let s:scm_plugin_sources['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}

" ZyX
let s:scm_vim_org_sources.3056 = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
let s:scm_vim_org_sources.3185 = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
let s:scm_vim_org_sources.3113 = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
let s:scm_vim_org_sources.3189 = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
let s:scm_vim_org_sources.3190 = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
let s:scm_vim_org_sources.3828 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}

" David Terei
let s:scm_vim_org_sources.3022 = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}

" Tim Pope
let s:scm_vim_org_sources.1590 = {'type': 'git', 'url': 'git://github.com/tpope/vim-unimpaired'}
let s:scm_vim_org_sources.2386 = {'type': 'git', 'url': 'git://github.com/tpope/vim-endwise'}
let s:scm_vim_org_sources.1697 = {'type': 'git', 'url': 'git://github.com/tpope/vim-surround'}
let s:scm_vim_org_sources.2973 = {'type': 'git', 'url': 'git://github.com/tpope/vim-cucumber'}
let s:scm_vim_org_sources.1567 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rails'}
let s:scm_vim_org_sources.2975 = {'type': 'git', 'url': 'git://github.com/tpope/vim-fugitive'}
let s:scm_vim_org_sources.1433 = {'type': 'git', 'url': 'git://github.com/tpope/vim-haml'}
let s:scm_vim_org_sources.1654 = {'type': 'git', 'url': 'git://github.com/tpope/vim-git'}
let s:scm_vim_org_sources.2332 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pathogen'}
let s:scm_vim_org_sources.1896 = {'type': 'git', 'url': 'git://github.com/tpope/vim-ragtag'}
let s:scm_vim_org_sources.1891 = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
let s:scm_vim_org_sources.2120 = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
let s:scm_vim_org_sources.1617 = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
let s:scm_vim_org_sources.1545 = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
let s:scm_vim_org_sources.1624 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
let s:scm_vim_org_sources.3695 = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
let s:scm_vim_org_sources.3669 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}
" " The following plugin is present on vim.org, but does not belong to Tim Pope
" let s:scm_vim_org_sources.1626 = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}
" " The following plugin has the same name as one of vim.org ones, but different 
" " author
" let s:scm_plugin_sources['markdown'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}

" Marty Grenfell
let s:scm_vim_org_sources.1218 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
let s:scm_vim_org_sources.1658 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
let s:scm_vim_org_sources.2736 = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

" Luc Hermitte
let s:scm_vim_org_sources.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let s:scm_vim_org_sources.50 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let s:scm_vim_org_sources.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
let s:scm_vim_org_sources.229 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
" Others were not included as they are absent on www.vim.org

" Viktor Kojouharov
"tiagofalcao asked me to add the svn source:
let s:scm_vim_org_sources.1702 = {'type': 'svn', 'url': 'http://svn.enlightenment.org/svn/e/trunk/edje/data/vim/'}

" Wincent Colaiuta
let s:scm_vim_org_sources.3025 = {'type': 'git', 'url': 'git://git.wincent.com/command-t.git'}

" Antonio Salazar Cardozo
let s:scm_vim_org_sources.2962 = {'type': 'git', 'url': 'git://github.com/Shadowfiend/liftweb-vim'}

" Nico Raffo
let s:scm_vim_org_sources.2771 = {'type': 'svn', 'url': 'http://conque.googlecode.com/svn/trunk/'}

" Almaz Karimov
let s:scm_vim_org_sources.3231 = {'type': 'hg', 'url': 'https://vim-pyinteractive-plugin.googlecode.com/hg/'}

" Steve Losh
let s:scm_vim_org_sources.3304 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/gundo.vim'}
let s:scm_vim_org_sources.3721 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/threesome.vim'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}

" Kim Silkebækken
let s:scm_vim_org_sources.3526 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-easymotion'}
let s:scm_vim_org_sources.3529 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-distinguished'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['powerline'] = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-powerline'}

" H Xu
let s:scm_vim_org_sources.3115 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/singlecompile'}
let s:scm_vim_org_sources.3219 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/projecttag'}
let s:scm_vim_org_sources.3301 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/trimblank'}
let s:scm_vim_org_sources.3434 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/iniparser'}
let s:scm_vim_org_sources.3492 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-g95.vim'}
let s:scm_vim_org_sources.3496 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-gfortran.vim'}
let s:scm_vim_org_sources.3497 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-ifort.vim'}
let s:scm_vim_org_sources.3506 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-pcc.vim'}
let s:scm_vim_org_sources.3747 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/syntax-dosini.vim'}
" The following is not a vim plugin, but it is posted on vim.org:
let s:scm_vim_org_sources.3608 = {'type': 'git', 'url': 'git://github.com/xuhdev/nautilus-py-vim'}

" Vincent T.
let s:scm_vim_org_sources.3606 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let s:scm_vim_org_sources.3707 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
let s:scm_vim_org_sources.3596 = {'type': 'git', 'url': 'git://github.com/Vayn/Fanfou'}

" Shuhei Kubota
" The following plugins do not have normal directory structure:
let s:scm_vim_org_sources.2542 = {'url': 'https://bitbucket.org/shu/starrange/raw/default/starrange.vim', 'archive_name': 'starrange.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'StarRange'}
let s:scm_vim_org_sources.1283 = {'url': 'https://bitbucket.org/shu/tinybufferexplorer/raw/default/tbe.vim', 'archive_name': 'tbe.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'TinyBufferExplorer'}
let s:scm_vim_org_sources.1477 = {'url': 'https://bitbucket.org/shu/modeliner/raw/default/modeliner.vim', 'archive_name': 'modeliner.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Modeliner'}
let s:scm_vim_org_sources.2205 = {'url': 'https://bitbucket.org/shu/coremosearch/raw/default/coremo_search.vim', 'archive_name': 'coremo_search.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'CoremoSearch'}
let s:scm_vim_org_sources.3162 = {'url': 'https://bitbucket.org/shu/tabops/raw/default/tabops.vim', 'archive_name': 'tabops.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'tabops'}
let s:scm_vim_org_sources.2496 = {'url': 'https://bitbucket.org/shu/changed/raw/default/changed.vim', 'archive_name': 'changed.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Changed'}
let s:scm_vim_org_sources.2843 = {'url': 'https://bitbucket.org/shu/fliplr/raw/default/fliplr.vim', 'archive_name': 'fliplr.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'FlipLR'}
let s:scm_vim_org_sources.3640 = {'url': 'https://bitbucket.org/shu/theoldones/raw/default/theoldones.vim', 'archive_name': 'theoldones.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'The Old Ones'}

" Michael Hart
let s:scm_vim_org_sources.3659 = {'type': 'hg', 'url': 'https://bitbucket.org/mikehart/lycosaexplorer'}

" Preston Masion
let s:scm_vim_org_sources.3510 = {'type': 'hg', 'url': 'https://bitbucket.org/pentie/vimrepress'}

" Dejan Noveski
" This plugin has both mercurial and github repository. I have chosen to use 
" first one, but I have no idea which is original and which is generated 
" automatically
let s:scm_vim_org_sources.3416 = {'type': 'hg', 'url': 'https://bitbucket.org/dekomote/w3cvalidate.vim'}

" AJ V
let s:scm_vim_org_sources.2720 = {'type': 'hg', 'url': 'https://bitbucket.org/fallintothis/arc-vim'}

" Stephen Bach
let s:scm_vim_org_sources.1890 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}

" Daniel Hofstetter
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['scss-syntax'] = {'type': 'git', 'url': 'git://github.com/cakebaker/scss-syntax.vim'}

" Barry Arthur
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['VimLint'] = {'type': 'git', 'url': 'git://github.com/dahu/VimLint'}

" Raimondi (Israel Chauca Fuentes):
let s:scm_vim_org_sources.3026 = {'type': 'git', 'url': 'git://github.com/Raimondi/PickAColor'}
let s:scm_vim_org_sources.2754 = {'type': 'git', 'url': 'git://github.com/Raimondi/delimitMate'}
" The following plugins are not present on vim.org:
" let s:scm_plugin_sources['bufring'] = {'type': 'git', 'url': 'git://github.com/Raimondi/bufring'}

" Ned Konz
let s:scm_vim_org_sources.517 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" intuited - Ted
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['vim-vamoose'] = {'type': 'git', 'url': 'git://github.com/intuited/vim-vamoose'}
let s:scm_plugin_sources['visdo'] = {'type': 'git', 'url': 'git://github.com/intuited/visdo'}

" beyondwords (github)
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['vim-twig'] = {'type': 'git', 'url': 'git://github.com/beyondwords/vim-twig'}

" Tom Link
let s:scm_vim_org_sources.2594 = {'type': 'git', 'url': 'git://github.com/tomtom/tmarks_vim'}
let s:scm_vim_org_sources.861 = {'type': 'git', 'url': 'git://github.com/tomtom/viki_vim'}
let s:scm_vim_org_sources.2033 = {'type': 'git', 'url': 'git://github.com/tomtom/trag_vim'}
let s:scm_vim_org_sources.2037 = {'type': 'git', 'url': 'git://github.com/tomtom/hookcursormoved_vim'}
let s:scm_vim_org_sources.1030 = {'type': 'git', 'url': 'git://github.com/tomtom/scalefont_vim'}
let s:scm_vim_org_sources.1915 = {'type': 'git', 'url': 'git://github.com/tomtom/tbibtools_vim'}
let s:scm_vim_org_sources.1160 = {'type': 'git', 'url': 'git://github.com/tomtom/tskeleton_vim'}
let s:scm_vim_org_sources.1173 = {'type': 'git', 'url': 'git://github.com/tomtom/tcomment_vim'}
let s:scm_vim_org_sources.1284 = {'type': 'git', 'url': 'git://github.com/tomtom/TortoiseSVN_vim'}
let s:scm_vim_org_sources.1751 = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
let s:scm_vim_org_sources.1431 = {'type': 'git', 'url': 'git://github.com/tomtom/checksyntax_vim'}
let s:scm_vim_org_sources.1730 = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}
let s:scm_vim_org_sources.2580 = {'type': 'git', 'url': 'git://github.com/tomtom/spec_vim'}
let s:scm_vim_org_sources.3013 = {'type': 'git', 'url': 'git://github.com/tomtom/tcommand_vim'}
let s:scm_vim_org_sources.1863 = {'type': 'git', 'url': 'git://github.com/tomtom/tlib_vim'}
let s:scm_vim_org_sources.1864 = {'type': 'git', 'url': 'git://github.com/tomtom/tmru_vim'}
let s:scm_vim_org_sources.1865 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectfiles_vim'}
let s:scm_vim_org_sources.1866 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectbuffer_vim'}
let s:scm_vim_org_sources.2014 = {'type': 'git', 'url': 'git://github.com/tomtom/ttoc_vim'}
let s:scm_vim_org_sources.2017 = {'type': 'git', 'url': 'git://github.com/tomtom/tregisters_vim'}
let s:scm_vim_org_sources.2018 = {'type': 'git', 'url': 'git://github.com/tomtom/ttags_vim'}
let s:scm_vim_org_sources.2040 = {'type': 'git', 'url': 'git://github.com/tomtom/tcalc_vim'}
let s:scm_vim_org_sources.2055 = {'type': 'git', 'url': 'git://github.com/tomtom/ttagecho_vim'}
let s:scm_vim_org_sources.2076 = {'type': 'git', 'url': 'git://github.com/tomtom/setsyntax_vim'}
let s:scm_vim_org_sources.2279 = {'type': 'git', 'url': 'git://github.com/tomtom/cmdlinehelp_vim'}
let s:scm_vim_org_sources.2292 = {'type': 'git', 'url': 'git://github.com/tomtom/linglang_vim'}
let s:scm_vim_org_sources.2437 = {'type': 'git', 'url': 'git://github.com/tomtom/shymenu_vim'}
let s:scm_vim_org_sources.2584 = {'type': 'git', 'url': 'git://github.com/tomtom/quickfixsigns_vim'}
let s:scm_vim_org_sources.3780 = {'type': 'git', 'url': 'git://github.com/tomtom/indentfolds_vim'}
let s:scm_vim_org_sources.2894 = {'type': 'git', 'url': 'git://github.com/tomtom/vikitasks_vim'}
let s:scm_vim_org_sources.2915 = {'type': 'git', 'url': 'git://github.com/tomtom/startup_profile_vim'}
let s:scm_vim_org_sources.2917 = {'type': 'git', 'url': 'git://github.com/tomtom/tplugin_vim'}
let s:scm_vim_org_sources.2991 = {'type': 'git', 'url': 'git://github.com/tomtom/rcom_vim'}
let s:scm_vim_org_sources.3051 = {'type': 'git', 'url': 'git://github.com/tomtom/vimform_vim'}
let s:scm_vim_org_sources.3214 = {'type': 'git', 'url': 'git://github.com/tomtom/presets_vim'}
let s:scm_vim_org_sources.3326 = {'type': 'git', 'url': 'git://github.com/tomtom/stakeholders_vim'}
let s:scm_vim_org_sources.3653 = {'type': 'git', 'url': 'git://github.com/tomtom/brep_vim'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['toptions'] = {'type': 'git', 'url': 'git://github.com/tomtom/toptions_vim'}
let s:scm_plugin_sources['worksheet'] = {'type': 'git', 'url': 'git://github.com/tomtom/worksheet_vim'}
let s:scm_plugin_sources['prototype'] = {'type': 'git', 'url': 'git://github.com/tomtom/prototype_vim'}

" Jakson Aquino
let s:scm_vim_org_sources.2628 = {'type': 'git', 'url': 'git://github.com/jcfaria/Vim-R-plugin.git'}

" Robert Gleeson
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['hammer.vim'] = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

" Nathanael Kane
let s:scm_vim_org_sources.3361 = {'type': 'git', 'url': 'git://github.com/nathanaelkane/vim-indent-guides'}

" Michael Sanders
let s:scm_vim_org_sources.2674 = {'type': 'git', 'url': 'git://github.com/msanders/cocoa.vim'}

" Devin Weaver (sukima)
let s:scm_vim_org_sources.301 = {'type': 'git', 'url': 'git://github.com/sukima/xmledit'}

" Thiago Alves
let s:scm_vim_org_sources.2009 = {'type': 'git', 'url': 'git://github.com/Townk/vim-autoclose'}

" Ethan Schoonover
let s:scm_vim_org_sources.3520 = {'type': 'git', 'url': 'git://github.com/altercation/vim-colors-solarized'}

" Manpreet Singh
let s:scm_vim_org_sources.1563 = {'type': 'git', 'url': 'git://github.com/junkblocker/patchreview-vim'}

" jonathan hartley
let s:scm_vim_org_sources.3281 = {'type': 'hg', 'url': 'https://bitbucket.org/tartley/vim_run_python_tests'}

" Shrikant Sharat Kandula
let s:scm_vim_org_sources.3285 = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-looks'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['t-syntax'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/t-syntax'}
" There is already another “gotofile” plugin on vim.org
let s:scm_plugin_sources['gotofile@sharat87'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-gotofile'}

" ali va
" Yes, these are git repositories on bitbucket. Unfortunately, git:// URLs are 
" not supported.
let s:scm_vim_org_sources.3853 = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-dokuwiki'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['toggletoolbar'] = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-toggletoolbar'}

" Ryan Mechelke
let s:scm_vim_org_sources.3262 = {'type': 'hg', 'url': 'https://bitbucket.org/thetoast/diff-fold'}

" Roman Dobosz
let s:scm_vim_org_sources.3367 = {'type': 'hg', 'url': 'https://bitbucket.org/gryf/vimblogger_ft'}

" shellholic
let s:scm_vim_org_sources.3400 = {'type': 'hg', 'url': 'https://bitbucket.org/shellholic/vim-creole'}

" Ludovic Chabant
let s:scm_vim_org_sources.3861 = {'type': 'hg', 'url': 'https://bitbucket.org/ludovicchabant/vim-lawrencium'}

" Kosei Kitahara
let s:scm_vim_org_sources.2827 = {'type': 'hg', 'url': 'https://bitbucket.org/Surgo/rtm.vim'}

" Maxim Kim
" Using “@hg” here because we need to alter runtimepath, but only for mercurial 
" source
let s:scm_plugin_sources['vimwiki@hg'] = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki/'}
let s:missing_addon_infos['vimwiki@hg'] = {'runtimepath': 'src'}

" Christian Ebert
let s:scm_vim_org_sources.1512 = {'type': 'hg', 'url': 'http://www.blacktrash.org/hg/screenpaste'}

" Ted Pavlic
" Note: it is not an actual vim script, it is a command-line (shell 
" command-line) utility
let s:scm_vim_org_sources.2182 = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

" Jonas Kramer
let s:scm_vim_org_sources.2446 = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

" Jannis Pohlmann
" Following repository does not contain correct directory tree
" let s:scm_vim_org_sources.2278 = {'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate.git'}

" Mick Koch
let s:scm_vim_org_sources.3590 = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

" Rykka Krin
let s:scm_vim_org_sources.3597 = {'type': 'git', 'url': 'git://github.com/Rykka/ColorV'}
let s:scm_vim_org_sources.3729 = {'type': 'git', 'url': 'git://github.com/Rykka/vim-galaxy'}

" Andrew Radev
let s:scm_vim_org_sources.3613 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/splitjoin.vim'}
let s:scm_vim_org_sources.3771 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/tagfinder.vim'}
let s:scm_vim_org_sources.3745 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/linediff.vim'}

" Radek Kowalski
let s:scm_vim_org_sources.3331 = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

" Vincent Velociter
let s:scm_vim_org_sources.3673 = {'type': 'git', 'url': 'git://github.com/veloce/vim-aldmeris'}

" Bogdan Popa
let s:scm_vim_org_sources.3484 = {'type': 'git', 'url': 'git://github.com/Bogdanp/pyrepl.vim'}

" Yo-An Lin
let s:scm_vim_org_sources.2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}

let s:scm_vim_org_sources.2885 = {'type': 'git', 'url': 'git://github.com/c9s/gsession.vim'}
let s:scm_vim_org_sources.2883 = {'type': 'git', 'url': 'git://github.com/c9s/growlnotify.vim'}
let s:mai_snr.2883 = {'runtimepath': 'vimlib'}
let s:scm_vim_org_sources.2824 = {'type': 'git', 'url': 'git://github.com/c9s/libperl.vim'}
let s:mai_snr.2824 = {'runtimepath': 'vimlib'}
let s:scm_vim_org_sources.2786 = {'type': 'git', 'url': 'git://github.com/c9s/cpan.vim'}
let s:scm_vim_org_sources.2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let s:scm_vim_org_sources.2847 = {'type': 'git', 'url': 'git://github.com/c9s/pod-helper.vim'}
let s:mai_snr.2847 = {'runtimepath': 'vimlib'}
let s:scm_vim_org_sources.2852 = {'type': 'git', 'url': 'git://github.com/c9s/perlomni.vim'}
let s:scm_vim_org_sources.2893 = {'type': 'git', 'url': 'git://github.com/c9s/filetype-completion.vim'}
let s:scm_vim_org_sources.2922 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let s:scm_vim_org_sources.2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let s:scm_vim_org_sources.2925 = {'type': 'git', 'url': 'git://github.com/c9s/apt-complete.vim'}
let s:scm_vim_org_sources.2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let s:scm_vim_org_sources.2958 = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
let s:scm_vim_org_sources.2959 = s:scm_vim_org_sources.2958
let s:scm_vim_org_sources.3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
let s:scm_vim_org_sources.2995 = {'type': 'git', 'url': 'git://github.com/c9s/colorselector.vim'}
let s:scm_vim_org_sources.3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
let s:scm_vim_org_sources.3544 = {'type': 'git', 'url': 'git://github.com/c9s/cascading.vim'}
" Following repository does not contain correct directory tree
" let s:scm_vim_org_sources.3005 = {'type': 'git', 'url': 'git://github.com/c9s/simple-commenter.vim'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['vim-dev-plugin'] = {'type': 'git', 'url': 'git://github.com/c9s/vim-dev-plugin'}
let s:scm_plugin_sources['jifty'] = {'type': 'git', 'url': 'git://github.com/c9s/jifty.vim'}

" wei ko kao
let s:scm_vim_org_sources.3282 = {'type': 'git', 'url': 'git://github.com/othree/eregex.vim'}
let s:scm_vim_org_sources.3236 = {'type': 'git', 'url': 'git://github.com/othree/html5.vim'}
let s:scm_vim_org_sources.3232 = {'type': 'git', 'url': 'git://github.com/othree/html5-syntax.vim'}
let s:scm_vim_org_sources.3453 = {'type': 'git', 'url': 'git://github.com/othree/fecompressor.vim'}

" David JH
let s:scm_vim_org_sources.2442 = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

" Micah Elliott
" Following repository does not contain correct directory tree
" let s:scm_vim_org_sources.1365 = {'type': 'git', 'url': 'git://gist.github.com/720355'}

" Kien Nguyen
let s:scm_vim_org_sources.3626 = {'type': 'git', 'url': 'git://github.com/kien/autosavesetting.vim'}
let s:scm_vim_org_sources.3699 = {'type': 'git', 'url': 'git://github.com/kien/premailer.vim'}
let s:scm_vim_org_sources.3696 = {'type': 'git', 'url': 'git://github.com/kien/prefixer.vim'}
let s:scm_vim_org_sources.3697 = {'type': 'git', 'url': 'git://github.com/kien/cssbaseline.vim'}
let s:scm_vim_org_sources.3698 = {'type': 'git', 'url': 'git://github.com/kien/html_emogrifier.vim'}
let s:scm_vim_org_sources.3772 = {'type': 'git', 'url': 'git://github.com/kien/rainbow_parentheses.vim'}
let s:scm_vim_org_sources.3736 = {'type': 'git', 'url': 'git://github.com/kien/ctrlp.vim'}

" Andy Dawson
let s:scm_vim_org_sources.3447 = {'type': 'git', 'url': 'git://github.com/AD7six/vim-activity-log'}

" Caleb Cushing
" Following repository does not contain correct directory tree
" let s:scm_vim_org_sources.2409 = {'type': 'git', 'url': 'git://github.com/xenoterracide/sql_iabbr'}

" Zachary Michaels
let s:scm_vim_org_sources.2960 = {'type': 'git', 'url': 'git://github.com/mikezackles/Bisect'}

" Daniel Schauenberg
let s:scm_vim_org_sources.3582 = {'type': 'git', 'url': 'git://github.com/mrtazz/simplenote.vim'}

" Gustaf Sjoberg
let s:scm_vim_org_sources.3534 = {'type': 'git', 'url': 'git://github.com/strange/strange.vim'}

" Eustaquio Rangel de Oliveira Jr.
let s:scm_vim_org_sources.3308 = {'type': 'git', 'url': 'git://github.com/taq/vim-refact'}
let s:scm_vim_org_sources.1966 = {'type': 'git', 'url': 'git://github.com/taq/vim-ruby-snippets'}
let s:scm_vim_org_sources.2258 = {'type': 'git', 'url': 'git://github.com/taq/vim-git-branch-info'}
let s:scm_vim_org_sources.2567 = {'type': 'git', 'url': 'git://github.com/taq/vim-rspec'}

" Bryant Hankins
let s:scm_vim_org_sources.3243 = {'type': 'git', 'url': 'git://github.com/bryanthankins/vim-aspnetide'}

" Nick Reynolds
let s:scm_vim_org_sources.3650 = {'type': 'git', 'url': 'git://github.com/ndreynolds/vim-cakephp'}

" Javier Rojas
let s:scm_vim_org_sources.2968 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-nav.git/'}
let s:scm_vim_org_sources.3156 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-syntax.git/'}

" Taylor Hedberg
let s:scm_vim_org_sources.3723 = {'type': 'git', 'url': 'git://github.com/tmhedberg/SimpylFold'}
let s:scm_vim_org_sources.3724 = {'type': 'git', 'url': 'git://github.com/tmhedberg/indent-motion'}

" Susan Potter
let s:scm_vim_org_sources.3207 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-bundler'}
let s:scm_vim_org_sources.3488 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-rebar'}

" Vincent Driessen
let s:scm_vim_org_sources.3258 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyunit'}
let s:scm_vim_org_sources.3160 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pep8'}
let s:scm_vim_org_sources.3161 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyflakes'}
let s:scm_vim_org_sources.3166 = {'type': 'git', 'url': 'git://github.com/nvie/vim-togglemouse'}

" Trevor Little
let s:scm_vim_org_sources.3507 = {'type': 'git', 'url': 'git://github.com/bundacia/ScreenPipe'}

" Enlil Dubenstein
let s:scm_vim_org_sources.3763 = {'type': 'git', 'url': 'git://github.com/dubenstein/vim-google-scribe'}

" Miller Medeiros
let s:scm_vim_org_sources.3786 = {'type': 'git', 'url': 'git://github.com/millermedeiros/vim-statline'}

" Yasuhiro Matsumoto
let s:scm_vim_org_sources.52 = {'type': 'git', 'url': 'git://github.com/mattn/calendar-vim'}
let s:scm_vim_org_sources.2981 = {'type': 'git', 'url': 'git://github.com/mattn/zencoding-vim'}
let s:scm_vim_org_sources.2423 = {'type': 'git', 'url': 'git://github.com/mattn/gist-vim'}
let s:scm_vim_org_sources.2678 = {'type': 'git', 'url': 'git://github.com/mattn/googlereader-vim'}
let s:scm_vim_org_sources.2948 = {'type': 'git', 'url': 'git://github.com/mattn/googlesuggest-complete-vim'}
let s:scm_vim_org_sources.3505 = {'type': 'git', 'url': 'git://github.com/mattn/pastebin-vim'}
let s:scm_vim_org_sources.3790 = {'type': 'git', 'url': 'git://github.com/mattn/sonictemplate-vim'}
" Requires postupdate hook // though non-SCM source does also
let s:scm_vim_org_sources.687 = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['webapi-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
let s:scm_plugin_sources['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
let s:scm_plugin_sources['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}

" Chris Yip
" Following repository does not contain correct directory tree
" let s:scm_vim_org_sources.3220 = {'type': 'git', 'url': 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'}

" Mike West
let s:scm_vim_org_sources.3766 = {'type': 'git', 'url': 'git://github.com/mikewest/vimroom'}

" Takeshi NISHIDA
let s:scm_vim_org_sources.2637 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scmfrontend'}
let s:scm_vim_org_sources.1879 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-autocomplpop'}
let s:scm_vim_org_sources.1984 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'}
let s:mai_snr_deps.1984  = [3252]
let s:scm_vim_org_sources.2199 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-gauref'}
let s:scm_vim_org_sources.3252 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-l9'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['abolish#doc-ja'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-abolish-ja'}
let s:scm_plugin_sources['dsary'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-dsary'}
let s:scm_plugin_sources['fteval'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fteval'}
let s:scm_plugin_sources['jabeige'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-jabeige'}
let s:scm_plugin_sources['luciusmod'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-luciusmod'}
let s:scm_plugin_sources['scriproject'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scriproject'}

" Tamas Kovacs
let s:scm_vim_org_sources.2531 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/slimv'}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
let s:scm_vim_org_sources.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let s:scm_vim_org_sources.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['lh-brackets'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let s:scm_plugin_sources['build-tools-wrapper'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/BTW/trunk'}
let s:scm_plugin_sources['lh-tags'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/tags/trunk'}
let s:scm_plugin_sources['lh-dev'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/dev/trunk'}
let s:scm_plugin_sources['lh-refactor'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/refactor/trunk'}
let s:scm_plugin_sources['search-in-runtime'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
let s:scm_plugin_sources['system-tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/system-tools/trunk'}
let s:scm_plugin_sources['UT'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/UT/trunk'}
" Not owned by Luc Hermitte
" let s:scm_vim_org_sources.222 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}

" Rok Garbas
let s:scm_vim_org_sources.3617 = {'type': 'git', 'url': 'git://github.com/Bogdanp/quicksilver.vim'}

" @kevinwatters
let s:scm_vim_org_sources.2441 = {'type': 'git', 'url': 'git://github.com/kevinw/pyflakes-vim'}

" Gunther Groenewege
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['vim-less'] = {'type': 'git', 'url':  'git://github.com/groenewege/vim-less'}

" Hallison Batista
let s:scm_vim_org_sources.2878 = {'type': 'git', 'url': 'git://github.com/hallison/vim-rdoc'}
let s:scm_vim_org_sources.2573 = {'type': 'git', 'url': 'git://github.com/hallison/vim-darkdevel'}
let s:scm_vim_org_sources.2882 = {'type': 'git', 'url': 'git://github.com/hallison/vim-markdown'}
let s:scm_vim_org_sources.2942 = {'type': 'git', 'url': 'git://github.com/hallison/vim-ruby-sinatra'}

" Eric Van Dewoestine
let s:scm_vim_org_sources.1643 = {'type': 'git', 'url': 'git://github.com/ervandew/supertab'}
let s:scm_vim_org_sources.2711 = {'type': 'git', 'url': 'git://github.com/ervandew/screen'}
let s:scm_vim_org_sources.1093 = {'type': 'git', 'url': 'git://github.com/ervandew/archive'}
let s:scm_vim_org_sources.3661 = {'type': 'git', 'url': 'git://github.com/ervandew/lookup'}
let s:scm_vim_org_sources.3668 = {'type': 'git', 'url': 'git://github.com/ervandew/sgmlendtag'}

" Miles Sterrett
let s:scm_vim_org_sources.2571 = {'type': 'git', 'url': 'git://github.com/mileszs/apidock.vim'}
let s:scm_vim_org_sources.2572 = {'type': 'git', 'url': 'git://github.com/mileszs/ack.vim'}

" Bob Hiestand
let s:scm_vim_org_sources.90 = {'type': 'git', 'url': 'git://repo.or.cz/vcscommand'}

" Greg Sexton
let s:scm_vim_org_sources.3329 = {'type': 'git', 'url': 'git://github.com/gregsexton/VimCalc'}
let s:scm_vim_org_sources.3481 = {'type': 'git', 'url': 'git://github.com/gregsexton/Atom'}
let s:scm_vim_org_sources.3521 = {'type': 'git', 'url': 'git://github.com/gregsexton/Gravity'}
let s:scm_vim_org_sources.3574 = {'type': 'git', 'url': 'git://github.com/gregsexton/gitv'}
let s:mai_snr_deps.3574 = [2975]
let s:scm_vim_org_sources.3818 = {'type': 'git', 'url': 'git://github.com/gregsexton/MatchTag'}

" Jezreel Ng
let s:scm_vim_org_sources.3509 = {'type': 'git', 'url': 'git://github.com/int3/vim-extradite'}
let s:mai_snr_deps.3509 = [2975]
let s:scm_vim_org_sources.3504 = {'type': 'git', 'url': 'git://github.com/int3/vim-taglist-plus'}
let s:scm_vim_org_sources.3604 = {'type': 'git', 'url': 'git://github.com/int3/nicer-vim-regexps'}

" Sasha Koss
let s:scm_vim_org_sources.3387 = {'type': 'git', 'url': 'git://github.com/kossnocorp/perfect.vim'}
let s:scm_vim_org_sources.3300 = {'type': 'git', 'url': 'git://github.com/kossnocorp/up.vim'}
let s:scm_vim_org_sources.3362 = {'type': 'git', 'url': 'git://github.com/kossnocorp/janitor.vim'}

" Xavier Deguillard
let s:scm_vim_org_sources.3302 = {'type': 'git', 'url': 'git://github.com/Rip-Rip/clang_complete'}

" thinca
let s:scm_vim_org_sources.2931 = {'type': 'git', 'url': 'git://github.com/thinca/vim-fontzoom'}
let s:scm_vim_org_sources.2860 = {'type': 'git', 'url': 'git://github.com/thinca/vim-prettyprint'}
let s:scm_vim_org_sources.2834 = {'type': 'git', 'url': 'git://github.com/thinca/vim-template'}
let s:scm_vim_org_sources.2944 = {'type': 'git', 'url': 'git://github.com/thinca/vim-visualstar'}
let s:scm_vim_org_sources.3067 = {'type': 'git', 'url': 'git://github.com/thinca/vim-ref'}
let s:scm_vim_org_sources.3146 = {'type': 'git', 'url': 'git://github.com/thinca/vim-quickrun'}
let s:scm_vim_org_sources.3393 = {'type': 'git', 'url': 'git://github.com/thinca/vim-localrc'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['rtputil'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-rtputil'}
let s:scm_plugin_sources['ambicmd'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ambicmd'}
let s:scm_plugin_sources['logcat'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-logcat'}
let s:scm_plugin_sources['editvar'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-editvar'}
let s:scm_plugin_sources['partedit'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-partedit'}
let s:scm_plugin_sources['unite-history'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-unite-history'}
let s:scm_plugin_sources['textobj-comment'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-comment'}
let s:scm_plugin_sources['vim-github'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-github'}
let s:scm_plugin_sources['auto_source'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-auto_source'}
let s:scm_plugin_sources['vim-scouter'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-scouter'}
let s:scm_plugin_sources['poslist'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-poslist'}
let s:scm_plugin_sources['vim-ft-vim_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-vim_fold'}
let s:scm_plugin_sources['operator-sequence'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-operator-sequence'}
let s:scm_plugin_sources['openbuf'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-openbuf'}
let s:scm_plugin_sources['vim-vcs'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vcs'}
let s:scm_plugin_sources['vim-ft-markdown_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-markdown_fold'}
let s:scm_plugin_sources['vim-ft-svn_diff'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-svn_diff'}
let s:scm_plugin_sources['textobj-function-perl'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-perl'}
let s:scm_plugin_sources['textobj-function-javascript'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-javascript'}
let s:scm_plugin_sources['textobj-between'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-between'}
let s:scm_plugin_sources['vim-ft-rst_header'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-rst_header'}
let s:scm_plugin_sources['vim-ft-diff_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-diff_fold'}
let s:scm_plugin_sources['befunge'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-befunge'}
let s:scm_plugin_sources['textobj-plugins'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-plugins'}
let s:scm_plugin_sources['vparsec'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vparsec'}
let s:scm_plugin_sources['tabrecent'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-tabrecent'}
let s:scm_plugin_sources['qfreplace'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-qfreplace'}
let s:scm_plugin_sources['guicolorscheme@thinca'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-guicolorscheme'}

" Josh Adams
let s:scm_vim_org_sources.3464 = {'type': 'git', 'url': 'git://github.com/godlygeek/tabular'}
" The following plugins are not present on vim.org:
let s:scm_plugin_sources['csapprox'] = {'type': 'git', 'url': 'git://github.com/godlygeek/csapprox'}
let s:scm_plugin_sources['colorchart'] = {'type': 'git', 'url': 'git://github.com/godlygeek/colorchart'}
let s:scm_plugin_sources['netlib'] = {'type': 'git', 'url': 'git://github.com/godlygeek/netlib'}
let s:scm_plugin_sources['vim-plugin-bundling'] = {'type': 'git', 'url': 'git://github.com/godlygeek/vim-plugin-bundling'}
let s:scm_plugin_sources['windowlayout'] = {'type': 'git', 'url': 'git://github.com/godlygeek/windowlayout'}

" drdr xp
let s:scm_vim_org_sources.2611 = {'type': 'git', 'url': 'git://github.com/drmingdrmer/xptemplate'}

" Holger Rapp
let s:scm_vim_org_sources.2715 = {'type': 'bzr', 'url': 'lp:ultisnips'}

" Drew Neil
let s:scm_vim_org_sources.3382 = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-textobj-rubyblock'}
let s:mai_snr_deps.3382 = [39, 2100]
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['vim-pml'] = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-pml'}

" Scott Bronson
let s:scm_vim_org_sources.3201 = {'type': 'git', 'url': 'git://github.com/bronson/vim-trailing-whitespace'}
" The following plugin is not present on vim.org:
let s:scm_plugin_sources['vim-toggle-wrap'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-toggle-wrap'}

" Peter Hosey
" The following plugin does not have normal directory structure:
let s:scm_vim_org_sources.2475 = {'url': 'https://bitbucket.org/boredzo/vim-ini-syntax/raw/default/ini.vim', 'archive_name': 'ini.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'ini syntax definition'}

" Jochen Bartl
" The following plugin does not have normal directory structure:
let s:scm_vim_org_sources.2479 = {'url': 'https://bitbucket.org/lobo/grsecurityvim/raw/default/grsecurity.vim', 'archive_name': 'grsecurity.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'grsecurity.vim'}

" Weakish Jiang
" The following repository does not have normal directory structure:
" let s:scm_plugin_sources['rc'] = {'type': 'git', 'url': 'git://gist.github.com/986788'}

" " xolox
" " Commented until author puts vim files in proper directories or somebody implements postinstall hooks
" let s:scm_vim_org_sources.3242 = {'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}

" others:
let s:plugin_sources['cscope_macros'] = {'version': '1.0', 'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'vim_version': '6.0', 'date': '2007-09-02', 'type': 'archive', 'script-type': 'utility', 'archive_name': 'cscope_maps.vim', 'author': 'Jason Duell'}
let s:plugin_sources['pgnvim'] = {'url': 'https://github.com/Raimondi/pgnvim/raw/master/pgn.vim', 'archive_name': 'pgn.vim', 'author': 'Israel Chauca Fuentes', 'type': 'archive', 'script-type': 'syntax', 'title': 'pgnvim'}

let s:scm_plugin_sources['mustache'] = {'type': 'git', 'url': 'git://github.com/juvenn/mustache.vim'}
let s:scm_plugin_sources['Vim-R-plugin2'] = {'type': 'git', 'url': 'git://github.com/jimmyharris/vim-r-plugin2'}
let s:scm_plugin_sources['vim-ruby-debugger'] = {'type': 'git', 'url': 'git://github.com/astashov/vim-ruby-debugger'}
let s:scm_plugin_sources['codefellow'] = {'type': 'git', 'url': 'git://github.com/romanroe/codefellow'}
let s:missing_addon_infos['codefellow'] = {'runtimepath': 'vim'}
let s:scm_plugin_sources['space'] = {'type': 'git', 'url': 'git://github.com/spiiph/vim-space'}
let s:scm_plugin_sources['vim-comment-object'] = {'type': 'git', 'url': 'git://github.com/ConradIrwin/vim-comment-object'}
let s:scm_plugin_sources['git-vim'] = {'type': 'git', 'url': 'git://github.com/motemen/git-vim'}
let s:scm_plugin_sources['vimpager-perlmod'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vimpager-perlmod'}
let s:scm_plugin_sources['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim'}
let s:missing_addon_infos['ideone'] = {'dependencies': {"webapi-vim": { } } }
let s:scm_plugin_sources['sparkup'] = {'type': 'git', 'url': 'git://github.com/rstacruz/sparkup'}
let s:missing_addon_infos['sparkup'] = {'runtimepath': 'vim'}

" this is only the vimfiles subdirectory:
let s:scm_plugin_sources['vim-latex'] = {'type': 'svn', 'url': 'https://vim-latex.svn.sourceforge.net/svnroot/vim-latex/trunk/vimfiles'}

" kana (most can be found on www.vim.org. However they all have a different
" subdirectories - So checking out from git seems to be easier to me to
" support them all.
let s:scm_kana_sources = {}
for n in split('vim-exfiletype vim-xire vim-arpeggio vim-textobj-user vim-altercmd vim-fakeclip vim-operator-user vim-vspec vim-wwwsearch vim-textobj-syntax vim-textobj-indent vim-operator-replace vim-grex vim-xml-move vim-xml-autons vim-vcsi vim-textobj-lastpat vim-textobj-jabraces vim-textobj-function vim-textobj-fold vim-textobj-entire vim-textobj-diff vim-surround vim-submode vim-smartword vim-smarttill vim-smartchr vim-skeleton vim-scratch vim-repeat vim-narrow vim-metarw vim-metarw-git vim-flydiff vim-exjumplist vim-bundle vim-textobj-datetime vim-textobj-django-template chat.vim-users.jp-log-converter jkramer-vim-narrow kuy-vim-fuzzyjump thinca-vim-qfreplace mootoh-vim-refe2 thinca-vim-ku-file_mru ujihisa-vim-quickrun vim-flymake vim-perproject vim-stackreg vim-outputz vim-ctxabbr vim-advice vim-ku-quickfix vim-ku-metarw vim-ku-bundle vim-ku-args vim-ku', ' ')
  let na = substitute(n,'^vim-','','')
  let s:scm_kana_sources[na] = {'type': 'git', 'url': 'git://github.com/kana/'.n}
  if n =~ 'vim-textobj-\%(user\)\@!'
    let s:missing_addon_infos[na] = {'dependencies': {'textobj-user': { } } }
  endif
  unlet na
endfor

"}}}
"Additional sources information {{{

" add / correct some types:
let s:plugin_sources[s:snr_to_name[2527]]['script-type'] = 'ftplugin'
let s:plugin_sources[s:snr_to_name[1542]]['target_dir'] = 'autoload'
let s:plugin_sources[s:snr_to_name[1542]]['script-type'] = 'autoload'
let s:plugin_sources[s:snr_to_name[1686]]['script-type'] = 'colors'
let s:plugin_sources[s:snr_to_name[2572]]['strip-components'] = 0
let s:plugin_sources[s:snr_to_name[2429]]['strip-components'] = 0
let s:plugin_sources[s:snr_to_name[2150]]['script-type'] = 'after/syntax'

" plugin infos - written if the plugin doesn't ship one itself {{{

" this is mainly used to add missing dependencies
let s:mai_snr_deps.884 = [294]
let s:mai_snr.663 = {'runtimepath': 'vim'}
" WTF Is this?
let s:missing_addon_infos['browser_4025'] = {'dependencies': {'synmark':{}}, 'runtimepath': 'vim'}
"}}}

" fix target directories {{{1
let s:plugin_sources['rubycomplete']['target_dir'] = 'autoload'

let s:plugin_sources['xptemplate']['strip-components'] = 0

let s:plugin_sources['scala']['script-type'] = 'syntax'

" deprecations {{{1
let s:plugin_sources[s:snr_to_name[1780]]['deprecated'] = "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"
let s:plugin_sources[s:snr_to_name[1662]]['deprecated'] = "you should consider using ruby-vim instead"
let s:plugin_sources[s:snr_to_name[113]]['deprecated'] = "greputils supersedes this plugin"

let s:scm_vim_org_sources.2540['deprecated'] = "snipMate is an alias to snipmate now - so use 'snipmate'"
let s:plugin_sources['lazysnipmate']['deprecated'] = "lazysnipmate’s update is just snipmate"
let s:plugin_sources[s:snr_to_name[2736]]['deprecated'] = "consider using syntastic2 because it is easier to adopt its behaviour to your needs"

let s:plugin_sources[s:snr_to_name[3184]]['deprecated'] = "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"
let s:plugin_sources[s:snr_to_name[3325]]['deprecated'] = "All functions from this plugin are available through `os' resource of @/os frawor module"
let s:plugin_sources[s:snr_to_name[3187]]['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
let s:plugin_sources[s:snr_to_name[3188]]['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
let s:plugin_sources[s:snr_to_name[3186]]['deprecated'] = "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"

let s:plugin_sources[s:snr_to_name[727]]['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
let s:plugin_sources[s:snr_to_name[441]]['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
let s:plugin_sources[s:snr_to_name[3393]]['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"

let s:plugin_sources[s:snr_to_name[1318]]['deprecated'] = "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"
"}}}
for [s:snr, s:deps] in items(s:mai_snr_deps)
    if !has_key(s:mai_snr, s:snr)
        let s:mai_snr[s:snr]={}
    endif
    call map(s:deps, 'extend(s:mai_snr.'.s:snr.', {"dependencies": {s:snr_to_name[v:val] : { } } })')
endfor
unlet s:snr s:deps s:mai_snr_deps
call map(s:mai_snr, 'extend(s:missing_addon_infos, {s:snr_to_name[v:key] : v:val})')
unlet s:mai_snr
call map(s:missing_addon_infos, 'tr(string(v:val), "''", ''"'')')
unlet s:missing_addon_infos

for s:name in filter(keys(s:scm_plugin_sources), 'has_key(s:plugin_sources, v:val)')
    echohl Error
    echom 'Removed conflicting (present both in scm_plugin_sources and vim_org_sources) name: '.s:name
    echohl None
    unlet s:scm_plugin_sources[s:name]
    unlet s:name
endfor

call extend(s:scm_plugin_sources, s:scm_kana_sources)
unlet s:scm_kana_sources

call map(s:scm_vim_org_sources, 'extend(s:scm_plugin_sources, {s:snr_to_name[v:key] : v:val})')
unlet s:scm_vim_org_sources


call call(get(s:c,'MergeSources',function('vam_known_repositories#MergeSources')),
      \ [s:c['plugin_sources'], s:plugin_sources, s:scm_plugin_sources], {})

unlet s:scm_plugin_sources s:plugin_sources s:snr_to_name
" vim:fdm=marker
