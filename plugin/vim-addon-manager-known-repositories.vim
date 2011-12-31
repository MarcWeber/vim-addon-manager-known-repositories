exec vam#DefineAndBind('s:c','g:vim_addon_manager','{}')

let s:c['plugin_sources'] = get(s:c,'plugin_sources', {})
let s:c['missing_addon_infos'] = get(s:c,'missing_addon_infos', {})
let s:missing_addon_infos = s:c['missing_addon_infos']

execute 'source' expand('<sfile>:p:h').'/vim.org-scripts.vim'

let s:plugin_sources = s:c.vim_org_sources
unlet s:c.vim_org_sources

" custom plugins - drop me an email to get you repository added
" SCM plugin sources {{{
" this source seems to be more up to date then the www.vim.org version:
let s:scm_plugin_sources = {}
let s:scm_plugin_sources['mustache'] = {'type': 'git', 'url': 'git://github.com/juvenn/mustache.vim'}
let s:scm_plugin_sources['Command-T'] = {'type' : 'git', 'url' : 'git://git.wincent.com/command-t.git'}
let s:scm_plugin_sources['Conque_Shell'] = {'type': 'svn', 'url': 'http://conque.googlecode.com/svn/trunk/'}
let s:scm_plugin_sources['pyinteractive'] = {'type' : 'hg', 'url' : 'https://vim-pyinteractive-plugin.googlecode.com/hg/'}
let s:scm_plugin_sources['Vim-R-plugin2'] = {'type': 'git', 'url' : 'git://github.com/jimmyharris/vim-r-plugin2'}

