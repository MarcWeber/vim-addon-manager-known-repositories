" shut up errors for now: (this code will be moved to patch function
let s:mai_snr = {}
let s:mai_snr_deps = {}

fun! vamkr#scm#Sources()
  " Manually maintained set of git/hg/svn... repositories
  " Depending on your configuration they may overwrite www.vim.org sources
  let d = {}
  " They are assigned by "script-id" because in rare cases names change.
  " This way less will break.


  " Marc Weber
  let d.vim_script_nr_3429 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sml'}
  let d.vim_script_nr_1582 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-background-cmd'}
  " let d.vim_script_nr_1963 = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
  let d.vim_script_nr_2376 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sql'}
  let d.vim_script_nr_2934 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-actions'}
  let d.vim_script_nr_2933 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-fcsh'}
  let d.vim_script_nr_2940 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-mw-utils'}
  let d.vim_script_nr_3018 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-completion'}
  let d.vim_script_nr_3124 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sbt'}
  let d.vim_script_nr_3143 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-haxe'}
  let d.vim_script_nr_3199 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ocaml'}
  let d.vim_script_nr_3307 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-async'}
  let d.vim_script_nr_3315 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-json-encoding'}
  let d.vim_script_nr_3317 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-signs'}
  let d.vim_script_nr_3320 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-xdebug'}
  let d.vim_script_nr_3432 = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
  let d['theonevimlib'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
  let d['vim-addon-lout'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
  let d['vim-addon-urweb'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-urweb'}
  let d['vim-addon-swfmill'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-swfmill'}
  let d['vim-addon-views'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-views'}
  let d['vim-addon-goto-thing-at-cursor'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-goto-thing-at-cursor'}
  let d['scion-backend-vim'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/scion-backend-vim'}
  let d['vim-addon-haskell'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
  let d['vim-addon-nix'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-nix'}
  let d['vim-addon-scala'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-scala'}
  let d['vim-addon-git'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-git'}
  let d['vim-addon-povray'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-povray'}
  let d['vim-addon-toggle-buffer'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-toggle-buffer'}
  let d['vim-addon-other'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-other'}
  let d['vim-addon-php-manual'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-php-manual'}
  let d['vim-addon-local-vimrc'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-local-vimrc'}
  let d['syntastic2'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/syntastic2'}
  let d['snipmate'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
  let d['vim-ruby'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-ruby'}
  let d['SmartTag'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/SmartTag'}
  let d['ensime'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/ensime', 'branch': 'master-vim-cleaned-up'}
  " override snipmate. There is really no reason anymore to use the old version
  " snipMate could be dropped. Keep alias
  let d.vim_script_nr_2540 = copy(d['snipmate'])

  " Honza Pokorny
  " snipmate-snippets depends on snipmate so installing the snippets should be 
  " enough
  let d.vim_script_nr_3633 = {'type': 'git', 'url': 'git://github.com/honza/snipmate-snippets'}

  " Peter Odding
  let d.vim_script_nr_2252 = {'type': 'git', 'url': 'git://github.com/xolox/vim-publish'}
  let d.vim_script_nr_3104 = {'type': 'git', 'url': 'git://github.com/xolox/vim-pyref'}
  let d.vim_script_nr_3150 = {'type': 'git', 'url': 'git://github.com/xolox/vim-session'}
  let d.vim_script_nr_3114 = {'type': 'git', 'url': 'git://github.com/xolox/vim-easytags'}
  let d.vim_script_nr_3123 = {'type': 'git', 'url': 'git://github.com/xolox/vim-shell'}
  let d.vim_script_nr_3148 = {'type': 'git', 'url': 'git://github.com/xolox/vim-reload'}
  let d.vim_script_nr_3169 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-inspect'}
  let d.vim_script_nr_3375 = {'type': 'git', 'url': 'git://github.com/xolox/vim-notes'}
  let d.vim_script_nr_3625 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-ftplugin'}

  " Ciaran McCreesh
  let d.vim_script_nr_1876 = {'type': 'git', 'url': 'git://github.com/ciaranm/securemodelines'}
  let d.vim_script_nr_1143 = {'type': 'git', 'url': 'git://github.com/ciaranm/inkpot'}
  let d.vim_script_nr_1171 = {'type': 'git', 'url': 'git://github.com/ciaranm/detectindent'}

  " Shougo
  let d.vim_script_nr_2620 = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache'}
  let d.vim_script_nr_3396 = {'type': 'git', 'url': 'git://github.com/Shougo/unite.vim'}
  " The following plugins are not present on vim.org:
  let d['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell', 'addon-info': {'dependencies': {'vimproc': { } } }}
  let d['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
  let d['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
  let d['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
  let d['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}

  " ZyX
  let d.vim_script_nr_3056 = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
  let d.vim_script_nr_3185 = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
  let d.vim_script_nr_3113 = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
  let d.vim_script_nr_3189 = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
  let d.vim_script_nr_3190 = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
  let d.vim_script_nr_3828 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}
  " The following plugin is not present on vim.org:
  let d['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}

  " David Terei
  let d.vim_script_nr_3022 = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}

  " Tim Pope
  let d.vim_script_nr_1590 = {'type': 'git', 'url': 'git://github.com/tpope/vim-unimpaired'}
  let d.vim_script_nr_2386 = {'type': 'git', 'url': 'git://github.com/tpope/vim-endwise'}
  let d.vim_script_nr_1697 = {'type': 'git', 'url': 'git://github.com/tpope/vim-surround'}
  let d.vim_script_nr_2973 = {'type': 'git', 'url': 'git://github.com/tpope/vim-cucumber'}
  let d.vim_script_nr_1567 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rails'}
  let d.vim_script_nr_2975 = {'type': 'git', 'url': 'git://github.com/tpope/vim-fugitive'}
  let d.vim_script_nr_1433 = {'type': 'git', 'url': 'git://github.com/tpope/vim-haml'}
  let d.vim_script_nr_1654 = {'type': 'git', 'url': 'git://github.com/tpope/vim-git'}
  let d.vim_script_nr_2332 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pathogen'}
  let d.vim_script_nr_1896 = {'type': 'git', 'url': 'git://github.com/tpope/vim-ragtag'}
  let d.vim_script_nr_1891 = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
  let d.vim_script_nr_2120 = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
  let d.vim_script_nr_1617 = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
  let d.vim_script_nr_1545 = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
  let d.vim_script_nr_1624 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
  let d.vim_script_nr_3695 = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
  let d.vim_script_nr_3669 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
  " The following plugin is not present on vim.org:
  let d['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}
  " " The following plugin is present on vim.org, but does not belong to Tim Pope
  " let d.vim_script_nr_1626 = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}
  " " The following plugin has the same name as one of vim.org ones, but different 
  " " author
  " let d['markdown'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}

  " Marty Grenfell
  let d.vim_script_nr_1218 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
  let d.vim_script_nr_1658 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
  let d.vim_script_nr_2736 = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

  " Luc Hermitte
  let d.vim_script_nr_214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
  let d.vim_script_nr_50 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
  let d.vim_script_nr_336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
  let d.vim_script_nr_229 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
  " Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
  " Others were not included as they are absent on www.vim.org

  " Viktor Kojouharov
  "tiagofalcao asked me to add the svn source:
  let d.vim_script_nr_1702 = {'type': 'svn', 'url': 'http://svn.enlightenment.org/svn/e/trunk/edje/data/vim/'}

  " Wincent Colaiuta
  let d.vim_script_nr_3025 = {'type': 'git', 'url': 'git://git.wincent.com/command-t.git'}

  " Antonio Salazar Cardozo
  let d.vim_script_nr_2962 = {'type': 'git', 'url': 'git://github.com/Shadowfiend/liftweb-vim'}

  " Nico Raffo
  let d.vim_script_nr_2771 = {'type': 'svn', 'url': 'http://conque.googlecode.com/svn/trunk/'}

  " Almaz Karimov
  let d.vim_script_nr_3231 = {'type': 'hg', 'url': 'https://vim-pyinteractive-plugin.googlecode.com/hg/'}

  " Steve Losh
  let d.vim_script_nr_3304 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/gundo.vim'}
  let d.vim_script_nr_3721 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/threesome.vim'}
  " The following plugin is not present on vim.org:
  let d['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}

  " Kim Silkebækken
  let d.vim_script_nr_3526 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-easymotion'}
  let d.vim_script_nr_3529 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-distinguished'}
  " The following plugin is not present on vim.org:
  let d['powerline'] = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-powerline'}

  " H Xu
  let d.vim_script_nr_3115 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/singlecompile'}
  let d.vim_script_nr_3219 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/projecttag'}
  let d.vim_script_nr_3301 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/trimblank'}
  let d.vim_script_nr_3434 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/iniparser'}
  let d.vim_script_nr_3492 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-g95.vim'}
  let d.vim_script_nr_3496 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-gfortran.vim'}
  let d.vim_script_nr_3497 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-ifort.vim'}
  let d.vim_script_nr_3506 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/compiler-pcc.vim'}
  let d.vim_script_nr_3747 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/syntax-dosini.vim'}
  " The following is not a vim plugin, but it is posted on vim.org:
  let d.vim_script_nr_3608 = {'type': 'git', 'url': 'git://github.com/xuhdev/nautilus-py-vim'}

  " Vincent T.
  let d.vim_script_nr_3606 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
  let d.vim_script_nr_3707 = {'type': 'hg', 'url': 'https://bitbucket.org/vayn/colorschemes'}
  let d.vim_script_nr_3596 = {'type': 'git', 'url': 'git://github.com/Vayn/Fanfou'}

  " Shuhei Kubota
  " The following plugins do not have normal directory structure:
  let d.vim_script_nr_2542 = {'url': 'https://bitbucket.org/shu/starrange/raw/default/starrange.vim', 'archive_name': 'starrange.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'StarRange'}
  let d.vim_script_nr_1283 = {'url': 'https://bitbucket.org/shu/tinybufferexplorer/raw/default/tbe.vim', 'archive_name': 'tbe.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'TinyBufferExplorer'}
  let d.vim_script_nr_1477 = {'url': 'https://bitbucket.org/shu/modeliner/raw/default/modeliner.vim', 'archive_name': 'modeliner.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Modeliner'}
  let d.vim_script_nr_2205 = {'url': 'https://bitbucket.org/shu/coremosearch/raw/default/coremo_search.vim', 'archive_name': 'coremo_search.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'CoremoSearch'}
  let d.vim_script_nr_3162 = {'url': 'https://bitbucket.org/shu/tabops/raw/default/tabops.vim', 'archive_name': 'tabops.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'tabops'}
  let d.vim_script_nr_2496 = {'url': 'https://bitbucket.org/shu/changed/raw/default/changed.vim', 'archive_name': 'changed.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'Changed'}
  let d.vim_script_nr_2843 = {'url': 'https://bitbucket.org/shu/fliplr/raw/default/fliplr.vim', 'archive_name': 'fliplr.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'FlipLR'}
  let d.vim_script_nr_3640 = {'url': 'https://bitbucket.org/shu/theoldones/raw/default/theoldones.vim', 'archive_name': 'theoldones.vim', 'type': 'archive', 'script-type': 'utility', 'title': 'The Old Ones'}

  " Michael Hart
  let d.vim_script_nr_3659 = {'type': 'hg', 'url': 'https://bitbucket.org/mikehart/lycosaexplorer'}

  " Preston Masion
  let d.vim_script_nr_3510 = {'type': 'hg', 'url': 'https://bitbucket.org/pentie/vimrepress'}

  " Dejan Noveski
  " This plugin has both mercurial and github repository. I have chosen to use 
  " first one, but I have no idea which is original and which is generated 
  " automatically
  let d.vim_script_nr_3416 = {'type': 'hg', 'url': 'https://bitbucket.org/dekomote/w3cvalidate.vim'}

  " AJ V
  let d.vim_script_nr_2720 = {'type': 'hg', 'url': 'https://bitbucket.org/fallintothis/arc-vim'}

  " Stephen Bach
  let d.vim_script_nr_1890 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}

  " Daniel Hofstetter
  " The following plugin is not present on vim.org:
  let d['scss-syntax'] = {'type': 'git', 'url': 'git://github.com/cakebaker/scss-syntax.vim'}

  " Barry Arthur
  " The following plugin is not present on vim.org:
  let d['VimLint'] = {'type': 'git', 'url': 'git://github.com/dahu/VimLint'}

  " Raimondi (Israel Chauca Fuentes):
  let d.vim_script_nr_3026 = {'type': 'git', 'url': 'git://github.com/Raimondi/PickAColor'}
  let d.vim_script_nr_2754 = {'type': 'git', 'url': 'git://github.com/Raimondi/delimitMate'}
  " The following plugins are not present on vim.org:
  " let d['bufring'] = {'type': 'git', 'url': 'git://github.com/Raimondi/bufring'}

  " Ned Konz
  let d.vim_script_nr_517 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

  " intuited - Ted
  " The following plugins are not present on vim.org:
  let d['vim-vamoose'] = {'type': 'git', 'url': 'git://github.com/intuited/vim-vamoose'}
  let d['visdo'] = {'type': 'git', 'url': 'git://github.com/intuited/visdo'}

  " beyondwords (github)
  " The following plugin is not present on vim.org:
  let d['vim-twig'] = {'type': 'git', 'url': 'git://github.com/beyondwords/vim-twig'}

  " Tom Link
  let d.vim_script_nr_2594 = {'type': 'git', 'url': 'git://github.com/tomtom/tmarks_vim'}
  let d.vim_script_nr_861 = {'type': 'git', 'url': 'git://github.com/tomtom/viki_vim'}
  let d.vim_script_nr_2033 = {'type': 'git', 'url': 'git://github.com/tomtom/trag_vim'}
  let d.vim_script_nr_2037 = {'type': 'git', 'url': 'git://github.com/tomtom/hookcursormoved_vim'}
  let d.vim_script_nr_1030 = {'type': 'git', 'url': 'git://github.com/tomtom/scalefont_vim'}
  let d.vim_script_nr_1915 = {'type': 'git', 'url': 'git://github.com/tomtom/tbibtools_vim'}
  let d.vim_script_nr_1160 = {'type': 'git', 'url': 'git://github.com/tomtom/tskeleton_vim'}
  let d.vim_script_nr_1173 = {'type': 'git', 'url': 'git://github.com/tomtom/tcomment_vim'}
  let d.vim_script_nr_1284 = {'type': 'git', 'url': 'git://github.com/tomtom/TortoiseSVN_vim'}
  let d.vim_script_nr_1751 = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
  let d.vim_script_nr_1431 = {'type': 'git', 'url': 'git://github.com/tomtom/checksyntax_vim'}
  let d.vim_script_nr_1730 = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}
  let d.vim_script_nr_2580 = {'type': 'git', 'url': 'git://github.com/tomtom/spec_vim'}
  let d.vim_script_nr_3013 = {'type': 'git', 'url': 'git://github.com/tomtom/tcommand_vim'}
  let d.vim_script_nr_1863 = {'type': 'git', 'url': 'git://github.com/tomtom/tlib_vim'}
  let d.vim_script_nr_1864 = {'type': 'git', 'url': 'git://github.com/tomtom/tmru_vim'}
  let d.vim_script_nr_1865 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectfiles_vim'}
  let d.vim_script_nr_1866 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectbuffer_vim'}
  let d.vim_script_nr_2014 = {'type': 'git', 'url': 'git://github.com/tomtom/ttoc_vim'}
  let d.vim_script_nr_2017 = {'type': 'git', 'url': 'git://github.com/tomtom/tregisters_vim'}
  let d.vim_script_nr_2018 = {'type': 'git', 'url': 'git://github.com/tomtom/ttags_vim'}
  let d.vim_script_nr_2040 = {'type': 'git', 'url': 'git://github.com/tomtom/tcalc_vim'}
  let d.vim_script_nr_2055 = {'type': 'git', 'url': 'git://github.com/tomtom/ttagecho_vim'}
  let d.vim_script_nr_2076 = {'type': 'git', 'url': 'git://github.com/tomtom/setsyntax_vim'}
  let d.vim_script_nr_2279 = {'type': 'git', 'url': 'git://github.com/tomtom/cmdlinehelp_vim'}
  let d.vim_script_nr_2292 = {'type': 'git', 'url': 'git://github.com/tomtom/linglang_vim'}
  let d.vim_script_nr_2437 = {'type': 'git', 'url': 'git://github.com/tomtom/shymenu_vim'}
  let d.vim_script_nr_2584 = {'type': 'git', 'url': 'git://github.com/tomtom/quickfixsigns_vim'}
  let d.vim_script_nr_3780 = {'type': 'git', 'url': 'git://github.com/tomtom/indentfolds_vim'}
  let d.vim_script_nr_2894 = {'type': 'git', 'url': 'git://github.com/tomtom/vikitasks_vim'}
  let d.vim_script_nr_2915 = {'type': 'git', 'url': 'git://github.com/tomtom/startup_profile_vim'}
  let d.vim_script_nr_2917 = {'type': 'git', 'url': 'git://github.com/tomtom/tplugin_vim'}
  let d.vim_script_nr_2991 = {'type': 'git', 'url': 'git://github.com/tomtom/rcom_vim'}
  let d.vim_script_nr_3051 = {'type': 'git', 'url': 'git://github.com/tomtom/vimform_vim'}
  let d.vim_script_nr_3214 = {'type': 'git', 'url': 'git://github.com/tomtom/presets_vim'}
  let d.vim_script_nr_3326 = {'type': 'git', 'url': 'git://github.com/tomtom/stakeholders_vim'}
  let d.vim_script_nr_3653 = {'type': 'git', 'url': 'git://github.com/tomtom/brep_vim'}
  " The following plugins are not present on vim.org:
  let d['toptions'] = {'type': 'git', 'url': 'git://github.com/tomtom/toptions_vim'}
  let d['worksheet'] = {'type': 'git', 'url': 'git://github.com/tomtom/worksheet_vim'}
  let d['prototype'] = {'type': 'git', 'url': 'git://github.com/tomtom/prototype_vim'}

  " Jakson Aquino
  let d.vim_script_nr_2628 = {'type': 'git', 'url': 'git://github.com/jcfaria/Vim-R-plugin.git'}

  " Robert Gleeson
  " The following plugin is not present on vim.org:
  let d['hammer.vim'] = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

  " Nathanael Kane
  let d.vim_script_nr_3361 = {'type': 'git', 'url': 'git://github.com/nathanaelkane/vim-indent-guides'}

  " Michael Sanders
  let d.vim_script_nr_2674 = {'type': 'git', 'url': 'git://github.com/msanders/cocoa.vim'}

  " Devin Weaver (sukima)
  let d.vim_script_nr_301 = {'type': 'git', 'url': 'git://github.com/sukima/xmledit'}

  " Thiago Alves
  let d.vim_script_nr_2009 = {'type': 'git', 'url': 'git://github.com/Townk/vim-autoclose'}

  " Ethan Schoonover
  let d.vim_script_nr_3520 = {'type': 'git', 'url': 'git://github.com/altercation/vim-colors-solarized'}

  " Manpreet Singh
  let d.vim_script_nr_1563 = {'type': 'git', 'url': 'git://github.com/junkblocker/patchreview-vim'}

  " jonathan hartley
  let d.vim_script_nr_3281 = {'type': 'hg', 'url': 'https://bitbucket.org/tartley/vim_run_python_tests'}

  " Shrikant Sharat Kandula
  let d.vim_script_nr_3285 = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-looks'}
  " The following plugins are not present on vim.org:
  let d['t-syntax'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/t-syntax'}
  " There is already another “gotofile” plugin on vim.org
  let d['gotofile@sharat87'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-gotofile'}

  " ali va
  " Yes, these are git repositories on bitbucket. Unfortunately, git:// URLs are 
  " not supported.
  let d.vim_script_nr_3853 = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-dokuwiki'}
  " The following plugin is not present on vim.org:
  let d['toggletoolbar'] = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-toggletoolbar'}

  " Ryan Mechelke
  let d.vim_script_nr_3262 = {'type': 'hg', 'url': 'https://bitbucket.org/thetoast/diff-fold'}

  " Roman Dobosz
  let d.vim_script_nr_3367 = {'type': 'hg', 'url': 'https://bitbucket.org/gryf/vimblogger_ft'}

  " shellholic
  let d.vim_script_nr_3400 = {'type': 'hg', 'url': 'https://bitbucket.org/shellholic/vim-creole'}

  " Ludovic Chabant
  let d.vim_script_nr_3861 = {'type': 'hg', 'url': 'https://bitbucket.org/ludovicchabant/vim-lawrencium'}

  " Kosei Kitahara
  let d.vim_script_nr_2827 = {'type': 'hg', 'url': 'https://bitbucket.org/Surgo/rtm.vim'}

  " Maxim Kim
  " Using “@hg” here because we need to alter runtimepath, but only for mercurial 
  " source
  let d['vimwiki@hg'] = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki/', 'addon-info': {'runtimepath': 'src'}}

  " Christian Ebert
  let d.vim_script_nr_1512 = {'type': 'hg', 'url': 'http://www.blacktrash.org/hg/screenpaste'}

  " Ted Pavlic
  " Note: it is not an actual vim script, it is a command-line (shell 
  " command-line) utility
  let d.vim_script_nr_2182 = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

  " Jonas Kramer
  let d.vim_script_nr_2446 = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

  " Jannis Pohlmann
  " Following repository does not contain correct directory tree
  " let d.vim_script_nr_2278 = {'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate.git'}

  " Mick Koch
  let d.vim_script_nr_3590 = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

  " Rykka Krin
  let d.vim_script_nr_3597 = {'type': 'git', 'url': 'git://github.com/Rykka/ColorV'}
  let d.vim_script_nr_3729 = {'type': 'git', 'url': 'git://github.com/Rykka/vim-galaxy'}

  " Andrew Radev
  let d.vim_script_nr_3613 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/splitjoin.vim'}
  let d.vim_script_nr_3771 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/tagfinder.vim'}
  let d.vim_script_nr_3745 = {'type': 'git', 'url': 'git://github.com/AndrewRadev/linediff.vim'}

  " Radek Kowalski
  let d.vim_script_nr_3331 = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

  " Vincent Velociter
  let d.vim_script_nr_3673 = {'type': 'git', 'url': 'git://github.com/veloce/vim-aldmeris'}

  " Bogdan Popa
  let d.vim_script_nr_3484 = {'type': 'git', 'url': 'git://github.com/Bogdanp/pyrepl.vim'}

  " Yo-An Lin
  let d.vim_script_nr_2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}

  let d.vim_script_nr_2885 = {'type': 'git', 'url': 'git://github.com/c9s/gsession.vim'}
  let d.vim_script_nr_2883 = {'type': 'git', 'url': 'git://github.com/c9s/growlnotify.vim'}
  let s:mai_snr.2883 = {'runtimepath': 'vimlib'}
  let d.vim_script_nr_2824 = {'type': 'git', 'url': 'git://github.com/c9s/libperl.vim'}
  let s:mai_snr.2824 = {'runtimepath': 'vimlib'}
  let d.vim_script_nr_2786 = {'type': 'git', 'url': 'git://github.com/c9s/cpan.vim'}
  let d.vim_script_nr_2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
  let d.vim_script_nr_2847 = {'type': 'git', 'url': 'git://github.com/c9s/pod-helper.vim'}
  let s:mai_snr.2847 = {'runtimepath': 'vimlib'}
  let d.vim_script_nr_2852 = {'type': 'git', 'url': 'git://github.com/c9s/perlomni.vim'}
  let d.vim_script_nr_2893 = {'type': 'git', 'url': 'git://github.com/c9s/filetype-completion.vim'}
  let d.vim_script_nr_2922 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
  let d.vim_script_nr_2913 = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
  let d.vim_script_nr_2925 = {'type': 'git', 'url': 'git://github.com/c9s/apt-complete.vim'}
  let d.vim_script_nr_2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
  let d.vim_script_nr_2958 = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
  let d.vim_script_nr_2959 = d.vim_script_nr_2958
  let d.vim_script_nr_3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
  let d.vim_script_nr_2995 = {'type': 'git', 'url': 'git://github.com/c9s/colorselector.vim'}
  let d.vim_script_nr_3009 = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
  let d.vim_script_nr_3544 = {'type': 'git', 'url': 'git://github.com/c9s/cascading.vim'}
  " Following repository does not contain correct directory tree
  " let d.vim_script_nr_3005 = {'type': 'git', 'url': 'git://github.com/c9s/simple-commenter.vim'}
  " The following plugins are not present on vim.org:
  let d['vim-dev-plugin'] = {'type': 'git', 'url': 'git://github.com/c9s/vim-dev-plugin'}
  let d['jifty'] = {'type': 'git', 'url': 'git://github.com/c9s/jifty.vim'}

  " wei ko kao
  let d.vim_script_nr_3282 = {'type': 'git', 'url': 'git://github.com/othree/eregex.vim'}
  let d.vim_script_nr_3236 = {'type': 'git', 'url': 'git://github.com/othree/html5.vim'}
  let d.vim_script_nr_3232 = {'type': 'git', 'url': 'git://github.com/othree/html5-syntax.vim'}
  let d.vim_script_nr_3453 = {'type': 'git', 'url': 'git://github.com/othree/fecompressor.vim'}

  " David JH
  let d.vim_script_nr_2442 = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

  " Micah Elliott
  " Following repository does not contain correct directory tree
  " let d.vim_script_nr_1365 = {'type': 'git', 'url': 'git://gist.github.com/720355'}

  " Kien Nguyen
  let d.vim_script_nr_3626 = {'type': 'git', 'url': 'git://github.com/kien/autosavesetting.vim'}
  let d.vim_script_nr_3699 = {'type': 'git', 'url': 'git://github.com/kien/premailer.vim'}
  let d.vim_script_nr_3696 = {'type': 'git', 'url': 'git://github.com/kien/prefixer.vim'}
  let d.vim_script_nr_3697 = {'type': 'git', 'url': 'git://github.com/kien/cssbaseline.vim'}
  let d.vim_script_nr_3698 = {'type': 'git', 'url': 'git://github.com/kien/html_emogrifier.vim'}
  let d.vim_script_nr_3772 = {'type': 'git', 'url': 'git://github.com/kien/rainbow_parentheses.vim'}
  let d.vim_script_nr_3736 = {'type': 'git', 'url': 'git://github.com/kien/ctrlp.vim'}

  " Andy Dawson
  let d.vim_script_nr_3447 = {'type': 'git', 'url': 'git://github.com/AD7six/vim-activity-log'}

  " Caleb Cushing
  " Following repository does not contain correct directory tree
  " let d.vim_script_nr_2409 = {'type': 'git', 'url': 'git://github.com/xenoterracide/sql_iabbr'}

  " Zachary Michaels
  let d.vim_script_nr_2960 = {'type': 'git', 'url': 'git://github.com/mikezackles/Bisect'}

  " Daniel Schauenberg
  let d.vim_script_nr_3582 = {'type': 'git', 'url': 'git://github.com/mrtazz/simplenote.vim'}

  " Gustaf Sjoberg
  let d.vim_script_nr_3534 = {'type': 'git', 'url': 'git://github.com/strange/strange.vim'}

  " Eustaquio Rangel de Oliveira Jr.
  let d.vim_script_nr_3308 = {'type': 'git', 'url': 'git://github.com/taq/vim-refact'}
  let d.vim_script_nr_1966 = {'type': 'git', 'url': 'git://github.com/taq/vim-ruby-snippets'}
  let d.vim_script_nr_2258 = {'type': 'git', 'url': 'git://github.com/taq/vim-git-branch-info'}
  let d.vim_script_nr_2567 = {'type': 'git', 'url': 'git://github.com/taq/vim-rspec'}

  " Bryant Hankins
  let d.vim_script_nr_3243 = {'type': 'git', 'url': 'git://github.com/bryanthankins/vim-aspnetide'}

  " Nick Reynolds
  let d.vim_script_nr_3650 = {'type': 'git', 'url': 'git://github.com/ndreynolds/vim-cakephp'}

  " Javier Rojas
  let d.vim_script_nr_2968 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-nav.git/'}
  let d.vim_script_nr_3156 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-syntax.git/'}

  " Taylor Hedberg
  let d.vim_script_nr_3723 = {'type': 'git', 'url': 'git://github.com/tmhedberg/SimpylFold'}
  let d.vim_script_nr_3724 = {'type': 'git', 'url': 'git://github.com/tmhedberg/indent-motion'}

  " Susan Potter
  let d.vim_script_nr_3207 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-bundler'}
  let d.vim_script_nr_3488 = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-rebar'}

  " Vincent Driessen
  let d.vim_script_nr_3258 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyunit'}
  let d.vim_script_nr_3160 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pep8'}
  let d.vim_script_nr_3161 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyflakes'}
  let d.vim_script_nr_3166 = {'type': 'git', 'url': 'git://github.com/nvie/vim-togglemouse'}

  " Trevor Little
  let d.vim_script_nr_3507 = {'type': 'git', 'url': 'git://github.com/bundacia/ScreenPipe'}

  " Enlil Dubenstein
  let d.vim_script_nr_3763 = {'type': 'git', 'url': 'git://github.com/dubenstein/vim-google-scribe'}

  " Miller Medeiros
  let d.vim_script_nr_3786 = {'type': 'git', 'url': 'git://github.com/millermedeiros/vim-statline'}

  " Yasuhiro Matsumoto
  let d.vim_script_nr_52 = {'type': 'git', 'url': 'git://github.com/mattn/calendar-vim'}
  let d.vim_script_nr_2981 = {'type': 'git', 'url': 'git://github.com/mattn/zencoding-vim'}
  let d.vim_script_nr_2423 = {'type': 'git', 'url': 'git://github.com/mattn/gist-vim'}
  let d.vim_script_nr_2678 = {'type': 'git', 'url': 'git://github.com/mattn/googlereader-vim'}
  let d.vim_script_nr_2948 = {'type': 'git', 'url': 'git://github.com/mattn/googlesuggest-complete-vim'}
  let d.vim_script_nr_3505 = {'type': 'git', 'url': 'git://github.com/mattn/pastebin-vim'}
  let d.vim_script_nr_3790 = {'type': 'git', 'url': 'git://github.com/mattn/sonictemplate-vim'}
  " Requires postupdate hook // though non-SCM source does also
  let d.vim_script_nr_687 = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
  " The following plugins are not present on vim.org:
  let d['webapi-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
  let d['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
  let d['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}

  " Chris Yip
  " Following repository does not contain correct directory tree
  " let d.vim_script_nr_3220 = {'type': 'git', 'url': 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'}

  " Mike West
  let d.vim_script_nr_3766 = {'type': 'git', 'url': 'git://github.com/mikewest/vimroom'}

  " Takeshi NISHIDA
  let d.vim_script_nr_2637 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scmfrontend'}
  let d.vim_script_nr_1879 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-autocomplpop'}
  let d.vim_script_nr_1984 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'}
  let s:mai_snr_deps.1984  = [3252]
  let d.vim_script_nr_2199 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-gauref'}
  let d.vim_script_nr_3252 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-l9'}
  " The following plugins are not present on vim.org:
  let d['abolish#doc-ja'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-abolish-ja'}
  let d['dsary'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-dsary'}
  let d['fteval'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fteval'}
  let d['jabeige'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-jabeige'}
  let d['luciusmod'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-luciusmod'}
  let d['scriproject'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scriproject'}

  " Tamas Kovacs
  let d.vim_script_nr_2531 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/slimv'}

  " Luc Hermitte
  " Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
  let d.vim_script_nr_214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
  let d.vim_script_nr_336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
  " The following plugins are not present on vim.org:
  let d['lh-brackets'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
  let d['build-tools-wrapper'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/BTW/trunk'}
  let d['lh-tags'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/tags/trunk'}
  let d['lh-dev'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/dev/trunk'}
  let d['lh-refactor'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/refactor/trunk'}
  let d['search-in-runtime'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
  let d['system-tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/system-tools/trunk'}
  let d['UT'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/UT/trunk'}
  " Not owned by Luc Hermitte
  " let d.vim_script_nr_222 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}

  " Rok Garbas
  let d.vim_script_nr_3617 = {'type': 'git', 'url': 'git://github.com/Bogdanp/quicksilver.vim'}

  " @kevinwatters
  let d.vim_script_nr_2441 = {'type': 'git', 'url': 'git://github.com/kevinw/pyflakes-vim'}

  " Gunther Groenewege
  " The following plugin is not present on vim.org:
  let d['vim-less'] = {'type': 'git', 'url':  'git://github.com/groenewege/vim-less'}

  " Hallison Batista
  let d.vim_script_nr_2878 = {'type': 'git', 'url': 'git://github.com/hallison/vim-rdoc'}
  let d.vim_script_nr_2573 = {'type': 'git', 'url': 'git://github.com/hallison/vim-darkdevel'}
  let d.vim_script_nr_2882 = {'type': 'git', 'url': 'git://github.com/hallison/vim-markdown'}
  let d.vim_script_nr_2942 = {'type': 'git', 'url': 'git://github.com/hallison/vim-ruby-sinatra'}

  " Eric Van Dewoestine
  let d.vim_script_nr_1643 = {'type': 'git', 'url': 'git://github.com/ervandew/supertab'}
  let d.vim_script_nr_2711 = {'type': 'git', 'url': 'git://github.com/ervandew/screen'}
  let d.vim_script_nr_1093 = {'type': 'git', 'url': 'git://github.com/ervandew/archive'}
  let d.vim_script_nr_3661 = {'type': 'git', 'url': 'git://github.com/ervandew/lookup'}
  let d.vim_script_nr_3668 = {'type': 'git', 'url': 'git://github.com/ervandew/sgmlendtag'}

  " Miles Sterrett
  let d.vim_script_nr_2571 = {'type': 'git', 'url': 'git://github.com/mileszs/apidock.vim'}
  let d.vim_script_nr_2572 = {'type': 'git', 'url': 'git://github.com/mileszs/ack.vim'}

  " Bob Hiestand
  let d.vim_script_nr_90 = {'type': 'git', 'url': 'git://repo.or.cz/vcscommand'}

  " Greg Sexton
  let d.vim_script_nr_3329 = {'type': 'git', 'url': 'git://github.com/gregsexton/VimCalc'}
  let d.vim_script_nr_3481 = {'type': 'git', 'url': 'git://github.com/gregsexton/Atom'}
  let d.vim_script_nr_3521 = {'type': 'git', 'url': 'git://github.com/gregsexton/Gravity'}
  let d.vim_script_nr_3574 = {'type': 'git', 'url': 'git://github.com/gregsexton/gitv'}
  let s:mai_snr_deps.3574 = [2975]
  let d.vim_script_nr_3818 = {'type': 'git', 'url': 'git://github.com/gregsexton/MatchTag'}

  " Jezreel Ng
  let d.vim_script_nr_3509 = {'type': 'git', 'url': 'git://github.com/int3/vim-extradite'}
  let s:mai_snr_deps.3509 = [2975]
  let d.vim_script_nr_3504 = {'type': 'git', 'url': 'git://github.com/int3/vim-taglist-plus'}
  let d.vim_script_nr_3604 = {'type': 'git', 'url': 'git://github.com/int3/nicer-vim-regexps'}

  " Sasha Koss
  let d.vim_script_nr_3387 = {'type': 'git', 'url': 'git://github.com/kossnocorp/perfect.vim'}
  let d.vim_script_nr_3300 = {'type': 'git', 'url': 'git://github.com/kossnocorp/up.vim'}
  let d.vim_script_nr_3362 = {'type': 'git', 'url': 'git://github.com/kossnocorp/janitor.vim'}

  " Xavier Deguillard
  let d.vim_script_nr_3302 = {'type': 'git', 'url': 'git://github.com/Rip-Rip/clang_complete'}

  " thinca
  let d.vim_script_nr_2931 = {'type': 'git', 'url': 'git://github.com/thinca/vim-fontzoom'}
  let d.vim_script_nr_2860 = {'type': 'git', 'url': 'git://github.com/thinca/vim-prettyprint'}
  let d.vim_script_nr_2834 = {'type': 'git', 'url': 'git://github.com/thinca/vim-template'}
  let d.vim_script_nr_2944 = {'type': 'git', 'url': 'git://github.com/thinca/vim-visualstar'}
  let d.vim_script_nr_3067 = {'type': 'git', 'url': 'git://github.com/thinca/vim-ref'}
  let d.vim_script_nr_3146 = {'type': 'git', 'url': 'git://github.com/thinca/vim-quickrun'}
  let d.vim_script_nr_3393 = {'type': 'git', 'url': 'git://github.com/thinca/vim-localrc'}
  " The following plugins are not present on vim.org:
  let d['rtputil'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-rtputil'}
  let d['ambicmd'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ambicmd'}
  let d['logcat'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-logcat'}
  let d['editvar'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-editvar'}
  let d['partedit'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-partedit'}
  let d['unite-history'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-unite-history'}
  let d['textobj-comment'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-comment'}
  let d['vim-github'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-github'}
  let d['auto_source'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-auto_source'}
  let d['vim-scouter'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-scouter'}
  let d['poslist'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-poslist'}
  let d['vim-ft-vim_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-vim_fold'}
  let d['operator-sequence'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-operator-sequence'}
  let d['openbuf'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-openbuf'}
  let d['vim-vcs'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vcs'}
  let d['vim-ft-markdown_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-markdown_fold'}
  let d['vim-ft-svn_diff'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-svn_diff'}
  let d['textobj-function-perl'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-perl'}
  let d['textobj-function-javascript'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-function-javascript'}
  let d['textobj-between'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-between'}
  let d['vim-ft-rst_header'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-rst_header'}
  let d['vim-ft-diff_fold'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-ft-diff_fold'}
  let d['befunge'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-befunge'}
  let d['textobj-plugins'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-plugins'}
  let d['vparsec'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-vparsec'}
  let d['tabrecent'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-tabrecent'}
  let d['qfreplace'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-qfreplace'}
  let d['guicolorscheme@thinca'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-guicolorscheme'}

  " Josh Adams
  let d.vim_script_nr_3464 = {'type': 'git', 'url': 'git://github.com/godlygeek/tabular'}
  " The following plugins are not present on vim.org:
  let d['csapprox'] = {'type': 'git', 'url': 'git://github.com/godlygeek/csapprox'}
  let d['colorchart'] = {'type': 'git', 'url': 'git://github.com/godlygeek/colorchart'}
  let d['netlib'] = {'type': 'git', 'url': 'git://github.com/godlygeek/netlib'}
  let d['vim-plugin-bundling'] = {'type': 'git', 'url': 'git://github.com/godlygeek/vim-plugin-bundling'}
  let d['windowlayout'] = {'type': 'git', 'url': 'git://github.com/godlygeek/windowlayout'}

  " drdr xp
  let d.vim_script_nr_2611 = {'type': 'git', 'url': 'git://github.com/drmingdrmer/xptemplate'}

  " Holger Rapp
  let d.vim_script_nr_2715 = {'type': 'bzr', 'url': 'lp:ultisnips'}

  " Drew Neil
  let d.vim_script_nr_3382 = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-textobj-rubyblock'}
  let s:mai_snr_deps.3382 = [39, 2100]
  " The following plugin is not present on vim.org:
  let d['vim-pml'] = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-pml'}

  " Scott Bronson
  let d.vim_script_nr_3201 = {'type': 'git', 'url': 'git://github.com/bronson/vim-trailing-whitespace'}
  " The following plugin is not present on vim.org:
  let d['vim-toggle-wrap'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-toggle-wrap'}

  " Peter Hosey
  " The following plugin does not have normal directory structure:
  let d.vim_script_nr_2475 = {'url': 'https://bitbucket.org/boredzo/vim-ini-syntax/raw/default/ini.vim', 'archive_name': 'ini.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'ini syntax definition'}

  " Jochen Bartl
  " The following plugin does not have normal directory structure:
  let d.vim_script_nr_2479 = {'url': 'https://bitbucket.org/lobo/grsecurityvim/raw/default/grsecurity.vim', 'archive_name': 'grsecurity.vim', 'type': 'archive', 'script-type': 'syntax', 'title': 'grsecurity.vim'}

  " Weakish Jiang
  " The following repository does not have normal directory structure:
  " let d['rc'] = {'type': 'git', 'url': 'git://gist.github.com/986788'}

  " " xolox
  " " Commented until author puts vim files in proper directories or somebody implements postinstall hooks
  " let d.vim_script_nr_3242 = {'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}

  " others:
  let d['cscope_macros'] = {'version': '1.0', 'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'vim_version': '6.0', 'date': '2007-09-02', 'type': 'archive', 'script-type': 'utility', 'archive_name': 'cscope_maps.vim', 'author': 'Jason Duell'}
  let d['pgnvim'] = {'url': 'https://github.com/Raimondi/pgnvim/raw/master/pgn.vim', 'archive_name': 'pgn.vim', 'author': 'Israel Chauca Fuentes', 'type': 'archive', 'script-type': 'syntax', 'title': 'pgnvim'}

  let d['mustache'] = {'type': 'git', 'url': 'git://github.com/juvenn/mustache.vim'}
  let d['Vim-R-plugin2'] = {'type': 'git', 'url': 'git://github.com/jimmyharris/vim-r-plugin2'}
  let d['vim-ruby-debugger'] = {'type': 'git', 'url': 'git://github.com/astashov/vim-ruby-debugger'}
  let d['codefellow'] = {'type': 'git', 'url': 'git://github.com/romanroe/codefellow', 'addon-info': {'runtimepath': 'vim'}}
  let d['space'] = {'type': 'git', 'url': 'git://github.com/spiiph/vim-space'}
  let d['vim-comment-object'] = {'type': 'git', 'url': 'git://github.com/ConradIrwin/vim-comment-object'}
  let d['git-vim'] = {'type': 'git', 'url': 'git://github.com/motemen/git-vim'}
  let d['vimpager-perlmod'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vimpager-perlmod'}
  let d['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim', 'addon-info': {'dependencies': {"webapi-vim": { } } }}
  let d['sparkup'] = {'type': 'git', 'url': 'git://github.com/rstacruz/sparkup', 'addon-info': {'runtimepath': 'vim'}}

  " this is only the vimfiles subdirectory:
  let d['vim-latex'] = {'type': 'svn', 'url': 'https://vim-latex.svn.sourceforge.net/svnroot/vim-latex/trunk/vimfiles'}

  " kana (most can be found on www.vim.org. However they all have a different
  " subdirectories - So checking out from git seems to be easier to me to
  " support them all.
  let s:scm_kana_sources = {}
  for n in split('vim-exfiletype vim-xire vim-arpeggio vim-textobj-user vim-altercmd vim-fakeclip vim-operator-user vim-vspec vim-wwwsearch vim-textobj-syntax vim-textobj-indent vim-operator-replace vim-grex vim-xml-move vim-xml-autons vim-vcsi vim-textobj-lastpat vim-textobj-jabraces vim-textobj-function vim-textobj-fold vim-textobj-entire vim-textobj-diff vim-surround vim-submode vim-smartword vim-smarttill vim-smartchr vim-skeleton vim-scratch vim-repeat vim-narrow vim-metarw vim-metarw-git vim-flydiff vim-exjumplist vim-bundle vim-textobj-datetime vim-textobj-django-template chat.vim-users.jp-log-converter jkramer-vim-narrow kuy-vim-fuzzyjump thinca-vim-qfreplace mootoh-vim-refe2 thinca-vim-ku-file_mru ujihisa-vim-quickrun vim-flymake vim-perproject vim-stackreg vim-outputz vim-ctxabbr vim-advice vim-ku-quickfix vim-ku-metarw vim-ku-bundle vim-ku-args vim-ku', ' ')
    let na = substitute(n,'^vim-','','')
    let s:scm_kana_sources[na] = {'type': 'git', 'url': 'git://github.com/kana/'.n}
    if n =~ 'vim-textobj-\%(user\)\@!'
      let s:scm_kana_sources[na]['addon-info'] = {'dependencies': {'textobj-user': { } } }
    endif
    unlet na
  endfor
  call extend(d, s:scm_kana_sources)
  "}}}

  return d
endf