" my plugins:
let s:scm_plugin_sources['vim-addon-urweb'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-urweb'}
let s:scm_plugin_sources['vim-haxe'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-haxe'}
let s:scm_plugin_sources['vim-addon-json-encoding'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-json-encoding'}
let s:scm_plugin_sources['vim-addon-signs'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-signs'}
let s:scm_plugin_sources['vim-addon-swfmill'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-swfmill'}
let s:scm_plugin_sources['vim-addon-mw-utils'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-mw-utils'}
let s:scm_plugin_sources['vim-addon-fcsh'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-fcsh'}
let s:scm_plugin_sources['vim-addon-views'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-views'}
let s:scm_plugin_sources['vim-addon-goto-thing-at-cursor'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-goto-thing-at-cursor'}
let s:scm_plugin_sources['scion-backend-vim'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/scion-backend-vim'}
let s:scm_plugin_sources['vim-addon-background-cmd'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-background-cmd'}
let s:scm_plugin_sources['vim-addon-actions'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-actions'}
let s:scm_plugin_sources['vim-addon-background-cmd'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-background-cmd'}
let s:scm_plugin_sources['vim-addon-completion'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/vim-addon-completion'}
let s:scm_plugin_sources['vim-addon-haskell'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
let s:scm_plugin_sources['vim-addon-nix'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-nix'}
let s:scm_plugin_sources['vim-addon-sbt'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sbt'}
let s:scm_plugin_sources['vim-addon-scala'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-scala'}
let s:scm_plugin_sources['vim-addon-git'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-git'}
let s:scm_plugin_sources['vim-addon-povray'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-povray'}
let s:scm_plugin_sources['vim-addon-toggle-buffer'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-toggle-buffer'}
let s:scm_plugin_sources['vim-addon-other'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-other'}
let s:scm_plugin_sources['vim-addon-async'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-async'}
let s:scm_plugin_sources['vim-addon-lout'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
let s:scm_plugin_sources['vim-addon-xdebug'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-xdebug'}
let s:scm_plugin_sources['vim-addon-sml'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sml'}
let s:scm_plugin_sources['vim-addon-php-manual'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-php-manual'}
let s:scm_plugin_sources['vim-addon-local-vimrc'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-local-vimrc'}
let s:scm_plugin_sources['syntastic2'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/syntastic2'}


" override snipmate. There is really no reason anymore to use the old version
" snipMate could be dropped. Keep alias
let s:scm_plugin_sources['snipmate'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}
let s:scm_plugin_sources['snipMate'] = copy(s:scm_plugin_sources['snipmate'])
" snipmate-snippets depends on snipmate so installing the snippets should be enough
let s:scm_plugin_sources['snipmate-snippets'] = {'type' : 'git', 'url': 'git://github.com/honza/snipmate-snippets'}

let s:scm_plugin_sources['theonevimlib'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}

" Peter Odding
let s:scm_plugin_sources['publish'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-publish'}
let s:scm_plugin_sources['pyref'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-pyref'}
let s:scm_plugin_sources['session3150'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-session'}
let s:scm_plugin_sources['easytags'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-easytags'}
let s:scm_plugin_sources['shell'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-shell'}
let s:scm_plugin_sources['reload'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-reload'}
let s:scm_plugin_sources['luainspect'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-inspect'}
let s:scm_plugin_sources['notes'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-notes'}
let s:scm_plugin_sources['lua'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-ftplugin'}

" " xolox
" " Commented until author puts vim files in proper directories or somebody implements postinstall hooks
" let s:scm_plugin_sources['Open_associated_programs'] = {'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}

" Ciaran McCreesh
let s:scm_plugin_sources['securemodelines'] = {'type': 'git', 'url': 'git://github.com/ciaranm/securemodelines'}
let s:scm_plugin_sources['inkpot'] = {'type': 'git', 'url': 'git://github.com/ciaranm/inkpot'}
let s:scm_plugin_sources['DetectIndent'] = {'type': 'git', 'url': 'git://github.com/ciaranm/detectindent'}

" Shougo
let s:scm_plugin_sources['neocomplcache'] = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache'}

let s:scm_plugin_sources['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell'}
let s:missing_addon_infos['vimshell'] = '{"dependencies" : {"vimproc": {}}}'

let s:scm_plugin_sources['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
let s:scm_plugin_sources['unite'] = {'type': 'git', 'url': 'git://github.com/Shougo/unite.vim'}
let s:scm_plugin_sources['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
let s:scm_plugin_sources['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
let s:scm_plugin_sources['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}

" ZyX
let s:scm_plugin_sources['translit3'] = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
let s:scm_plugin_sources['jsonvim'] = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
let s:scm_plugin_sources['formatvim'] = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
let s:scm_plugin_sources['vimoop'] = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
let s:scm_plugin_sources['yamlvim'] = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
let s:scm_plugin_sources['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}
let s:scm_plugin_sources['aurum'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}

" kana (most can be found on www.vim.org. However they all have a different
" subdirectories - So checking out from git seems to be easier to me to
" support them all.
for n in split('vim-exfiletype vim-xire vim-arpeggio vim-textobj-user vim-altercmd vim-fakeclip vim-operator-user vim-vspec vim-wwwsearch vim-textobj-syntax vim-textobj-indent vim-operator-replace vim-grex vim-xml-move vim-xml-autons vim-vcsi vim-textobj-lastpat vim-textobj-jabraces vim-textobj-function vim-textobj-fold vim-textobj-entire vim-textobj-diff vim-surround vim-submode vim-smartword vim-smarttill vim-smartchr vim-skeleton vim-scratch vim-repeat vim-narrow vim-metarw vim-metarw-git vim-flydiff vim-exjumplist vim-bundle vim-textobj-datetime vim-textobj-django-template chat.vim-users.jp-log-converter jkramer-vim-narrow kuy-vim-fuzzyjump thinca-vim-qfreplace mootoh-vim-refe2 thinca-vim-ku-file_mru ujihisa-vim-quickrun vim-flymake vim-perproject vim-stackreg vim-outputz vim-ctxabbr vim-advice vim-ku-quickfix vim-ku-metarw vim-ku-bundle vim-ku-args vim-ku', ' ')
  let na = substitute(n,'^vim-','','')
  let s:scm_plugin_sources[na] = {'type': 'git', 'url': 'git://github.com/kana/'.n}
  if n =~ 'vim-textobj-\%(user\)\@!'
    let s:missing_addon_infos[na] = '{"dependencies" : {"textobj-user": {}}}'
  endif
  unlet na
endfor

" others:
let s:scm_plugin_sources['vim-ruby'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-ruby'}
let s:scm_plugin_sources['liftweb-vim'] = {'type': 'git', 'url' : 'git://github.com/Shadowfiend/liftweb-vim'}
let s:scm_plugin_sources['vim-ruby-debugger'] = {'type' : 'git', 'url' : 'git://github.com/astashov/vim-ruby-debugger'}
let s:scm_plugin_sources['SmartTag'] = {'type' : 'git', 'url' : 'git://github.com/MarcWeber/SmartTag'}

let s:scm_plugin_sources['codefellow'] = {'type' : 'git', 'url' : 'git://github.com/romanroe/codefellow'}
let s:missing_addon_infos['codefellow'] = '{"runtimepath": "vim"}'

let s:scm_plugin_sources['bookmarking'] = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}
let s:scm_plugin_sources['rdoc'] = {'type': 'git', 'url': 'git://github.com/hallison/vim-rdoc'}
let s:scm_plugin_sources['supertab'] = {'type': 'git', 'url': 'git://github.com/ervandew/supertab'}
let s:scm_plugin_sources['vim-addon-ocaml'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ocaml'}
let s:scm_plugin_sources['vim-addon-sql'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sql'}
let s:scm_plugin_sources['ensime'] = {'type' : 'git', 'url': 'git://github.com/MarcWeber/ensime', 'branch': 'master-vim-cleaned-up'}
let s:scm_plugin_sources['space'] = {'type': 'git', 'url': 'git://github.com/spiiph/vim-space'}
let s:scm_plugin_sources['Screen_vim__gnu_screentmux'] = {'type': 'git', 'url': 'git://github.com/ervandew/screen'}

let s:scm_plugin_sources['vcscommand'] = {'type': 'git', 'url': 'git://repo.or.cz/vcscommand'}
let s:scm_plugin_sources['eregex'] = {'type': 'git', 'url': 'git://github.com/othree/eregex.vim'}
let s:scm_plugin_sources['ack'] = {'type': 'git', 'url': 'git://github.com/mileszs/ack.vim'}
let s:scm_plugin_sources['ctrlp'] = {'type': 'git', 'url': 'git://github.com/kien/ctrlp.vim'}
let s:scm_plugin_sources['vim-comment-object'] = {'type': 'git', 'url': 'git://github.com/ConradIrwin/vim-comment-object'}

" Plugins sources added by Silex
let s:scm_plugin_sources['gitv'] = {'type': 'git', 'url': 'git://github.com/gregsexton/gitv'}
let s:missing_addon_infos['gitv'] = '{"dependencies" : {"fugitive":{}}}'
let s:scm_plugin_sources['extradite'] = {'type': 'git', 'url': 'git://github.com/int3/vim-extradite'}
let s:missing_addon_infos['extradite'] = '{"dependencies" : {"fugitive":{}}}'
let s:scm_plugin_sources['up'] = {'type': 'git', 'url': 'git://github.com/kossnocorp/up.vim'}
let s:scm_plugin_sources['clang_complete'] = {'type': 'git', 'url': 'git://github.com/Rip-Rip/clang_complete'}
let s:scm_plugin_sources['visualstar'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-visualstar'}
let s:scm_plugin_sources['cmakeref'] = {'type': 'git', 'url': 'git://github.com/vim-scripts/cmakeref'}
let s:scm_plugin_sources['tabular'] = {'type': 'git', 'url': 'git://github.com/godlygeek/tabular'}
let s:scm_plugin_sources['UltiSnips'] = {'type': 'bzr', 'url': 'lp:ultisnips'}
let s:scm_plugin_sources['xptemplate'] = {'type': 'svn', 'url': 'http://xptemplate.googlecode.com/svn/trunk/dist'}
let s:scm_plugin_sources['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim'}
let s:missing_addon_infos['ideone'] = '{"dependencies" : {"webapi-vim":{}}}'
let s:scm_plugin_sources['textobj-rubyblock'] = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-textobj-rubyblock'}
let s:missing_addon_infos['textobj-rubyblock'] = '{"dependencies" : {"matchit.zip":{}, "textobj-user":{}}}'
let s:scm_plugin_sources['trailing-whitespace'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-trailing-whitespace'}



let s:scm_plugin_sources['sparkup'] = {'type': 'git', 'url': 'git://github.com/rstacruz/sparkup'}

" Tim Pope
let s:scm_plugin_sources['unimpaired'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-unimpaired'}
let s:scm_plugin_sources['endwise'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-endwise'}
let s:scm_plugin_sources['surround'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-surround'}
let s:scm_plugin_sources['cucumber.zip'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-cucumber'}
let s:scm_plugin_sources['rails'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-rails'}
let s:scm_plugin_sources['fugitive'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-fugitive'}
let s:scm_plugin_sources['haml.zip'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-haml'}
let s:scm_plugin_sources['git.zip'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-git'}
let s:scm_plugin_sources['pathogen.zip'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-pathogen'}
let s:scm_plugin_sources['ragtag'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-ragtag'}
let s:scm_plugin_sources['vividchalk'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
let s:scm_plugin_sources['speeddating'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
let s:scm_plugin_sources['afterimage'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
let s:scm_plugin_sources['abolish'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
let s:scm_plugin_sources['pastie'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
let s:scm_plugin_sources['commentary'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
let s:scm_plugin_sources['rake'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
" The following plugin is not present on vim.org
let s:scm_plugin_sources['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}

" " The following plugin is present on vim.org, but does not belong to Tim Pope
" let s:scm_plugin_sources['liquid'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}
" " The following plugin has the same name as one of vim.org ones, but different 
" " author
" let s:scm_plugin_sources['markdown'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}

" Marty Grenfell
let s:scm_plugin_sources['The_NERD_Commenter'] = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
let s:scm_plugin_sources['The_NERD_tree'] = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
let s:scm_plugin_sources['Syntastic'] = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
let s:scm_plugin_sources['lh-vim-lib'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let s:scm_plugin_sources['Map_Tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let s:scm_plugin_sources['lh-cpp-ftplugins'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
let s:scm_plugin_sources['searchInRuntime'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
" Others were not included as they are absent on www.vim.org

"tiagofalcao asked me to add the svn source:
let s:scm_plugin_sources['edc_support'] = {'type': 'svn', 'url': 'http://svn.enlightenment.org/svn/e/trunk/edje/data/vim/'}

" Steve Losh
let s:scm_plugin_sources['Gundo'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/gundo.vim'}
let s:scm_plugin_sources['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}
let s:scm_plugin_sources['Threesome'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/threesome.vim'}

" this name may change if the author uploads it to vim.sf.net..
let s:scm_plugin_sources['vim_easymotion'] = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-easymotion'}

" contributed by creidiki:
let s:scm_plugin_sources['lusty'] = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}

" Daniel Hofstetter
let s:scm_plugin_sources['scss-syntax'] = {'type': 'git', 'url': 'git://github.com/cakebaker/scss-syntax.vim'}

" Barry Arthur
let s:scm_plugin_sources['VimLint'] = {'type' : 'git', 'url' : 'git://github.com/dahu/VimLint'}

" Raimondi (Israel Chauca Fuentes):
let s:scm_plugin_sources['PickAColor'] = {'type': 'git', 'url': 'git://github.com/Raimondi/PickAColor'}
let s:scm_plugin_sources['delimitMate'] = {'type': 'git', 'url': 'git://github.com/Raimondi/delimitMate'}
" " The following plugins are not present on vim.org
" let s:scm_plugin_sources['bufring'] = {'type': 'git', 'url': 'git://github.com/Raimondi/bufring'}
let s:scm_plugin_sources['TVO_The_Vim_Outliner'] = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" this is only the vimfiles subdirectory:
let s:scm_plugin_sources['vim-latex'] = {'type': 'svn', 'url': 'https://vim-latex.svn.sourceforge.net/svnroot/vim-latex/trunk/vimfiles'}


" intuited - Ted
" this name could possibly change when its uploaded to www.vim.org ?
let s:scm_plugin_sources['vim-vamoose'] = {'type': 'git', 'url': 'git://github.com/intuited/vim-vamoose'}
let s:scm_plugin_sources['visdo'] = {'type': 'git', 'url': 'git://github.com/intuited/visdo'}

" beyondwords (github)
let s:scm_plugin_sources['vim-twig'] = {'type': 'git', 'url': 'git://github.com/beyondwords/vim-twig'}

" Tom Link
let s:scm_plugin_sources['checksyntax'] = {'type': 'git', 'url': 'git://github.com/tomtom/checksyntax_vim'}
let s:scm_plugin_sources['cmdlinehelp'] = {'type': 'git', 'url': 'git://github.com/tomtom/cmdlinehelp_vim'}
let s:scm_plugin_sources['hookcursormoved'] = {'type': 'git', 'url': 'git://github.com/tomtom/hookcursormoved_vim'}
let s:scm_plugin_sources['linglang'] = {'type': 'git', 'url': 'git://github.com/tomtom/linglang_vim'}
let s:scm_plugin_sources['presets'] = {'type': 'git', 'url': 'git://github.com/tomtom/presets_vim'}
let s:scm_plugin_sources['prototype'] = {'type': 'git', 'url': 'git://github.com/tomtom/prototype_vim'}
let s:scm_plugin_sources['quickfixsigns'] = {'type': 'git', 'url': 'git://github.com/tomtom/quickfixsigns_vim'}
let s:scm_plugin_sources['rcom'] = {'type': 'git', 'url': 'git://github.com/tomtom/rcom_vim'}
let s:scm_plugin_sources['scalefont'] = {'type': 'git', 'url': 'git://github.com/tomtom/scalefont_vim'}
let s:scm_plugin_sources['setsyntax'] = {'type': 'git', 'url': 'git://github.com/tomtom/setsyntax_vim'}
let s:scm_plugin_sources['shymenu'] = {'type': 'git', 'url': 'git://github.com/tomtom/shymenu_vim'}
let s:scm_plugin_sources['spec2580'] = {'type': 'git', 'url': 'git://github.com/tomtom/spec_vim'}
let s:scm_plugin_sources['startup_profile'] = {'type': 'git', 'url': 'git://github.com/tomtom/startup_profile_vim'}
let s:scm_plugin_sources['tassert'] = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}
let s:scm_plugin_sources['tbibtools'] = {'type': 'git', 'url': 'git://github.com/tomtom/tbibtools_vim'}
let s:scm_plugin_sources['tcalc'] = {'type': 'git', 'url': 'git://github.com/tomtom/tcalc_vim'}
let s:scm_plugin_sources['tcommand'] = {'type': 'git', 'url': 'git://github.com/tomtom/tcommand_vim'}
let s:scm_plugin_sources['tComment'] = {'type': 'git', 'url': 'git://github.com/tomtom/tcomment_vim'}
let s:scm_plugin_sources['tgpg'] = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
let s:scm_plugin_sources['tlib'] = {'type': 'git', 'url': 'git://github.com/tomtom/tlib_vim'}
let s:scm_plugin_sources['tmarks'] = {'type': 'git', 'url': 'git://github.com/tomtom/tmarks_vim'}
let s:scm_plugin_sources['tmru'] = {'type': 'git', 'url': 'git://github.com/tomtom/tmru_vim'}
let s:scm_plugin_sources['toptions'] = {'type': 'git', 'url': 'git://github.com/tomtom/toptions_vim'}
let s:scm_plugin_sources['TortoiseSVN'] = {'type': 'git', 'url': 'git://github.com/tomtom/TortoiseSVN_vim'}
let s:scm_plugin_sources['tplugin'] = {'type': 'git', 'url': 'git://github.com/tomtom/tplugin_vim'}
let s:scm_plugin_sources['trag'] = {'type': 'git', 'url': 'git://github.com/tomtom/trag_vim'}
let s:scm_plugin_sources['tregisters'] = {'type': 'git', 'url': 'git://github.com/tomtom/tregisters_vim'}
let s:scm_plugin_sources['tselectbuffer'] = {'type': 'git', 'url': 'git://github.com/tomtom/tselectbuffer_vim'}
let s:scm_plugin_sources['tselectfiles'] = {'type': 'git', 'url': 'git://github.com/tomtom/tselectfiles_vim'}
let s:scm_plugin_sources['tSkeleton'] = {'type': 'git', 'url': 'git://github.com/tomtom/tskeleton_vim'}
let s:scm_plugin_sources['ttagecho'] = {'type': 'git', 'url': 'git://github.com/tomtom/ttagecho_vim'}
let s:scm_plugin_sources['ttags'] = {'type': 'git', 'url': 'git://github.com/tomtom/ttags_vim'}
let s:scm_plugin_sources['ttoc'] = {'type': 'git', 'url': 'git://github.com/tomtom/ttoc_vim'}
let s:scm_plugin_sources['viki'] = {'type': 'git', 'url': 'git://github.com/tomtom/viki_vim'}
let s:scm_plugin_sources['vikitasks'] = {'type': 'git', 'url': 'git://github.com/tomtom/vikitasks_vim'}
let s:scm_plugin_sources['vimform'] = {'type': 'git', 'url': 'git://github.com/tomtom/vimform_vim'}
let s:scm_plugin_sources['worksheet'] = {'type': 'git', 'url': 'git://github.com/tomtom/worksheet_vim'}
let s:scm_plugin_sources['indentfolds'] = {'type': 'git', 'url': 'git://github.com/tomtom/indentfolds_vim'}
let s:scm_plugin_sources['tGpg'] = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
let s:scm_plugin_sources['brep'] = {'type': 'git', 'url': 'git://github.com/tomtom/brep_vim'}
let s:scm_plugin_sources['stakeholders'] = {'type': 'git', 'url': 'git://github.com/tomtom/stakeholders_vim'}
let s:scm_plugin_sources['tAssert'] = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}

" Robert Gleeson
let s:scm_plugin_sources['hammer.vim'] = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

" Nathanael Kane
let s:scm_plugin_sources['Indent_Guides'] = {'type': 'git', 'url': 'git://github.com/nathanaelkane/vim-indent-guides'}

" Michael Sanders
let s:scm_plugin_sources['cocoa'] = {'type': 'git', 'url': 'git://github.com/msanders/cocoa.vim'}

" Devin Weaver (sukima)
let s:scm_plugin_sources['xmledit'] = {'type': 'git', 'url': 'git://github.com/sukima/xmledit'}

" Thiago Alves
let s:scm_plugin_sources['AutoClose'] = {'type': 'git', 'url': 'git://github.com/Townk/vim-autoclose', 'author': 'Thiago Alves'}

" Ethan Schoonover
let s:scm_plugin_sources['Solarized'] = {'type': 'git', 'url': 'git://github.com/altercation/vim-colors-solarized', 'author': 'Ethan Schoonover'}

" Manpreet Singh
let s:scm_plugin_sources['patchreview'] = {'type': 'git', 'url': 'git://github.com/junkblocker/patchreview-vim'}

" Peter Hosey
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['ini_syntax_definition'] = {'type': 'hg', 'url': 'https://bitbucket.org/boredzo/vim-ini-syntax'}

" Jochen Bartl
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['grsecurity2479'] = {'type': 'hg', 'url': 'https://bitbucket.org/lobo/grsecurityvim'}

" Ryan Mechelke
let s:scm_plugin_sources['diff-fold'] = {'type': 'hg', 'url': 'https://bitbucket.org/thetoast/diff-fold'}

" Maxim Kim
" Using hg here because we need to alter runtimepath, but only for mercurial 
" source
let s:scm_plugin_sources['vimwiki@hg'] = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki/'}

" Christian Ebert
let s:scm_plugin_sources['screenpaste'] = {'type': 'hg', 'url': 'http://www.blacktrash.org/hg/screenpaste'}

" Ted Pavlic
" Note: it is not an actual vim script, it is a command-line (shell 
" command-line) utility
let s:scm_plugin_sources['vimlatex'] = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

" Jonas Kramer
let s:scm_plugin_sources['narrow2446'] = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

" Jannis Pohlmann
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['jptemplate'] = {'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate.git'}

" Mick Koch
let s:scm_plugin_sources['vim-coffee-script'] = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

" Rykka Krin
let s:scm_plugin_sources['ColorV'] = {'type': 'git', 'url': 'git://github.com/Rykka/ColorV'}
let s:scm_plugin_sources['Galaxy'] = {'type': 'git', 'url': 'git://github.com/Rykka/vim-galaxy'}

" Andrew Radev
let s:scm_plugin_sources['splitjoin'] = {'type': 'git', 'url': 'git://github.com/AndrewRadev/splitjoin.vim'}
let s:scm_plugin_sources['tagfinder'] = {'type': 'git', 'url': 'git://github.com/AndrewRadev/tagfinder.vim'}
let s:scm_plugin_sources['linediff'] = {'type': 'git', 'url': 'git://github.com/AndrewRadev/linediff.vim'}

" Radek Kowalski
let s:scm_plugin_sources['lua_omni'] = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

" Vincent Velociter
let s:scm_plugin_sources['aldmeris'] = {'type': 'git', 'url': 'git://github.com/veloce/vim-aldmeris'}

" Bogdan Popa
let s:scm_plugin_sources['PyREPL'] = {'type': 'git', 'url': 'git://github.com/Bogdanp/pyrepl.vim'}

" Yo-An Lin
let s:scm_plugin_sources['vim-dev-plugin'] = {'type': 'git', 'url': 'git://github.com/c9s/vim-dev-plugin'}
let s:scm_plugin_sources['hypergit'] = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let s:scm_plugin_sources['libperl'] = {'type': 'git', 'url': 'git://github.com/c9s/libperl.vim'}
let s:scm_plugin_sources['gsession'] = {'type': 'git', 'url': 'git://github.com/c9s/gsession.vim'}
let s:scm_plugin_sources['growlnotify'] = {'type': 'git', 'url': 'git://github.com/c9s/growlnotify.vim'}
let s:scm_plugin_sources['cpan'] = {'type': 'git', 'url': 'git://github.com/c9s/cpan.vim'}
let s:scm_plugin_sources['pod-helper'] = {'type': 'git', 'url': 'git://github.com/c9s/pod-helper.vim'}
let s:scm_plugin_sources['perlomni'] = {'type': 'git', 'url': 'git://github.com/c9s/perlomni.vim'}
let s:scm_plugin_sources['filetype-completion'] = {'type': 'git', 'url': 'git://github.com/c9s/filetype-completion.vim'}
let s:scm_plugin_sources['spidermonkey'] = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let s:scm_plugin_sources['vimomni'] = {'type': 'git', 'url': 'git://github.com/c9s/vimomni.vim'}
let s:scm_plugin_sources['apt-complete'] = {'type': 'git', 'url': 'git://github.com/c9s/apt-complete.vim'}
let s:scm_plugin_sources['colorselector'] = {'type': 'git', 'url': 'git://github.com/c9s/colorselector.vim'}
let s:scm_plugin_sources['treemenu'] = {'type': 'git', 'url': 'git://github.com/c9s/treemenu.vim'}
let s:scm_plugin_sources['cascading'] = {'type': 'git', 'url': 'git://github.com/c9s/cascading.vim'}
let s:scm_plugin_sources['emoticon'] = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
let s:scm_plugin_sources['emoticon2958'] = s:scm_plugin_sources['emoticon']
let s:scm_plugin_sources['emoticon2959'] = s:scm_plugin_sources['emoticon']
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['simplecommenter'] = {'type': 'git', 'url': 'git://github.com/c9s/simple-commenter.vim'}

" wei ko kao
let s:scm_plugin_sources['html5'] = {'type': 'git', 'url': 'git://github.com/othree/html5.vim'}

" David JH
let s:scm_plugin_sources['VimLocalHistory'] = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

" Micah Elliott
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['adobe'] = {'type': 'git', 'url': 'git://gist.github.com/720355'}

" Kien Nguyen
let s:scm_plugin_sources['AutoSaveSetting'] = {'type': 'git', 'url': 'git://github.com/kien/autosavesetting.vim'}
let s:scm_plugin_sources['Premailer'] = {'type': 'git', 'url': 'git://github.com/kien/premailer.vim'}
let s:scm_plugin_sources['prefixer'] = {'type': 'git', 'url': 'git://github.com/kien/prefixer.vim'}
let s:scm_plugin_sources['cssbaseline'] = {'type': 'git', 'url': 'git://github.com/kien/cssbaseline.vim'}
let s:scm_plugin_sources['html_emogrifier'] = {'type': 'git', 'url': 'git://github.com/kien/html_emogrifier.vim'}
let s:scm_plugin_sources['rainbow_parentheses'] = {'type': 'git', 'url': 'git://github.com/kien/rainbow_parentheses.vim'}

" Andy Dawson
let s:scm_plugin_sources['activity-log'] = {'type': 'git', 'url': 'git://github.com/AD7six/vim-activity-log'}

" Caleb Cushing
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['sql_iabbr_2'] = {'type': 'git', 'url': 'git://github.com/xenoterracide/sql_iabbr'}

" Zachary Michaels
let s:scm_plugin_sources['bisect'] = {'type': 'git', 'url': 'git://github.com/mikezackles/Bisect'}

" Daniel Schauenberg
let s:scm_plugin_sources['simplenote'] = {'type': 'git', 'url': 'git://github.com/mrtazz/simplenote.vim'}

" Gustaf Sjoberg
let s:scm_plugin_sources['strange'] = {'type': 'git', 'url': 'git://github.com/strange/strange.vim'}

" Eustaquio Rangel de Oliveira Jr.
let s:scm_plugin_sources['vim-refact'] = {'type': 'git', 'url': 'git://github.com/taq/vim-refact'}
let s:scm_plugin_sources['Ruby_Snippets'] = {'type': 'git', 'url': 'git://github.com/taq/vim-ruby-snippets'}
let s:scm_plugin_sources['Git_Branch_Info'] = {'type': 'git', 'url': 'git://github.com/taq/vim-git-branch-info'}
let s:scm_plugin_sources['Vim_Rspec'] = {'type': 'git', 'url': 'git://github.com/taq/vim-rspec'}

" Bryant Hankins
let s:scm_plugin_sources['aspnetide'] = {'type': 'git', 'url': 'git://github.com/bryanthankins/vim-aspnetide'}

" Nick Reynolds
let s:scm_plugin_sources['cakephp'] = {'type': 'git', 'url': 'git://github.com/ndreynolds/vim-cakephp'}

" Javier Rojas
let s:scm_plugin_sources['ikiwiki-nav'] = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-nav.git/'}
let s:scm_plugin_sources['ikiwiki-syntax'] = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-syntax.git/'}

" Taylor Hedberg
let s:scm_plugin_sources['SimpylFold'] = {'type': 'git', 'url': 'git://github.com/tmhedberg/SimpylFold'}
let s:scm_plugin_sources['indent-motion'] = {'type': 'git', 'url': 'git://github.com/tmhedberg/indent-motion'}

" Susan Potter
let s:scm_plugin_sources['bundler'] = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-bundler'}
let s:scm_plugin_sources['rebar'] = {'type': 'git', 'url': 'git://github.com/mbbx6spp/vim-rebar'}

" Vincent Driessen
let s:scm_plugin_sources['pyunit'] = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyunit'}
let s:scm_plugin_sources['pep8'] = {'type': 'git', 'url': 'git://github.com/nvie/vim-pep8'}
let s:scm_plugin_sources['pyflakes'] = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyflakes'}
let s:scm_plugin_sources['toggle_mouse'] = {'type': 'git', 'url': 'git://github.com/nvie/vim-togglemouse'}

" Trevor Little
let s:scm_plugin_sources['scrnpipe'] = {'type': 'git', 'url': 'git://github.com/bundacia/ScreenPipe'}

" Enlil Dubenstein
let s:scm_plugin_sources['vim-google-scribe'] = {'type': 'git', 'url': 'git://github.com/dubenstein/vim-google-scribe'}

" Miller Medeiros
let s:scm_plugin_sources['statline'] = {'type': 'git', 'url': 'git://github.com/millermedeiros/vim-statline'}

" Yasuhiro Matsumoto
let s:scm_plugin_sources['calendar52'] = {'type': 'git', 'url': 'git://github.com/mattn/calendar-vim'}
let s:scm_plugin_sources['ZenCoding'] = {'type': 'git', 'url': 'git://github.com/mattn/zencoding-vim'}
let s:scm_plugin_sources['Gist'] = {'type': 'git', 'url': 'git://github.com/mattn/gist-vim'}
let s:scm_plugin_sources['GoogleReader'] = {'type': 'git', 'url': 'git://github.com/mattn/googlereader-vim'}
let s:scm_plugin_sources['GoogleSuggest_Complete'] = {'type': 'git', 'url': 'git://github.com/mattn/googlesuggest-complete-vim'}
let s:scm_plugin_sources['PasteBin'] = {'type': 'git', 'url': 'git://github.com/mattn/pastebin-vim'}
let s:scm_plugin_sources['webapi-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
let s:scm_plugin_sources['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
let s:scm_plugin_sources['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}
" XXX Requires postupdate hook // though non-SCM source does also
let s:scm_plugin_sources['VimTweak'] = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
let s:scm_plugin_sources['SonicTemplate'] = {'type': 'git', 'url': 'git://github.com/mattn/sonictemplate-vim'}

" Chris Yip
" Following repository does not contain correct directory tree
" let s:scm_plugin_sources['Better_CSS_Syntax_for_Vim'] = {'type': 'git', 'url': 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'}

" Mike West
let s:scm_plugin_sources['vimroom'] = {'type': 'git', 'url': 'git://github.com/mikewest/vimroom'}

let s:scm_plugin_sources['vimpager-perlmod'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vimpager-perlmod'}

" Takeshi NISHIDA
let s:scm_plugin_sources['ScmFrontEnd_former_name_MinSCM'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scmfrontend'}
let s:scm_plugin_sources['AutoComplPop'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-autocomplpop'}
let s:scm_plugin_sources['FuzzyFinder'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'}
let s:scm_plugin_sources['gauref'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-gauref'}
let s:scm_plugin_sources['L9'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-l9'}
" Following plugins are not present on vim.org:
let s:scm_plugin_sources['abolish#doc-ja'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-abolish-ja'}
let s:scm_plugin_sources['dsary'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-dsary'}
let s:scm_plugin_sources['fteval'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fteval'}
let s:scm_plugin_sources['jabeige'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-jabeige'}
let s:scm_plugin_sources['luciusmod'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-luciusmod'}
let s:scm_plugin_sources['scriproject'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scriproject'}

"}}}
"Additional sources information {{{
let s:plugin_sources['cscope_macros'] = {'version': '1.0', 'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'vim_version': '6.0', 'date': '2007-09-02', 'type': 'archive', 'script-type': 'utility', 'archive_name': 'cscope_maps.vim', 'author': 'Jason Duell'}
" " Not present on vim.org:
" let s:plugin_sources['pgnvim'] = {'url': 'https://github.com/Raimondi/pgnvim/raw/master/pgn.vim', 'archive_name': 'pgn.vim', 'author': 'Israel Chauca Fuentes', 'type': 'archive', 'script-type': 'syntax', 'title': 'pgnvim'}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
let s:scm_plugin_sources['lh-vim-lib'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let s:scm_plugin_sources['lh-brackets'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let s:scm_plugin_sources['build-tools-wrapper'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/BTW/trunk"}
let s:scm_plugin_sources['lh-tags'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/tags/trunk"}
let s:scm_plugin_sources['lh-dev'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/dev/trunk"}
let s:scm_plugin_sources['mu-template'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/mu-template/trunk"}
let s:scm_plugin_sources['lh-cpp'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
let s:scm_plugin_sources['lh-refactor'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/refactor/trunk"}
let s:scm_plugin_sources['search-in-runtime'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
let s:scm_plugin_sources['system-tools'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/system-tools/trunk"}
let s:scm_plugin_sources['UT'] = {"type": "svn", "url": "http://lh-vim.googlecode.com/svn/UT/trunk"}

" Rok Garbas
" http://www.vim.org/scripts/script.php?script_id=3617
let s:scm_plugin_sources['quicksilver'] = {'type': 'git', 'url': 'git://github.com/Bogdanp/quicksilver.vim'}

" thet
let s:scm_plugin_sources['pep83160'] = {'type' : 'git', 'url' : 'git://github.com/nvie/vim-pep8'}
let s:scm_plugin_sources['pyflakes2441'] = {'type' : 'git', 'url' : 'git://github.com/kevinw/pyflakes-vim'}
let s:scm_plugin_sources['git-vim'] = {'type' : 'git', 'url' : 'git://github.com/motemen/git-vim'}

" Gunther Groenewege
let s:scm_plugin_sources['vim-less'] = {'type' : 'git', 'url':  'git://github.com/groenewege/vim-less'}

" add / correct some types:
let s:plugin_sources['php1571']['strip-components'] = 0
let s:plugin_sources['jpythonfold']['script-type'] = 'ftplugin'
let s:plugin_sources['pythoncomplete']['target_dir'] = 'autoload'
let s:plugin_sources['pythoncomplete']['script-type'] = 'autoload'
let s:plugin_sources['Tango_colour_scheme']['script-type'] = 'colors'
let s:plugin_sources['ack']['strip-components'] = 0
let s:plugin_sources['autocorrect']['strip-components'] = 0
let s:plugin_sources['css_color']['script-type'] = 'after/syntax'

" plugin infos - written if the plugin doesn't ship one itself {{{

" this is mainly used to add missing dependencies
let s:missing_addon_infos['browser_4025'] = '{"dependencies" : {"synmark":{}}, "runtimepath": "vim"}'
let s:missing_addon_infos['FuzzyFinder']  = '{"dependencies" : {"L9":{}}}'
let s:missing_addon_infos['AutoAlign']    = '{"dependencies" : {"Align294":{}}}'

let s:missing_addon_infos['sparkup'] = '{"runtimepath": "vim"}'
let s:missing_addon_infos['VimDebug'] = '{"runtimepath": "vim"}'
let s:missing_addon_infos['vimwiki@hg'] = '{"runtimepath": "src"}'
let s:missing_addon_infos['libperl'] = '{"runtimepath": "vimlib"}'
let s:missing_addon_infos['growlnotify'] = '{"runtimepath": "vimlib"}'
let s:missing_addon_infos['pod-helper'] = '{"runtimepath": "vimlib"}'
"}}}

" fix target directories {{{1
let s:plugin_sources['rubycomplete']['target_dir'] = 'autoload'

let s:plugin_sources['xptemplate']['strip-components'] = 0

let s:plugin_sources['scala']['script-type'] = 'syntax'

" deprecations {{{1
let s:plugin_sources['scala']['deprecated'] = "The syntax doesn't highlight \"\"\" strings correctly. I don't know how to contact the maintainer. So I moved the file and a fix into vim-addon-scala"
let s:plugin_sources['rubycomplete']['deprecated'] = "you should consider using ruby-vim instead"
let s:plugin_sources['idutils']['deprecated'] = "greputils supersedes this plugin"

let s:scm_plugin_sources['snipMate']['deprecated'] = "snipMate is an alias to snipmate now - so use 'snipmate'"
let s:plugin_sources['lazysnipmate']['deprecated'] = "lazysnipmate's update is just snipmate"
let s:plugin_sources['Syntastic']['deprecated'] = "consider using syntastic2 because it is easier to adopt its behaviour to your needs"

let s:plugin_sources['vimpluginloader']['deprecated'] = "Vimpluginloader evolved into unmaintainable blob. Use frawor if you seek for framework"
let s:plugin_sources['vim-fileutils']['deprecated'] = "All functions from this plugin are available through `os' resource of @/os frawor module"
let s:plugin_sources['vimargumentchec']['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
let s:plugin_sources['vimcompcrtr']['deprecated'] = "Deprecated in favour of FWC DSL defined in frawor plugin"
let s:plugin_sources['vimstuff']['deprecated'] = "Functions from this plugin were either dropped or moved to frawor plugin, see its documentation"

let s:plugin_sources['local_vimrc']['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
let s:plugin_sources['localvimrc']['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"
let s:plugin_sources['localrc']['deprecated'] = "consider using vim-addon-local-vimrc cause it provides simple hash protection"

let s:plugin_sources['snippetsEmu']['deprecated'] = "Use snipmate instead. jano on irc reported that place holders don't work - last release 2006"
"}}}

call call(get(s:c,'MergeSources',function('vam_known_repositories#MergeSources')),
      \ [s:c['plugin_sources'], s:plugin_sources, s:scm_plugin_sources], {})

unlet s:scm_plugin_sources s:plugin_sources
" vim:fdm=marker
