" CONTENTS:
"   This file associates plugin names with manually maintained version control
"   sources (eg github, bitbucket etc)
"
" HOWTO:
"   copy paste a line, consider taking care about the "author comment" and
"   "SPACES" and you're ready to submit a "pull request" or "send" a small patch to
"   "us". Trouble? "contact us", see "VAM docs".
"
"
" Details:
"
" Plugin On: www.vim.org ?
"
" Yes:
"   let scmnr.vim_script_nr = {dictionary}
"     version control sources of plugins found on www.vim.org are associated by
"     script id because the name happens to be changed more often than a script_id.
"     The name is automatically generated from the title found on www.vim.org
"     with some characters removed.
"
" No:
"    let scm['new-unique-name'] = {dictionary}
"
" KEYS: of {dictionary}:
"   key order: 'type', 'url', 'addon-info', hooks, ...
"   You can add your own keys if they are necessary for whatever reason.
"   Description of known keys see VAM documentation (eg search for
"   'runtimepath')
"
"
" Author Comment Line:
"   It is a nice habit to prefix plugin by a short comment line with the author
"   name as seen on www.vim.org. Its not a policy because there are some plugins
"   (such as snipmate) which nowadays are maintained by the community with some
"   "core" developers. So it may make more sense to think about "maintainers"
"   rather than authors. If in doubt keep maintenance low, keep as is and expect
"   this information to be inaccurate.
"
" Copy Hooks:
"   See samples using vamkr#AddCopyHook below, mind the dashes line
"
" NOTE: Before the first line go authors having at least one SCM source without
"       any hooks that is also present on vim.org.
"       Before the second line go authors whose sources all have hooks or are
"       non-SCM ones. Not very useful, just something like “shame on them” list.
"       Before the third line go authors without any vim.org sources at all.
"       After the third line go authors without working sources at all. It is
"       a list of what can be possibly improved in the future.
"
" Commenting:
"   Everything which is useful to know should be put into a comment if it is non
"   obvious
"
" Syntax Restrictions: See tools/checkdb.vim. This file is made for using in
"                      hooks: if check fails vim will exit with non-zero status
"                      (:cquit). Prefered way of sourcing: while in the
"                      repository root directory (mercurial and git hooks are
"                      launched from there) do
"                         vim -u NONE -N -S tools/checkdb.vim
"                      . If hook failed see *.fail files in the repository root.

let scm = {}
" scmnr: add version controlled sources to plugins also known by www.vim.org
let scmnr = {}

" Luc Hermitte
" Some plugins are bundled in one repository http://lh-vim.googlecode.com/svn/misc/trunk. They are not included here
" Others were not included as they are absent on www.vim.org
let scmnr.50  = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/map-tools/trunk'}
let scmnr.214 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scmnr.229 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/SiR/trunk'}
let scmnr.336 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/cpp/trunk'}
" The following plugins do not have a separate repository:
let scmnr.83  = {'url': 'http://lh-vim.googlecode.com/svn/misc/trunk/plugin/let-modeline.vim', 'archive_name': 'let-modeline.vim', 'type': 'archive', 'script-type': 'utility'}
let scmnr.727 = {'url': 'http://lh-vim.googlecode.com/svn/misc/trunk/plugin/local_vimrc.vim', 'archive_name': 'local_vimrc.vim', 'type': 'archive', 'script-type': 'utility'}
" let scm['lh-vim-lib']          = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/vim-lib/trunk'}
let scm['build-tools-wrapper'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/BTW/trunk'}
let scm['lh-tags'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/tags/trunk'}
let scm['lh-dev'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/dev/trunk'}
let scm['lh-refactor'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/refactor/trunk'}
let scm['system-tools'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/system-tools/trunk'}
let scm['UT'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/UT/trunk'}
let scm['vim-clang'] = {'type': 'git', 'url': 'git://github.com/LucHermitte/vim-clang'}
" system-tools are required for vim-spell.tar.gz (vimscript #135), which are 
" part of misc. Cannot install using 'type':'archive': it won’t pull in 
" documentation. Alternative: use cpp (vimscript #336, above) in place of a@lh
" Triggers.vim (vimscript #48) which is also here requires fileuptodate.
let scm['lh-misc'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/misc/trunk', 'dependencies': {'system-tools': {}, 'a@lh': {}, 'fileuptodate': {}}}
" Not owned by Luc Hermitte, but forked and enhanced...
" let scmnr.222 = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}
let scm['mu-template@lh'] = {'type': 'svn', 'url': 'http://lh-vim.googlecode.com/svn/mu-template/trunk'}
let scm['fileuptodate'] = {'url': 'http://hermitte.free.fr/vim/ressources/dollar_VIM/plugin/fileuptodate.vim', 'archive_name': 'fileuptodate.vim', 'type': 'archive', 'script-type': 'utility'}
let scm['a@lh'] = {'url': 'http://code.google.com/p/lh-vim/source/browse/cpp/trunk/plugin/a-old.vim', 'archive_name': 'a-old.vim', 'type': 'archive', 'script-type': 'utility'}

" Yasuhiro Matsumoto
let scmnr.52 = {'type': 'git', 'url': 'git://github.com/mattn/calendar-vim'}
let scmnr.2423 = {'type': 'git', 'url': 'git://github.com/mattn/gist-vim'}
let scmnr.2678 = {'type': 'git', 'url': 'git://github.com/mattn/googlereader-vim'}
let scmnr.2948 = {'type': 'git', 'url': 'git://github.com/mattn/googlesuggest-complete-vim'}
let scmnr.2981 = {'type': 'git', 'url': 'git://github.com/mattn/zencoding-vim'}
let scmnr.3505 = {'type': 'git', 'url': 'git://github.com/mattn/pastebin-vim'}
let scmnr.3790 = {'type': 'git', 'url': 'git://github.com/mattn/sonictemplate-vim'}
let scmnr.3819 = {'type': 'git', 'url': 'git://github.com/mattn/lisper-vim'}
let scmnr.4019 = {'type': 'git', 'url': 'git://github.com/mattn/webapi-vim'}
" Requires postupdate hook // though non-SCM source does also
let scmnr.687 = {'type': 'git', 'url': 'git://github.com/mattn/vimtweak'}
let scm['plugins-update-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/plugins-update-vim'}
let scm['googletasks-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/googletasks-vim'}
let scm['wwwrenderer-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/wwwrenderer-vim'}
let scm['favstar-vim'] = {'type': 'git', 'url': 'git://github.com/mattn/favstar-vim'}
let scm['ideone'] = {'type': 'git', 'url': 'git://github.com/mattn/ideone-vim', 'addon-info': {'dependencies': {'%4019': {}}}}
let scm['vim-textobj-url'] = {'type': 'git', 'url': 'git://github.com/mattn/vim-textobj-url'}

" Bob Hiestand
let scmnr.90 = {'type': 'git', 'url': 'git://repo.or.cz/vcscommand'}

" Devin Weaver (sukima)
let scmnr.301 = {'type': 'git', 'url': 'git://github.com/sukima/xmledit'}
let scm['LSLvim'] = {'type': 'git', 'url': 'git://github.com/sukima/LSLvim'}

" Niklas Lindström
let scmnr.328 = {'type': 'git', 'url': 'git://github.com/niklasl/vimheap'}
let scmnr.3417 = {'type': 'git', 'url': 'git://github.com/niklasl/vim-toner'}

" Srinath Avadhanula
let scmnr.475 = {'type': 'git', 'url': 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'}

" Ned Konz
let scmnr.517 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" Chris Vertonghen
let scmnr.603 = {'type': 'git', 'url': 'git://github.com/chrisv/vim-chrisv'}

" eric johnson
" Also requires post-installation hook
let scmnr.663 = {'type': 'git', 'url': 'git://github.com/kablamo/VimDebug'}
let scmnr.4485 = {'type': 'git', 'url': 'git://github.com/kablamo/vim-git-log'}

" atsushi moriki
let scmnr.830 = {'type': 'git', 'url': 'git://github.com/petdance/vim-perl'}

" Tom Link
let scmnr.861  = {'type': 'git', 'url': 'git://github.com/tomtom/viki_vim'}
let scmnr.1030 = {'type': 'git', 'url': 'git://github.com/tomtom/scalefont_vim'}
let scmnr.1160 = {'type': 'git', 'url': 'git://github.com/tomtom/tskeleton_vim'}
let scmnr.1173 = {'type': 'git', 'url': 'git://github.com/tomtom/tcomment_vim'}
let scmnr.1284 = {'type': 'git', 'url': 'git://github.com/tomtom/TortoiseSVN_vim'}
let scmnr.1431 = {'type': 'git', 'url': 'git://github.com/tomtom/checksyntax_vim'}
let scmnr.1730 = {'type': 'git', 'url': 'git://github.com/tomtom/tassert_vim'}
let scmnr.1751 = {'type': 'git', 'url': 'git://github.com/tomtom/tgpg_vim'}
let scmnr.1863 = {'type': 'git', 'url': 'git://github.com/tomtom/tlib_vim'}
let scmnr.1864 = {'type': 'git', 'url': 'git://github.com/tomtom/tmru_vim'}
let scmnr.1865 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectfiles_vim'}
let scmnr.1866 = {'type': 'git', 'url': 'git://github.com/tomtom/tselectbuffer_vim'}
let scmnr.1915 = {'type': 'git', 'url': 'git://github.com/tomtom/tbibtools_vim'}
let scmnr.2014 = {'type': 'git', 'url': 'git://github.com/tomtom/ttoc_vim'}
let scmnr.2017 = {'type': 'git', 'url': 'git://github.com/tomtom/tregisters_vim'}
let scmnr.2018 = {'type': 'git', 'url': 'git://github.com/tomtom/ttags_vim'}
let scmnr.2033 = {'type': 'git', 'url': 'git://github.com/tomtom/trag_vim'}
let scmnr.2037 = {'type': 'git', 'url': 'git://github.com/tomtom/hookcursormoved_vim'}
let scmnr.2040 = {'type': 'git', 'url': 'git://github.com/tomtom/tcalc_vim'}
let scmnr.2055 = {'type': 'git', 'url': 'git://github.com/tomtom/ttagecho_vim'}
let scmnr.2076 = {'type': 'git', 'url': 'git://github.com/tomtom/setsyntax_vim'}
let scmnr.2279 = {'type': 'git', 'url': 'git://github.com/tomtom/cmdlinehelp_vim'}
let scmnr.2292 = {'type': 'git', 'url': 'git://github.com/tomtom/linglang_vim'}
let scmnr.2437 = {'type': 'git', 'url': 'git://github.com/tomtom/shymenu_vim'}
let scmnr.2580 = {'type': 'git', 'url': 'git://github.com/tomtom/spec_vim'}
let scmnr.2584 = {'type': 'git', 'url': 'git://github.com/tomtom/quickfixsigns_vim'}
let scmnr.2594 = {'type': 'git', 'url': 'git://github.com/tomtom/tmarks_vim'}
let scmnr.2894 = {'type': 'git', 'url': 'git://github.com/tomtom/vikitasks_vim'}
let scmnr.2915 = {'type': 'git', 'url': 'git://github.com/tomtom/startup_profile_vim'}
let scmnr.2917 = {'type': 'git', 'url': 'git://github.com/tomtom/tplugin_vim'}
let scmnr.2991 = {'type': 'git', 'url': 'git://github.com/tomtom/rcom_vim'}
let scmnr.3013 = {'type': 'git', 'url': 'git://github.com/tomtom/tcommand_vim'}
let scmnr.3051 = {'type': 'git', 'url': 'git://github.com/tomtom/vimform_vim'}
let scmnr.3214 = {'type': 'git', 'url': 'git://github.com/tomtom/presets_vim'}
let scmnr.3326 = {'type': 'git', 'url': 'git://github.com/tomtom/stakeholders_vim'}
let scmnr.3653 = {'type': 'git', 'url': 'git://github.com/tomtom/brep_vim'}
let scmnr.3780 = {'type': 'git', 'url': 'git://github.com/tomtom/indentfolds_vim'}
let scmnr.4199 = {'type': 'git', 'url': 'git://github.com/tomtom/tinykeymap_vim'}
let scmnr.4345 = {'type': 'git', 'url': 'git://github.com/tomtom/templator_vim'}
let scm['toptions'] = {'type': 'git', 'url': 'git://github.com/tomtom/toptions_vim'}
let scm['worksheet'] = {'type': 'git', 'url': 'git://github.com/tomtom/worksheet_vim'}
let scm['prototype'] = {'type': 'git', 'url': 'git://github.com/tomtom/prototype_vim'}

" André Kelpe
let scmnr.910 = {'type': 'git', 'url': 'git://github.com/fs111/pydoc.vim'}

" Eric Van Dewoestine
let scmnr.1093 = {'type': 'git', 'url': 'git://github.com/ervandew/archive'}
let scmnr.1643 = {'type': 'git', 'url': 'git://github.com/ervandew/supertab'}
let scmnr.2711 = {'type': 'git', 'url': 'git://github.com/ervandew/screen'}
let scmnr.3661 = {'type': 'git', 'url': 'git://github.com/ervandew/lookup'}
let scmnr.3668 = {'type': 'git', 'url': 'git://github.com/ervandew/sgmlendtag'}

" John Wellesz
let scmnr.1120 = {'type': 'git', 'url': 'git://github.com/2072/PHP-Indenting-for-VIm'}

" Ciaran McCreesh
let scmnr.1143 = {'type': 'git', 'url': 'git://github.com/ciaranm/inkpot'}
let scmnr.1171 = {'type': 'git', 'url': 'git://github.com/ciaranm/detectindent'}
let scmnr.1876 = {'type': 'git', 'url': 'git://github.com/ciaranm/securemodelines'}

" Anders Thøgersen
let scmnr.1167 = {'type': 'git', 'url': 'git://github.com/aklt/vim-substitute'}
let scmnr.2564 = {'type': 'git', 'url': 'git://github.com/aklt/vim-simple_comments'}
let scmnr.3538 = {'type': 'git', 'url': 'git://github.com/aklt/plantuml-syntax'}
let scmnr.4353 = {'type': 'git', 'url': 'git://github.com/aklt/vim-line_length'}

" Marty Grenfell
let scmnr.1218 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdcommenter'}
let scmnr.1658 = {'type': 'git', 'url': 'git://github.com/scrooloose/nerdtree'}
let scmnr.2736 = {'type': 'git', 'url': 'git://github.com/scrooloose/syntastic'}

" Ben Williams
let scmnr.1242 = {'type': 'git', 'url': 'git://github.com/plasticboy/vim-markdown'}

" Peter Provost
let scmnr.1327 = {'type': 'git', 'url': 'git://github.com/PProvost/vim-ps1'}

" Rene de Zwart
let scmnr.1397 = {'type': 'git', 'url': 'git://github.com/othree/xml.vim'}

" Tim Pope
let scmnr.1433 = {'type': 'git', 'url': 'git://github.com/tpope/vim-haml'}
let scmnr.1545 = {'type': 'git', 'url': 'git://github.com/tpope/vim-abolish'}
let scmnr.1567 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rails'}
let scmnr.1590 = {'type': 'git', 'url': 'git://github.com/tpope/vim-unimpaired'}
let scmnr.1617 = {'type': 'git', 'url': 'git://github.com/tpope/vim-afterimage'}
let scmnr.1624 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pastie'}
let scmnr.1654 = {'type': 'git', 'url': 'git://github.com/tpope/vim-git'}
let scmnr.1697 = {'type': 'git', 'url': 'git://github.com/tpope/vim-surround'}
let scmnr.1891 = {'type': 'git', 'url': 'git://github.com/tpope/vim-vividchalk'}
let scmnr.1896 = {'type': 'git', 'url': 'git://github.com/tpope/vim-ragtag'}
let scmnr.2120 = {'type': 'git', 'url': 'git://github.com/tpope/vim-speeddating'}
let scmnr.2136 = {'type': 'git', 'url': 'git://github.com/tpope/vim-repeat'}
let scmnr.2332 = {'type': 'git', 'url': 'git://github.com/tpope/vim-pathogen'}
let scmnr.2386 = {'type': 'git', 'url': 'git://github.com/tpope/vim-endwise'}
let scmnr.2973 = {'type': 'git', 'url': 'git://github.com/tpope/vim-cucumber'}
let scmnr.2975 = {'type': 'git', 'url': 'git://github.com/tpope/vim-fugitive'}
let scmnr.3669 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rake'}
let scmnr.3695 = {'type': 'git', 'url': 'git://github.com/tpope/vim-commentary'}
let scmnr.4269 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rvm'}
let scmnr.4280 = {'type': 'git', 'url': 'git://github.com/tpope/vim-bundler'}
let scmnr.4300 = {'type': 'git', 'url': 'git://github.com/tpope/vim-eunuch'}
let scmnr.4359 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rsi'}
let scmnr.4375 = {'type': 'git', 'url': 'git://github.com/tpope/vim-sleuth'}
let scmnr.4391 = {'type': 'git', 'url': 'git://github.com/tpope/vim-sensible'}
let scmnr.4394 = {'type': 'git', 'url': 'git://github.com/tpope/vim-scriptease'}
let scmnr.4410 = {'type': 'git', 'url': 'git://github.com/tpope/vim-characterize'}
let scmnr.4455 = {'type': 'git', 'url': 'git://github.com/tpope/vim-rbenv'}
let scmnr.4472 = {'type': 'git', 'url': 'git://github.com/tpope/vim-obsession'}
let scmnr.4488 = {'type': 'git', 'url': 'git://github.com/tpope/vim-tbone'}
let scmnr.4504 = {'type': 'git', 'url': 'git://github.com/tpope/vim-dispatch'}
let scm['flatfoot'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-flatfoot'}
let scm['vim-rvm'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-rvm'}
let scm['markdown@tpope'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-markdown'}
let scm['vim-fireplace'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-fireplace'}
let scm['vim-classpath'] = {'type': 'git', 'url': 'git://github.com/tpope/vim-classpath'}
" " The below plugin is present on vim.org, but does not belong to Tim Pope
" let scmnr.1626 = {'type': 'git', 'url': 'git://github.com/tpope/vim-liquid'}

" omi taku
let scmnr.1456 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-copypath'}
let scmnr.2173 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-head'}
let scmnr.2321 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-zoom'}
let scmnr.2326 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-batch-source'}
let scmnr.2327 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-catn'}
let scmnr.2341 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-postmail'}
let scmnr.2789 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-rargs'}
let scmnr.2877 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-spinner'}
let scmnr.3572 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-ro-when-swapfound'}
let scmnr.3595 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-ethna-switch'}
let scmnr.3601 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-cmdline-insertdatetime'}
let scmnr.3602 = {'type': 'git', 'url': 'git://github.com/taku-o/vim-reorder-columns'}
let scm['vim-logging'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-logging'}
let scm['vim-holdspace'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-holdspace'}
let scm['vim-editexisting-ext'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-editexisting-ext'}
let scm['vim-funlib-map'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-funlib-map', 'addon-info': {'dependencies': {'vim-funlib':{}}}}
let scm['vim-fix-numbering'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-fix-numbering'}
let scm['vim-chardet'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-chardet'}
let scm['vim-mmatch'] = {'type': 'git', 'url': 'git://github.com/taku-o/vim-mmatch'}

" Manpreet Singh
let scmnr.1563 = {'type': 'git', 'url': 'git://github.com/junkblocker/patchreview-vim'}

" Marc Weber
let scmnr.1582 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-background-cmd'}
let scmnr.1963 = {'type': 'git', 'url': 'git://github.com/MarcWeber/theonevimlib'}
let scmnr.2376 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sql'}
let scmnr.2540 = {'type': 'git', 'url': 'git://github.com/garbas/vim-snipmate'}
let scmnr.2933 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-fcsh'}
let scmnr.2934 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-actions'}
let scmnr.2940 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-mw-utils'}
let scmnr.3018 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-completion'}
let scmnr.3124 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sbt'}
let scmnr.3143 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-haxe'}
let scmnr.3199 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ocaml'}
let scmnr.3307 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-async'}
let scmnr.3315 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-json-encoding'}
let scmnr.3317 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-signs'}
let scmnr.3320 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-xdebug'}
let scmnr.3429 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-sml'}
let scmnr.3432 = {'type': 'git', 'url': 'git://github.com/garbas/vim-snipmate'}
let scmnr.3916 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-haskell'}
let scmnr.3977 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-commenting'}
let scmnr.4024 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-rdebug'}
let scmnr.4028 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-ruby-debug-ide'}
let scmnr.4340 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-commandline-completion'}
let scmnr.4630 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-errorformats'}
let scmnr.4656 = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-errorformats'}
let scm['vim-addon-python-pdb'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-python-pdb'}
let scm['vim-addon-lout'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-lout'}
let scm['vim-addon-rfc'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-rfc'}
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
let scm['vim-addon-syntax-checker'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-syntax-checker'}
let scm['vim-addon-mru'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-mru'}
let scm['vim-addon-surround'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-surround'}
let scm['vim-addon-toc'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-toc'}
let scm['vim-ruby'] = {'type': 'git', 'url': 'git://github.com/vim-ruby/vim-ruby'}
let scm['SmartTag'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/SmartTag'}
let scm['vim-addon-text-objects'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-addon-text-objects'}
let scm['vim-haxe-syntax'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/vim-haxe-syntax'}
" There was key {'branch': 'master-vim-cleaned-up'}, but it is not processed
" anywhere thus removed
let scm['ensime'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/ensime'}
" override snipmate. There is really no reason anymore to use the old version
" snipMate could be dropped. Keep alias
let scm['snipmate'] = {'type': 'git', 'url': 'git://github.com/MarcWeber/snipmate.vim'}

" Oscar Hellström
let scmnr.1584 = {'type': 'git', 'url': 'git://github.com/oscarh/vimerl'}

" Viktor Kojouharov
"tiagofalcao asked me to add the svn source:
let scmnr.1702 = {'type': 'svn', 'url': 'http://svn.enlightenment.org/svn/e/trunk/edje/data/vim/'}

" Takeshi NISHIDA
let scmnr.1879 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-autocomplpop'}
let scmnr.1984 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'}
let scmnr.2199 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-gauref'}
let scmnr.2637 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scmfrontend'}
let scmnr.3252 = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-l9'}
let scm['abolish#doc-ja'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-abolish-ja'}
let scm['dsary'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-dsary'}
let scm['fteval'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-fteval'}
let scm['jabeige'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-jabeige'}
let scm['luciusmod'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-luciusmod'}
let scm['scriproject'] = {'type': 'hg', 'url': 'https://bitbucket.org/ns9tks/vim-scriproject'}

" Stephen Bach
let scmnr.1890 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}
" It is not a copy-paste bug, description of both plugins point to the same
" repository
let scmnr.2050 = {'type': 'git', 'url': 'git://github.com/sjbach/lusty'}

" Yukihiro Nakadaira
let scmnr.1939 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/autofmt'}
let scmnr.2193 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/fpdf-vim'}
let scmnr.2375 = {'type': 'svn', 'url': 'http://vim-soko.googlecode.com/svn/trunk/if_v8'}
let scmnr.3457 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-paint'}
let scmnr.3517 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-iconv'}
let scmnr.3804 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-diff'}
let scmnr.4454 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-vimlparser'}
let scmnr.4585 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-bgimg'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3482 = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-remote'}
let scmnr.4258 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://gist.github.com/3848180'}, {'sha3.vim': 'autoload'})
" The following plugin does not have a separate repository:
let scmnr.2972 = {'url': 'https://github.com/ynkdir/vim-funlib/raw/master/autoload/hmac.vim', 'archive_name': 'hmac.vim', 'type': 'archive', 'script-type': 'utility'}
let scm['vim-patch'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-patch'}
let scm['vim-samegame'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-samegame'}
let scm['vim-print'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-print'}
let scm['vim-funlib'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-funlib'}
let scm['vim-guess'] = {'type': 'git', 'url': 'git://github.com/ynkdir/vim-guess'}

" Eustaquio Rangel de Oliveira Jr.
let scmnr.1966 = {'type': 'git', 'url': 'git://github.com/taq/vim-ruby-snippets'}
let scmnr.2258 = {'type': 'git', 'url': 'git://github.com/taq/vim-git-branch-info'}
let scmnr.2567 = {'type': 'git', 'url': 'git://github.com/taq/vim-rspec'}
let scmnr.3308 = {'type': 'git', 'url': 'git://github.com/taq/vim-refact'}

" Josh O'Rourke
let scmnr.1995 = {'type': 'git', 'url': 'git://github.com/jpo/vim-railscasts-theme'}
" The following repository is referenced on vim.org, but not present on github:
" let scmnr.2517 = {'type': 'git', 'url': 'git://github.com/jpo/vim-norwaytoday-theme'}

" Thiago Alves
let scmnr.2009 = {'type': 'git', 'url': 'git://github.com/Townk/vim-autoclose'}

" Will Gray
let scmnr.2024 = {'type': 'git', 'url': 'git://github.com/graywh/vim-brew'}
" The following plugin does not have a separate repository:
let scmnr.2616 = {'url': 'https://github.com/graywh/dotfiles/raw/master/.vim/colors/graywh.vim', 'archive_name': 'graywh.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Kamil Dworakowski
let scmnr.2032 = {'type': 'svn', 'url': 'http://swap-params-for-vim.googlecode.com/svn/trunk'}

" Kana Natsuno
let scmnr.2097 = {'type': 'git', 'url': 'git://github.com/kana/vim-narrow'}
let scmnr.2098 = {'type': 'git', 'url': 'git://github.com/kana/vim-fakeclip'}
let scmnr.2099 = {'type': 'git', 'url': 'git://github.com/kana/vim-xml-autons'}
let scmnr.2100 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-user'}
let scmnr.2101 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-datetime'}
let scmnr.2107 = {'type': 'git', 'url': 'git://github.com/kana/vim-scratch'}
let scmnr.2274 = {'type': 'git', 'url': 'git://github.com/kana/vim-flydiff'}
let scmnr.2275 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-fold'}
let scmnr.2276 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-jabraces'}
let scmnr.2290 = {'type': 'git', 'url': 'git://github.com/kana/vim-smartchr'}
let scmnr.2291 = {'type': 'git', 'url': 'git://github.com/kana/vim-skeleton'}
let scmnr.2335 = {'type': 'git', 'url': 'git://github.com/kana/vim-metarw'}
let scmnr.2336 = {'type': 'git', 'url': 'git://github.com/kana/vim-metarw-git'}
let scmnr.2337 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku'}
let scmnr.2338 = {'type': 'git', 'url': 'git://github.com/kana/vim-bundle'}
let scmnr.2343 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-bundle'}
let scmnr.2344 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-metarw'}
let scmnr.2355 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-lastpat'}
let scmnr.2402 = {'type': 'git', 'url': 'git://github.com/kana/vim-advice'}
let scmnr.2403 = {'type': 'git', 'url': 'git://github.com/kana/vim-stackreg'}
let scmnr.2410 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-args'}
let scmnr.2415 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-diff'}
let scmnr.2425 = {'type': 'git', 'url': 'git://github.com/kana/vim-arpeggio'}
let scmnr.2455 = {'type': 'git', 'url': 'git://github.com/kana/vim-outputz'}
let scmnr.2467 = {'type': 'git', 'url': 'git://github.com/kana/vim-submode'}
let scmnr.2470 = {'type': 'git', 'url': 'git://github.com/kana/vim-smartword'}
let scmnr.2484 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-indent'}
let scmnr.2514 = {'type': 'git', 'url': 'git://github.com/kana/vim-ctxabbr'}
let scmnr.2610 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-entire'}
let scmnr.2619 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-function'}
let scmnr.2622 = {'type': 'git', 'url': 'git://github.com/kana/vim-ku-quickfix'}
let scmnr.2673 = {'type': 'git', 'url': 'git://github.com/kana/vim-smarttill'}
let scmnr.2675 = {'type': 'git', 'url': 'git://github.com/kana/vim-altercmd'}
let scmnr.2692 = {'type': 'git', 'url': 'git://github.com/kana/vim-operator-user'}
let scmnr.2716 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-syntax'}
let scmnr.2773 = {'type': 'git', 'url': 'git://github.com/kana/vim-grex'}
let scmnr.2782 = {'type': 'git', 'url': 'git://github.com/kana/vim-operator-replace'}
let scmnr.2785 = {'type': 'git', 'url': 'git://github.com/kana/vim-wwwsearch'}
let scmnr.2857 = {'type': 'git', 'url': 'git://github.com/kana/vim-exjumplist'}
let scmnr.2858 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-fatpack'}
let scmnr.3012 = {'type': 'git', 'url': 'git://github.com/kana/vim-vspec'}
let scmnr.3886 = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-line'}
let scmnr.3891 = {'type': 'git', 'url': 'git://github.com/kana/vim-gf-user'}
let scmnr.3892 = {'type': 'git', 'url': 'git://github.com/kana/vim-gf-diff'}
let scmnr.4201 = {'type': 'git', 'url': 'git://github.com/kana/vim-tabpagecd'}
let scmnr.4202 = {'type': 'git', 'url': 'git://github.com/kana/vim-altr'}
let scm['exfiletype'] = {'type': 'git', 'url': 'git://github.com/kana/vim-exfiletype'}
let scm['xml-move'] = {'type': 'git', 'url': 'git://github.com/kana/vim-xml-move'}
let scm['vcsi'] = {'type': 'git', 'url': 'git://github.com/kana/vim-vcsi'}
let scm['textobj-django-template'] = {'type': 'git', 'url': 'git://github.com/kana/vim-textobj-django-template', 'dependencies': {'%2100': {}}}
let scm['flymake'] = {'type': 'git', 'url': 'git://github.com/kana/vim-flymake'}

" David Thomas
let scmnr.2126 = {'type': 'git', 'url': 'git://github.com/davidpthomas/vim4accurev'}
let scmnr.4033 = {'type': 'git', 'url': 'git://github.com/davidpthomas/vim4rally'}

" Michael Brown
let scmnr.2147 = {'type': 'git', 'url': 'git://github.com/mjbrownie/Trac.vim'}
let scmnr.2294 = {'type': 'git', 'url': 'git://github.com/mjbrownie/swapit'}
let scmnr.2999 = {'type': 'git', 'url': 'git://github.com/mjbrownie/django-template-textobjects'}
let scmnr.3000 = {'type': 'git', 'url': 'git://github.com/mjbrownie/html-textobjects'}
let scmnr.3010 = {'type': 'git', 'url': 'git://github.com/mjbrownie/delete-surround-html'}
let scmnr.3533 = {'type': 'git', 'url': 'git://github.com/mjbrownie/GetFilePlus'}
let scmnr.4027 = {'type': 'git', 'url': 'git://github.com/mjbrownie/vim-htmldjango_omnicomplete'}
let scmnr.2780 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/mjbrownie/Python-Tag-Import'}, {'python_tag_import.vim': 'ftplugin'})
let scmnr.2781 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/mjbrownie/django_helper.vim'}, {'django_helper.vim': 'plugin'})

" Jeremy Cantrell
let scmnr.2158 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-diffchanges'}
let scmnr.2251 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-journal'}
let scmnr.3293 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-numbered'}
let scmnr.3486 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-virtualenv'}
let scmnr.3487 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-reporoot'}
let scmnr.3541 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-fatrat'}
let scmnr.3543 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-opener'}
let scmnr.3578 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-lastmod'}
let scmnr.4134 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-spacepaste'}
" Repository lacks contents
" let scmnr.2152 = {'type': 'git', 'url': 'git://github.com/jmcantrell/vim-snippets'}

" Ted Pavlic
" Note: it is not an actual vim script, it is a command-line (shell
" command-line) utility:
let scmnr.2182 = {'type': 'hg', 'url': 'http://hg.tedpavlic.com/vimlatex/'}

" Victor Bogado da Silva Lins
let scmnr.2184 = {'type': 'git', 'url': 'git://github.com/bogado/file-line'}

" Brian Lewis
let scmnr.2212 = {'type': 'git', 'url': 'git://github.com/bsl/obviousmode'}

" Maxim Kim
let scmnr.2226 = {'type': 'hg', 'url': 'https://code.google.com/p/vimwiki', 'addon-info': {'runtimepath': 'src'}}

" Peter Odding
let scmnr.2252 = {'type': 'git', 'url': 'git://github.com/xolox/vim-publish'}
let scmnr.3104 = {'type': 'git', 'url': 'git://github.com/xolox/vim-pyref'}
let scmnr.3114 = {'type': 'git', 'url': 'git://github.com/xolox/vim-easytags'}
let scmnr.3123 = {'type': 'git', 'url': 'git://github.com/xolox/vim-shell'}
let scmnr.3148 = {'type': 'git', 'url': 'git://github.com/xolox/vim-reload'}
let scmnr.3150 = {'type': 'git', 'url': 'git://github.com/xolox/vim-session'}
let scmnr.3169 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-inspect'}
let scmnr.3375 = {'type': 'git', 'url': 'git://github.com/xolox/vim-notes'}
let scmnr.3625 = {'type': 'git', 'url': 'git://github.com/xolox/vim-lua-ftplugin'}
let scmnr.4586 = {'type': 'git', 'url': 'git://github.com/xolox/vim-colorscheme-switcher'}
let scmnr.4597 = {'type': 'git', 'url': 'git://github.com/xolox/vim-misc'}
let scmnr.3242 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/xolox/vim-open-associated-programs'}, {'open.vim': 'autoload/xolox'})

" Matt Wozniski
let scmnr.2390 = {'type': 'git', 'url': 'git://github.com/godlygeek/csapprox'}
let scm['colorchart'] = {'type': 'git', 'url': 'git://github.com/godlygeek/colorchart'}
let scm['netlib'] = {'type': 'git', 'url': 'git://github.com/godlygeek/netlib'}
let scm['vim-plugin-bundling'] = {'type': 'git', 'url': 'git://github.com/godlygeek/vim-plugin-bundling'}
let scm['windowlayout'] = {'type': 'git', 'url': 'git://github.com/godlygeek/windowlayout'}

" Bruno Michel
let scmnr.2416 = {'type': 'git', 'url': 'git://github.com/nono/jquery.vim'}
let scmnr.2417 = {'type': 'git', 'url': 'git://github.com/nono/merb.vim'}
let scmnr.3638 = {'type': 'git', 'url': 'git://github.com/nono/vim-handlebars'}
" This should possibly be named github_theme@nono
let scm['github_vim_theme'] = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/nono/github_vim_theme'}, {'github.vim': 'colors'})

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
let scm['kami'] = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/ujihisa/vim-kami'}, {'kami.vim': 'ftplugin'})

" Thomas Allen
let scmnr.2424 = {'type': 'git', 'url': 'git://github.com/tmallen/transmit-vim'}
let scmnr.2719 = {'type': 'git', 'url': 'git://github.com/tmallen/proj-vim'}
let scmnr.3163 = {'type': 'git', 'url': 'git://github.com/tmallen/endline-vim'}
let scmnr.4431 = {'type': 'git', 'url': 'git://github.com/oinksoft/tcd.vim'}

" Anthony Panozzo
let scmnr.2429 = {'type': 'git', 'url': 'git://github.com/panozzaj/vim-autocorrect'}

" @kevinwatters
let scmnr.2441 = {'type': 'git', 'url': 'git://github.com/kevinw/pyflakes-vim'}

" David JH
let scmnr.2442 = {'type': 'git', 'url': 'git://github.com/hjdivad/vimlocalhistory'}

" Jonas Kramer
let scmnr.2446 = {'type': 'git', 'url': 'git://github.com/jkramer/vim-narrow'}

" Daniel Schierbeck
let scmnr.2488 = {'type': 'git', 'url': 'git://github.com/dasch/vim-rack'}

" Marcin Sztolcman
let scmnr.2492 = {'type': 'git', 'url': 'git://github.com/mysz/viblip'}

" Rafael Kitover
let scmnr.2526 = {'type': 'git', 'url': 'git://github.com/rkitover/perl-vim-mxd'}
" Note: it is not an actual vim script, it is a command-line (shell
" command-line) utility:
let scmnr.1723 = {'type': 'git', 'url': 'git://github.com/rkitover/vimpager'}

" Tamas Kovacs
let scmnr.2531 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/slimv'}
let scmnr.3998 = {'type': 'hg', 'url': 'https://bitbucket.org/kovisoft/paredit'}

" NanoTech
let scmnr.2555 = {'type': 'git', 'url': 'git://github.com/nanotech/jellybeans.vim'}

" Eddie Carle
let scmnr.2570 = {'type': 'git', 'url': 'git://github.com/eddic/vimdecdef'}

" Miles Sterrett
let scmnr.2571 = {'type': 'git', 'url': 'git://github.com/mileszs/apidock.vim'}
let scmnr.2572 = {'type': 'git', 'url': 'git://github.com/mileszs/ack.vim'}

" Hallison Batista
let scmnr.2573 = {'type': 'git', 'url': 'git://github.com/hallison/vim-darkdevel'}
let scmnr.2878 = {'type': 'git', 'url': 'git://github.com/hallison/vim-rdoc'}
let scmnr.2882 = {'type': 'git', 'url': 'git://github.com/hallison/vim-markdown'}
let scmnr.2942 = {'type': 'git', 'url': 'git://github.com/hallison/vim-ruby-sinatra'}
let scmnr.3091 = {'type': 'git', 'url': 'git://github.com/edsono/vim-sessions'}

" tyru
let scmnr.2576 = {'type': 'git', 'url': 'git://github.com/tyru/winmove.vim'}
let scmnr.2605 = {'type': 'git', 'url': 'git://github.com/tyru/nextfile.vim'}
let scmnr.2615 = {'type': 'git', 'url': 'git://github.com/tyru/vimtemplate.vim'}
let scmnr.2712 = {'type': 'git', 'url': 'git://github.com/tyru/sign-diff.vim'}
let scmnr.2783 = {'type': 'git', 'url': 'git://github.com/tyru/DumbBuf.vim'}
let scmnr.2910 = {'type': 'git', 'url': 'git://github.com/tyru/restart.vim'}
let scmnr.2989 = {'type': 'git', 'url': 'git://github.com/tyru/pummode.vim'}
let scmnr.2990 = {'type': 'git', 'url': 'git://github.com/tyru/stickykey.vim'}
let scmnr.3046 = {'type': 'git', 'url': 'git://github.com/tyru/operator-camelize.vim'}
let scmnr.3118 = {'type': 'git', 'url': 'git://github.com/tyru/skk.vim'}
let scmnr.3133 = {'type': 'git', 'url': 'git://github.com/tyru/open-browser.vim'}
let scmnr.3167 = {'type': 'git', 'url': 'git://github.com/tyru/regbuf.vim'}
let scmnr.3197 = {'type': 'git', 'url': 'git://github.com/tyru/current-func-info.vim'}
let scmnr.3211 = {'type': 'git', 'url': 'git://github.com/tyru/operator-reverse.vim'}
let scmnr.3273 = {'type': 'git', 'url': 'git://github.com/tyru/kirikiri.vim'}
let scmnr.3294 = {'type': 'git', 'url': 'git://github.com/tyru/grass.vim'}
let scmnr.3311 = {'type': 'git', 'url': 'git://github.com/tyru/savemap.vim'}
let scmnr.3312 = {'type': 'git', 'url': 'git://github.com/tyru/operator-html-escape.vim'}
let scmnr.3489 = {'type': 'git', 'url': 'git://github.com/tyru/urilib.vim'}
let scmnr.3490 = {'type': 'git', 'url': 'git://github.com/tyru/visualctrlg.vim'}
let scmnr.3610 = {'type': 'git', 'url': 'git://github.com/tyru/operator-star.vim'}
let scmnr.4273 = {'type': 'git', 'url': 'git://github.com/tyru/autochmodx.vim'}
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
let scm['tjs@tyru'] = {'type': 'git', 'url': 'git://github.com/tyru/tjs.vim'}
let scm['syslib'] = {'type': 'git', 'url': 'git://github.com/tyru/syslib.vim'}
let scm['undoclosewin'] = {'type': 'git', 'url': 'git://github.com/tyru/undoclosewin.vim'}
let scm['cmdwincomplete'] = {'type': 'git', 'url': 'git://github.com/tyru/cmdwincomplete.vim', 'addon-info': {'dependencies': {'%2620': {}}}}
let scm['wim'] = {'type': 'git', 'url': 'git://github.com/tyru/wim', 'addon-info': {'dependencies': {'wwwrenderer-vim': {}, 'openbuf': {}}}}

" Joe Stelmach
let scmnr.2578 = {'type': 'git', 'url': 'git://github.com/joestelmach/lint.vim'}

" Marko Mahnič
let scmnr.2606 = {'type': 'svn', 'url': 'https://vimuiex.svn.sourceforge.net/svnroot/vimuiex/trunk'}

" Shougo Matsushita
let scmnr.2620 = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache'}
let scmnr.3396 = {'type': 'git', 'url': 'git://github.com/Shougo/unite.vim'}
let scmnr.4043 = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplcache-snippets-complete'}
let scmnr.4459 = {'type': 'git', 'url': 'git://github.com/Shougo/neosnippet'}
let scm['vimshell'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimshell', 'addon-info': {'dependencies': {'vimproc': {}}}}
let scm['vimproc'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimproc'}
let scm['vimfiler'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimfiler'}
let scm['vimarise'] = {'type': 'git', 'url': 'git://github.com/Shougo/vimarise'}
let scm['neoui'] = {'type': 'git', 'url': 'git://github.com/Shougo/neoui'}
let scm['neobundle'] = {'type': 'git', 'url': 'git://github.com/Shougo/neobundle.vim'}
let scm['neocomplete'] = {'type': 'git', 'url': 'git://github.com/Shougo/neocomplete'}

" Jie Wu
let scmnr.2627 = {'type': 'git', 'url': 'git://github.com/jwu/exvim'}

" Jakson Aquino
let scmnr.2628 = {'type': 'git', 'url': 'git://github.com/jcfaria/Vim-R-plugin'}

" Al Budden
let scmnr.2646 = {'type': 'hg', 'url': 'https://bitbucket.org/abudden/taghighlight'}
let scmnr.3950 = {'type': 'hg', 'url': 'https://bitbucket.org/abudden/easycolour'}

" Christian Brabandt
let scmnr.2709 = {'type': 'git', 'url': 'git://github.com/chrisbra/SudoEdit.vim'}
let scmnr.2766 = {'type': 'git', 'url': 'git://github.com/chrisbra/Join'}
let scmnr.2822 = {'type': 'git', 'url': 'git://github.com/chrisbra/unicode.vim'}
let scmnr.2830 = {'type': 'git', 'url': 'git://github.com/chrisbra/csv.vim'}
let scmnr.2992 = {'type': 'git', 'url': 'git://github.com/chrisbra/SaveSigns.vim'}
let scmnr.3963 = {'type': 'git', 'url': 'git://github.com/chrisbra/color_highlight'}
let scmnr.3965 = {'type': 'git', 'url': 'git://github.com/chrisbra/DynamicSigns'}
let scmnr.4357 = {'type': 'git', 'url': 'git://github.com/chrisbra/DistractFree'}
let scmnr.2998 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/chrisbra/BackgroundColor.vim'}, {'backgroundColor.vim': 'plugin'})

" lilydjwg
" The following is not a vim plugin, but it is posted on vim.org:
" The following plugin does not have a separate repository:
let scmnr.2778 = {'type': 'git', 'url': 'git://github.com/lilydjwg/winterpy'}
" The following plugin does not have a separate repository:
let scmnr.4407 = {'url': 'https://github.com/lilydjwg/dotvim/raw/master/indent/haskell.vim', 'archive_name': 'haskell.vim', 'type': 'archive', 'script-type': 'indent'}

" Yo-An Lin
let scmnr.2824 = {'type': 'git', 'url': 'git://github.com/c9s/libperl.vim'}
let scmnr.2852 = {'type': 'git', 'url': 'git://github.com/c9s/perlomni.vim'}
let scmnr.2893 = {'type': 'git', 'url': 'git://github.com/c9s/filetype-completion.vim'}
let scmnr.2925 = {'type': 'git', 'url': 'git://github.com/c9s/apt-complete.vim'}
let scmnr.2954 = {'type': 'git', 'url': 'git://github.com/c9s/hypergit.vim'}
let scmnr.2958 = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
" Duplicate
let scmnr.2959 = {'type': 'git', 'url': 'git://github.com/c9s/emoticon.vim'}
let scmnr.3544 = {'type': 'git', 'url': 'git://github.com/c9s/cascading.vim'}
let scmnr.3005 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/c9s/simple-commenter.vim'}, {'simplecommenter.vim': 'plugin'})
let scm['vim-dev-plugin'] = {'type': 'git', 'url': 'git://github.com/c9s/vim-dev-plugin'}
let scm['jifty'] = {'type': 'git', 'url': 'git://github.com/c9s/jifty.vim'}
" The following repositories are referenced on vim.org, but not present on github:
" let scmnr.2784 = {'type': 'git', 'url': 'git://github.com/c9s/template-init.vim'}
" let scmnr.2923 = {'type': 'git', 'url': 'git://github.com/c9s/std.vim'}

" Vincent B
let scmnr.2888 = {'type': 'git', 'url': 'git://github.com/Twinside/vim-codeoverview'}

" Maciej Konieczny
let scmnr.2911 = {'type': 'git', 'url': 'git://github.com/narfdotpl/selfdot.vim'}

" Shawn Biddle
let scmnr.2924 = {'type': 'git', 'url': 'git://github.com/shawncplus/Vim-toCterm'}
let scmnr.3171 = {'type': 'git', 'url': 'git://github.com/shawncplus/phpcomplete.vim'}

" Marcin Szamotulski
let scmnr.2945 = {'type': 'git', 'url': 'git://git.code.sf.net/p/atp-vim/code'}

" Antonio Salazar Cardozo
let scmnr.2962 = {'type': 'git', 'url': 'git://github.com/Shadowfiend/liftweb-vim'}

" Javier Rojas
let scmnr.2968 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-nav'}
let scmnr.3156 = {'type': 'git', 'url': 'git://git.devnull.li/ikiwiki-syntax'}

" Liam Cooke
let scmnr.3011 = {'type': 'git', 'url': 'git://github.com/inky/tumblr'}

" David Terei
let scmnr.3022 = {'type': 'git', 'url': 'git://github.com/dterei/VimBookmarking'}
" It is not a copy-paste bug, descriptions of 2828 and 3439 plugins point to 
" the same repository

" Wincent Colaiuta
let scmnr.3025 = {'type': 'git', 'url': 'git://github.com/wincent/Command-T'}

" Israel Chauca Fuentes
let scmnr.3026 = {'type': 'git', 'url': 'git://github.com/Raimondi/PickAColor'}
let scm['bufring'] = {'type': 'git', 'url': 'git://github.com/Raimondi/bufring'}

" ZyX
let scmnr.3056 = {'type': 'hg', 'url': 'http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3'}
let scmnr.3113 = {'type': 'hg', 'url': 'http://formatvim.hg.sourceforge.net:8000/hgroot/formatvim/formatvim'}
let scmnr.3185 = {'type': 'hg', 'url': 'http://jsonvim.hg.sourceforge.net:8000/hgroot/jsonvim/jsonvim'}
let scmnr.3189 = {'type': 'hg', 'url': 'http://vimoop.hg.sourceforge.net:8000/hgroot/vimoop/vimoop'}
let scmnr.3190 = {'type': 'hg', 'url': 'http://yamlvim.hg.sourceforge.net:8000/hgroot/yamlvim/yamlvim'}
let scmnr.3828 = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/aurum'}
let scm['zvim'] = {'type': 'hg', 'url': 'https://bitbucket.org/ZyX_I/zvim'}

" thinca
let scmnr.3067 = {'type': 'git', 'url': 'git://github.com/thinca/vim-ref'}
let scmnr.3146 = {'type': 'git', 'url': 'git://github.com/thinca/vim-quickrun'}
let scm['rtputil'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-rtputil'}
let scm['logcat'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-logcat'}
let scm['editvar'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-editvar'}
let scm['partedit'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-partedit'}
let scm['unite-history'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-unite-history'}
let scm['textobj-comment@thinca'] = {'type': 'git', 'url': 'git://github.com/thinca/vim-textobj-comment'}
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

" Matan Nassau
let scmnr.3071 = {'type': 'git', 'url': 'git://github.com/wilhelmtell/reimin'}

" Felipe Morales
let scmnr.3101 = {'type': 'git', 'url': 'git://github.com/fmoralesc/Tumble'}

" David Munger
let scmnr.3108 = {'type': 'bzr', 'url': 'lp:vim-gui-box'}
let scmnr.3109 = {'type': 'git', 'url': 'git://github.com/LaTeX-Box-Team/LaTeX-Box'}

" Steve Francia
let scmnr.3125 = {'type': 'git', 'url': 'git://github.com/spf13/PIV'}
let scm['Autostamp'] = {'type': 'git', 'url': 'git://github.com/spf13/Autostamp'}

" Alexandru Tica
let scmnr.3154 = {'type': 'svn', 'url': 'http://vorax.googlecode.com/svn/trunk'}

" Vincent Driessen
let scmnr.3160 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pep8'}
let scmnr.3161 = {'type': 'git', 'url': 'git://github.com/nvie/vim-pyflakes'}
let scmnr.3166 = {'type': 'git', 'url': 'git://github.com/nvie/vim-togglemouse'}
let scmnr.3927 = {'type': 'git', 'url': 'git://github.com/nvie/vim-flake8'}

" Silas Silva
let scmnr.3173 = {'type': 'hg', 'url': 'https://code.google.com/p/vimgcwsyntax'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3102 = {'type': 'git', 'url': 'git://github.com/silasdb/vplinst'}

" Dmitry Frank
let scmnr.3221 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/indexer_stable'}
let scmnr.3884 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/dfrank_util'}
let scmnr.3911 = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/vim-punto-switcher'}
let scm['envcontrol'] = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/envcontrol'}
let scm['indexer@development'] = {'type': 'hg', 'url': 'http://hg.dfrank.ru/vim/bundle/indexer_development'}

" wei ko kao
let scmnr.3232 = {'type': 'git', 'url': 'git://github.com/othree/html5-syntax.vim'}
let scmnr.3236 = {'type': 'git', 'url': 'git://github.com/othree/html5.vim'}
let scmnr.3282 = {'type': 'git', 'url': 'git://github.com/othree/eregex.vim'}

" Dimitar Dimitrov
let scmnr.3237 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-blockinsert'}
let scmnr.3250 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-swap'}
let scmnr.3255 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-sequence'}
let scmnr.3284 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-quotes'}
" The following plugin does not have a separate repository:
let scmnr.3456 = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vimfiles', 'addon-info': {'runtimepath': 'bundle/pgn'}}
let scm['vim-blanklines'] = {'type': 'git', 'url': 'git://github.com/kurkale6ka/vim-blanklines'}

" Oliver Uvman
let scmnr.3239 = {'type': 'git', 'url': 'git://github.com/fholgado/minibufexpl.vim'}

" Mark Harrison
let scmnr.3264 = {'type': 'git', 'url': 'git://github.com/mivok/vimtodo'}

" Xavier Deguillard
let scmnr.3302 = {'type': 'git', 'url': 'git://github.com/Rip-Rip/clang_complete'}

" Greg Sexton
let scmnr.3329 = {'type': 'git', 'url': 'git://github.com/gregsexton/VimCalc'}
let scmnr.3574 = {'type': 'git', 'url': 'git://github.com/gregsexton/gitv'}
let scmnr.3818 = {'type': 'git', 'url': 'git://github.com/gregsexton/MatchTag'}

" Radek Kowalski
let scmnr.3331 = {'type': 'git', 'url': 'git://github.com/rkowal/Lua-Omni-Vim-Completion'}

" basyura
let scmnr.3356 = {'type': 'git', 'url': 'git://github.com/basyura/unite-yarm'}
let scmnr.4532 = {'type': 'git', 'url': 'git://github.com/basyura/TweetVim'}
let scm['twibill'] = {'type': 'git', 'url': 'git://github.com/basyura/twibill.vim', 'addon-info': {'dependencies': {'%3133':{}, '%4019':{}}}}
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

" Dejan Noveski
" This plugin has both mercurial and github repository. I have chosen to use
" first one, but I have no idea which is original and which is generated
" automatically
let scmnr.3416 = {'type': 'hg', 'url': 'https://bitbucket.org/dekomote/w3cvalidate.vim'}

" Jose Elera Campana
let scmnr.3427 = {'type': 'git', 'url': 'git://github.com/jelera/vim-nazca-colorscheme'}
let scmnr.3922 = {'type': 'git', 'url': 'git://github.com/jelera/vim-gummybears-colorscheme'}

" H Xu
let scmnr.3434 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/iniparser'}
let scmnr.3747 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/syntax-dosini.vim'}
let scmnr.3899 = {'type': 'hg', 'url': 'https://bitbucket.org/xuhdev/indent-java.vim'}
" The following is not a vim plugin, but it is posted on vim.org:

" Lars Smit
let scmnr.3445 = {'type': 'git', 'url': 'git://github.com/larssmit/Getafe'}

" Mohammed Badran
let scmnr.3455 = {'type': 'git', 'url': 'git://github.com/mbadran/headlights'}

" gmarik gmarik
let scmnr.3458 = {'type': 'git', 'url': 'git://github.com/gmarik/vundle'}

" t9 md
let scmnr.3485 = {'type': 'git', 'url': 'git://github.com/t9md/vim-phrase', 'addon-info': {'dependencies': {'%3396':{}}}}
let scmnr.3491 = {'type': 'git', 'url': 'git://github.com/t9md/vim-textmanip'}
let scmnr.3494 = {'type': 'git', 'url': 'git://github.com/t9md/vim-underlinetag'}
let scmnr.3627 = {'type': 'git', 'url': 'git://github.com/t9md/vim-resizewin'}
let scmnr.3700 = {'type': 'git', 'url': 'git://github.com/t9md/vim-tryit'}
let scmnr.3701 = {'type': 'git', 'url': 'git://github.com/t9md/vim-fthook'}
let scm['textobj-function-ruby'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-textobj-function-ruby'}
let scm['quicktag'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-quicktag'}
let scm['ruby_eval'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-ruby_eval'}
let scm['surround_custom_mapping'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-surround_custom_mapping'}
let scm['unite-ack'] = {'type': 'git', 'url': 'git://github.com/t9md/vim-unite-ack', 'addon-info': {'dependencies': {'%3396':{}}}}

" richard emberson
let scmnr.3498 = {'type': 'git', 'url': 'git://github.com/megaannum/scala_format'}
let scmnr.4149 = {'type': 'git', 'url': 'git://github.com/megaannum/tui'}
let scmnr.4298 = {'type': 'git', 'url': 'git://github.com/megaannum/vimside'}

" Jezreel Ng
let scmnr.3504 = {'type': 'git', 'url': 'git://github.com/int3/vim-taglist-plus'}
let scmnr.3509 = {'type': 'git', 'url': 'git://github.com/int3/vim-extradite'}
let scmnr.3604 = {'type': 'git', 'url': 'git://github.com/int3/nicer-vim-regexps'}

" Preston Masion
let scmnr.3510 = {'type': 'hg', 'url': 'https://bitbucket.org/pentie/vimrepress'}

" Vim Outliner
let scmnr.3515 = {'type': 'git', 'url': 'git://github.com/vimoutliner/vimoutliner'}

" Derek Wyatt
" Using the author's new github page. Link in vim.org is absent.
let scmnr.3524 = {'type': 'git', 'url': 'git://github.com/derekwyatt/vim-scala'}
" vim.org version is old and does not work well with plugin managers
let scmnr.2624 = {'type': 'git', 'url': 'git://github.com/derekwyatt/vim-protodef'}

" Samson Wu
let scmnr.3535 = {'type': 'git', 'url': 'git://github.com/samsonw/vim-task'}

" Jan Christoph Ebersbach
let scmnr.3557 = {'type': 'git', 'url': 'git://github.com/jceb/vim-editqf'}
let scmnr.3564 = {'type': 'git', 'url': 'git://github.com/jceb/vim-hier'}
let scmnr.3809 = {'type': 'git', 'url': 'git://github.com/jceb/vim-ipi'}
let scm['vim-fastwordcompleter'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-fastwordcompleter'}
let scm['vim-multiedit@jceb'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-multiedit'}
let scm['vim-cd'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-cd'}
let scm['vim-qf_toggle'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-qf_toggle'}
let scm['vim-rfc'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-rfc'}
let scm['vim-visualsearch'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-visualsearch'}
let scm['vim-helpwrapper'] = {'type': 'git', 'url': 'git://github.com/jceb/vim-helpwrapper'}

" Matej Svec
let scmnr.3558 = {'type': 'git', 'url': 'git://github.com/triglav/vim-visual-increment'}

" Anderson Custódio de Oliveira
let scmnr.3575 = {'type': 'git', 'url': 'git://github.com/acustodioo/vim-enter-indent'}

" Pranesh Srinivasan
let scmnr.3586 = {'type': 'git', 'url': 'git://github.com/spranesh/Redhawk', 'addon-info': {'runtimepath': 'editors/vim'}}

" Yuhei Kagaya
let scmnr.3589 = {'type': 'git', 'url': 'git://github.com/violetyk/cake.vim'}

" Mick Koch
let scmnr.3590 = {'type': 'git', 'url': 'git://github.com/kchmck/vim-coffee-script'}

" Aaron Stacy
let scmnr.3594 = {'type': 'git', 'url': 'git://github.com/aaronj1335/ucompleteme'}
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.3593 = {'type': 'git', 'url': 'git://github.com/aaronj1335/pdub'}

" Honza Pokorny
let scmnr.3633 = {'type': 'git', 'url': 'git://github.com/honza/vim-snippets'}

" Venkateswara Rao Mandela
let scmnr.3635 = {'type': 'git', 'url': 'git://github.com/vmandela/WinFastFind'}

" Aleksandr Batsuev
let scmnr.3651 = {'type': 'git', 'url': 'git://github.com/batsuev/google-closure-vim'}
let scm['google-closure-linter-for-vim'] = {'type': 'git', 'url': 'git://github.com/batsuev/google-closure-linter-for-vim'}
let scm['csscomb-vim'] = {'type': 'git', 'url': 'git://github.com/batsuev/csscomb-vim'}

" Nathan Witmer
let scmnr.3676 = {'type': 'git', 'url': 'git://github.com/aniero/vim-copy-as-rtf'}

" Roman Gonzalez
let scmnr.3690 = {'type': 'git', 'url': 'git://github.com/roman/golden-ratio'}

" Matt Sacks
let scmnr.3716 = {'type': 'git', 'url': 'git://github.com/mattsa/vim-fuzzee'}
let scmnr.3864 = {'type': 'git', 'url': 'git://github.com/mattsa/vim-eddie'}

" Steve Losh
let scmnr.3721 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/threesome.vim'}
let scmnr.4000 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/clam.vim'}
let scmnr.4014 = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/vitality.vim'}
let scm['strftimedammit'] = {'type': 'hg', 'url': 'https://bitbucket.org/sjl/strftimedammit.vim'}

" Rykka Krin
let scmnr.3729 = {'type': 'git', 'url': 'git://github.com/Rykka/galaxy.vim'}
let scmnr.4061 = {'type': 'git', 'url': 'git://github.com/Rykka/mathematic.vim'}

" Lorance Stinson
let scmnr.3738 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaTips'}
let scmnr.3749 = {'type': 'git', 'url': 'git://github.com/LStinson/Nagelfar-Vim'}
let scmnr.3765 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaTasks'}
let scmnr.3792 = {'type': 'git', 'url': 'git://github.com/LStinson/TagmaBufMgr'}
" The following plugin does not have a separate repository:
let scmnr.3702 = {'url': 'https://github.com/LStinson/Vim/raw/master/syntax/sql.vim', 'archive_name': 'sql.vim', 'type': 'archive', 'script-type': 'syntax'}

" Andrey Vakarev
let scmnr.3746 = {'type': 'git', 'url': 'git://github.com/avakarev/vim-watchdog'}

" Kirill Klenov
let scmnr.3748 = {'type': 'git', 'url': 'git://github.com/klen/pylint-mode'}

" Enlil Dubenstein
let scmnr.3763 = {'type': 'git', 'url': 'git://github.com/dubenstein/vim-google-scribe'}

" Mike West
let scmnr.3766 = {'type': 'git', 'url': 'git://github.com/mikewest/vimroom'}

" Rainux Luo
let scmnr.3793 = {'type': 'git', 'url': 'git://github.com/rainux/vim-desert-warm-256'}

" Bruno Silva
let scmnr.3794 = {'type': 'git', 'url': 'git://github.com/brunosilva/html-source-explorer'}

" Maciej Małecki
let scmnr.3798 = {'type': 'git', 'url': 'git://github.com/mmalecki/vim-node.js'}

" Rory McKinley
let scmnr.3803 = {'type': 'git', 'url': 'git://github.com/rorymckinley/vim-symbols-strings'}

" wang yicuan
let scmnr.3823 = {'type': 'git', 'url': 'git://github.com/bolasblack/csslint.vim'}

" ali va
" Yes, these are git repositories on bitbucket. Unfortunately, git:// URLs are
" not supported.
let scmnr.3853 = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-dokuwiki'}
let scm['toggletoolbar'] = {'type': 'git', 'url': 'https://bitbucket.org/aliva/vim-toggletoolbar'}

" Daniel Schaefer
let scmnr.3863 = {'type': 'git', 'url': 'git://github.com/epegzz/epegzz.vim'}

" Kim Silkebækken
let scmnr.3881 = {'type': 'git', 'url': 'git://github.com/Lokaltog/vim-powerline'}
let scm['powerline'] = {'type': 'git', 'url': 'git://github.com/Lokaltog/powerline', 'addon-info': {'runtimepath': 'powerline/bindings/vim'}}

" Alex Efros
let scmnr.3883 = {'type': 'hg', 'url': 'https://code.google.com/p/vim-plugin-autosess'}
let scmnr.3885 = {'type': 'hg', 'url': 'https://code.google.com/p/vim-plugin-ruscmd'}
let scmnr.3893 = {'type': 'hg', 'url': 'https://code.google.com/p/vim-plugin-viewdoc'}

" Roman Podolyaka
let scmnr.3903 = {'type': 'git', 'url': 'git://github.com/bloodeclipse/vim-xsnippet'}

" Christopher Sexton
let scmnr.3938 = {'type': 'git', 'url': 'git://github.com/csexton/trailertrash.vim'}
let scm['jekyll'] = {'type': 'git', 'url': 'git://github.com/csexton/jekyll.vim'}
let scm['viceroy'] = {'type': 'git', 'url': 'git://github.com/csexton/viceroy'}

" Alisue Lambda
let scmnr.3948 = {'type': 'git', 'url': 'git://github.com/lambdalisue/django.vim'}
let scmnr.3949 = {'type': 'git', 'url': 'git://github.com/lambdalisue/pyunit.vim'}

" Matthias Guenther
let scmnr.3962 = {'type': 'git', 'url': 'git://github.com/robgleeson/hammer.vim'}

" Jean-Denis Vauguet
let scmnr.3970 = {'type': 'git', 'url': 'git://github.com/chikamichi/mediawiki.vim'}

" Junqing Wang
let scmnr.3972 = {'type': 'git', 'url': 'git://github.com/kight/CSS3-syntax-file-for-vim'}

" yu xie
let scmnr.3975 = {'type': 'git', 'url': 'git://github.com/xieyu/Finder'}

" Suan Yeo
let scmnr.3994 = {'type': 'git', 'url': 'git://github.com/suan/vim-instant-markdown'}

" Mike Skalnik
let scmnr.3995 = {'type': 'git', 'url': 'git://github.com/skalnik/vim-vroom'}

" lorry lee
let scmnr.3999 = {'type': 'git', 'url': 'git://github.com/lorry-lee/vim-ayumi'}

" WU Jun
let scmnr.4030 = {'type': 'git', 'url': 'git://github.com/quark-zju/vim-cpp-auto-include'}

" kakkyz
let scmnr.4039 = {'type': 'git', 'url': 'git://github.com/kakkyz81/evervim'}

" Bogdan Popa
let scmnr.4047 = {'type': 'git', 'url': 'git://github.com/Bogdanp/rbrepl.vim'}

" yf liu
let scmnr.4050 = {'type': 'git', 'url': 'git://github.com/michalliu/jsruntime.vim'}
let scmnr.4056 = {'type': 'git', 'url': 'git://github.com/michalliu/jsoncodecs.vim'}
let scmnr.4057 = {'type': 'git', 'url': 'git://github.com/michalliu/jsflakes.vim'}

" Jon Cairns
let scmnr.4054 = {'type': 'git', 'url': 'git://github.com/joonty/vim-phpunitqf'}
let scmnr.4074 = {'type': 'git', 'url': 'git://github.com/joonty/vim-xdebug'}
let scmnr.4088 = {'type': 'git', 'url': 'git://github.com/joonty/vim-taggatron'}

" brook hong
let scmnr.4059 = {'type': 'git', 'url': 'git://github.com/brookhong/DBGPavim'}

" Carsten Gräser
let scmnr.4065 = {'type': 'git', 'url': 'git://github.com/cgraeser/vim-cmdpathup'}

" Colin Wood
let scmnr.4095 = {'type': 'git', 'url': 'git://github.com/cwood/vim-django'}

" Lee Savide
let scmnr.4100 = {'type': 'hg', 'url': 'https://bitbucket.org/laughingman182/abc-vim', 'addon-info': {'runtimepath': 'src'}}

" Techlive Zheng
let scmnr.4125 = {'type': 'git', 'url': 'git://github.com/techlivezheng/tagbar-phpctags'}

" Evgeny Podjachev
let scmnr.4142 = {'type': 'git', 'url': 'https://bitbucket.org/madevgeny/fastfileselector'}

" Takahiro Yoshihara
let scmnr.4144 = {'type': 'git', 'url': 'git://github.com/tacahiroy/vim-logaling'}
let scmnr.4592 = {'type': 'git', 'url': 'git://github.com/tacahiroy/ctrlp-funky'}

" Kris Jenkins
let scmnr.4206 = {'type': 'git', 'url': 'git://github.com/krisajenkins/vim-java-sql'}
let scmnr.4207 = {'type': 'git', 'url': 'git://github.com/krisajenkins/vim-clojure-sql'}

" Randy Lai
let scmnr.4215 = {'type': 'git', 'url': 'git://github.com/randy3k/r-macvim'}

" Giacomo Comitti
let scmnr.4237 = {'type': 'git', 'url': 'git://github.com/gcmt/taboo.vim'}
let scmnr.4256 = {'type': 'git', 'url': 'git://github.com/gcmt/ozzy.vim'}
let scmnr.4400 = {'type': 'git', 'url': 'git://github.com/gcmt/tube.vim'}
let scmnr.4436 = {'type': 'git', 'url': 'git://github.com/gcmt/psearch.vim'}
let scmnr.4569 = {'type': 'git', 'url': 'git://github.com/gcmt/breeze.vim'}
let scmnr.4660 = {'type': 'git', 'url': 'git://github.com/gcmt/plum.vim'}

" Nathaniel Soares
let scmnr.4246 = {'type': 'git', 'url': 'git://github.com/Soares/longline.vim'}
let scmnr.4247 = {'type': 'git', 'url': 'git://github.com/Soares/tabdiff.vim'}
let scmnr.4249 = {'type': 'git', 'url': 'git://github.com/Soares/write.vim'}

" pebble on software
let scmnr.4295 = {'type': 'git', 'url': 'git://github.com/pebble8888/smartgrep'}

" Benjamin Leopold
let scmnr.4317 = {'type': 'git', 'url': 'git://github.com/cometsong/CommentFrame.vim'}

" Eduan Lavaque
let scmnr.4324 = {'type': 'git', 'url': 'git://github.com/Greduan/vim-change-syntax'}

" Sergey Khorev
let scmnr.4336 = {'type': 'hg', 'url': 'https://bitbucket.org/khorser/vim-repl'}
let scmnr.4347 = {'type': 'hg', 'url': 'https://bitbucket.org/khorser/vim-qfnotes'}
let scmnr.4355 = {'type': 'hg', 'url': 'https://bitbucket.org/khorser/vim-rst-ftplugin'}

" Chiel 92
let scmnr.4337 = {'type': 'git', 'url': 'git://github.com/Chiel92/vim-autoformat'}

" Vivien Didelot
let scmnr.4369 = {'type': 'git', 'url': 'git://github.com/vivien/vim-addon-linux-coding-style'}

" Eduardo Lopez
let scmnr.4382 = {'type': 'git', 'url': 'git://github.com/tapichu/asm2d-vim'}

" Göktuğ Kayaalp
let scmnr.4406 = {'type': 'git', 'url': 'https://bitbucket.org/goktugkayaalp/lithochromatic-vim'}

" Chip Castle
let scmnr.4423 = {'type': 'git', 'url': 'git://github.com/chip/vim-fat-finger'}

" Leo Bärring
let scmnr.4424 = {'type': 'git', 'url': 'git://github.com/tlvb/Usefold'}

" ryan kulla
" The following is not a vim plugin, but it is posted on vim.org:
let scmnr.4430 = {'type': 'git', 'url': 'git://github.com/rkulla/vimogen'}

" Dmitry Geurkov
let scmnr.4432 = {'type': 'git', 'url': 'git://github.com/troydm/zoomwintab.vim'}

" Ryan King
let scmnr.4451 = {'type': 'git', 'url': 'git://github.com/rking/pry-de', 'addon-info': {'runtimepath': 'vim'}}

" Josh Perez
" Old maintainer gave write access to old repository to the new one, thus URL 
" have not changed and is equal to that of #2765 now.
let scmnr.4452 = {'type': 'git', 'url': 'git://github.com/pangloss/vim-javascript'}

" Alex Johnson
let scmnr.4478 = {'type': 'git', 'url': 'git://github.com/notalex/vim-run-live'}

" Denis Tukalenko
let scmnr.4480 = {'type': 'git', 'url': 'git://github.com/detook/vim-composer'}

" Arseny Zarechnev
let scmnr.4493 = {'type': 'git', 'url': 'git://github.com/evindor/vim-rusmode'}

" Tomasz Wyderka
let scmnr.4498 = {'type': 'git', 'url': 'git://github.com/wyderkat/code_upstairs'}

" Dhruva Sagar
let scmnr.4501 = {'type': 'git', 'url': 'git://github.com/dhruvasagar/vim-table-mode'}

" Ben Fritz
let scmnr.4505 = {'type': 'hg', 'url': 'https://code.google.com/p/vim-autohide-plugin'}

" Terry Ma
let scmnr.4523 = {'type': 'git', 'url': 'git://github.com/terryma/vim-multiple-cursors'}

" Andreas Schneider
let scmnr.4538 = {'type': 'git', 'url': 'git://git.cryptomilk.org/projects/vim-gitmodeline'}

" Alberto Miorin
let scmnr.4539 = {'type': 'git', 'url': 'git://github.com/amiorin/vim-bookmarks'}

" Zhao Cai
let scmnr.4576 = {'type': 'git', 'url': 'git://github.com/zhaocai/linepower.vim'}

" Luke Maciak
let scmnr.4587 = {'type': 'git', 'url': 'git://github.com/maciakl/vim-neatstatus'}

" John Krueger
let scmnr.4610 = {'type': 'git', 'url': 'git://github.com/jtmkrueger/vim-c-cr'}

" Andri Möll
let scmnr.4664 = {'type': 'git', 'url': 'git://github.com/moll/vim-bbye'}
let scmnr.4674 = {'type': 'git', 'url': 'git://github.com/moll/vim-node'}

" Jacky Alciné
let scmnr.4670 = {'type': 'git', 'url': 'git://github.com/jalcine/android.vim'}
let scmnr.4731 = {'type': 'git', 'url': 'git://github.com/jalcine/cmake.vim'}

" Adam Stankiewicz
let scmnr.4721 = {'type': 'git', 'url': 'git://github.com/sheerun/vim-polyglot'}

"-----------------------------------------------------------------------------------------------------------------------

" David Briscoe
" The following plugin does not have a separate repository:
let scmnr.3540 = {'url': 'https://github.com/pydave/daveconfig/raw/master/multi/vim/.vim/plugin/save_current_font.vim', 'archive_name': 'save_current_font.vim', 'type': 'archive', 'script-type': 'utility'}

" hickop
" The following plugin does not have a separate repository:
let scmnr.4113 = {'url': 'https://github.com/hickop/home/raw/master/.vim/colors/hickop.vim', 'archive_name': 'hickop.vim', 'type': 'archive', 'script-type': 'color scheme'}

" Sébastien
" The following plugins do not have a separate repository:
let scmnr.4160 = {'url': 'https://github.com/webastien/vim/blob/master/vim/plugin/drupal.vim', 'archive_name': 'drupal.vim', 'type': 'archive', 'script-type': 'utility'}
let scmnr.4162 = {'url': 'https://github.com/webastien/vim/blob/master/vim/plugin/SCSSA.vim', 'archive_name': 'SCSSA.vim', 'type': 'archive', 'script-type': 'utility'}

" Sergey Vakulenko
" The following plugins do not have a separate repository:
let scmnr.2733 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/.vim/plugin/bufReminderRemake.vim', 'archive_name': 'bufReminderRemake.vim', 'type': 'archive', 'script-type': 'utility'}
let scmnr.3946 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/binaries/hop.zip',       'archive_name': 'hop.zip',       'type': 'archive', 'script-type': 'utility'}
let scmnr.3956 = {'url': 'https://github.com/svakulenko/gvim_extention/raw/master/binaries/fwk_notes.zip', 'archive_name': 'fwk_notes.zip', 'type': 'archive', 'script-type': 'utility'}
" You can use the following to pull all his plugins:
let scm['plugins@svakulenko'] = {'type': 'git', 'url': 'git://github.com/svakulenko/gvim_extention', 'addon-info': {'runtimepath': '.vim'}}

" Peter Hofmann
" The following plugins do not have a separate repository:
let scmnr.4333 = {'url': 'https://github.com/vain/dotfiles-pub/raw/master/.vim/colors/termpot.vim', 'archive_name': 'termpot.vim', 'type': 'archive', 'script-type': 'color scheme'}

" joey c
" The following plugin does not have a separate repository:
let scmnr.4381 = {'url': 'http://hwi.ath.cx/code/home/.vim/plugin/RepeatLast.vim', 'archive_name': 'RepeatLast.vim', 'type': 'archive', 'script-type': 'utility'}

" Maksim Ryzhikov
let scmnr.4017 = {'type': 'git', 'url': 'git://github.com/maksimr/vim-jsbeautify', 'addon-info': {'post-install-hook': 'execute "lcd" fnameescape(%d) | call vam#utils#RunShell("git submodule init && git submodule update") | lcd -', 'post-scms-update': 'execute "lcd" fnameescape(%d) | call vam#utils#RunShell("git submodule update") | lcd -'}}

" Andrei Nicholson
let scmnr.2548 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/tetsuo13/Vim-PHP-Doc'}, {'php.vim': 'after/syntax'})

" Paul Lampert
let scmnr.4736 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/lampert/vim'}, {'navigate-softtab.vim': 'plugin'})

" jeb beich
let scmnr.4648 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/jebberjeb/yet-another-buffer-list'}, {'buflist.vim': 'plugin'})

" Robert Mitchell
let scmnr.4526 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/robu3/vimongous'}, {'vimongous.vim': 'plugin', 'venode.js': 'plugin', 'venode-lib.js': 'plugin'})

" Hugo Wang
let scmnr.4512 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/mitnk/thwins'}, {'thwins.vim': 'plugin'})

" Felipe Tanus
let scmnr.4420 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/fotanus/fold_license'}, {'fold_license.vim': 'plugin'})

" felippe alves
let scmnr.4413 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/flipgthb/misc'}, {'darkgit.vim': 'colors'})

" Yu-Heng Chang
let scmnr.4417 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/changyuheng/holokai'}, {'holokai.vim': 'colors'})

" Long Changjin
let scmnr.4332 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/wusuopu/weibo-vim-plugin'}, {'my_weibo.vim': 'plugin'})

" sunus lee
let scmnr.4307 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/sunuslee/vim-plugin-show-git-log'}, {'showgitlog.vim': 'plugin'})
let scmnr.4319 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/sunuslee/vim-plugin-random-colorscheme-picker'}, {'randomColorPicker.vim': 'colors'})

" Guodong Liang
let scmnr.4299 = vamkr#AddCopyHook({'type': 'svn', 'url': 'http://name5566-vim-bookmark.googlecode.com/svn/trunk/'}, {'vbookmark.vim': 'plugin'})

" Basil Gor
let scmnr.4263 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/basilgor/vim-autotags'}, {'autotags.vim': 'plugin'})

" Baptiste Fontaine
let scmnr.4181 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/bfontaine/omgrofl.vim'}, {'omgrofl.vim': 'syntax'})
let scmnr.4507 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/bfontaine/conflicts.vim'}, {'conflicts.vim': 'syntax'})

" Shuhei Kubota
let scmnr.1283 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/tinybufferexplorer'}, {'tbe.vim': 'plugin'})
let scmnr.1477 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/modeliner'}, {'modeliner.vim': 'plugin'})
let scmnr.2205 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/coremosearch'}, {'coremo_search.vim': 'plugin'})
let scmnr.2496 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/changed'}, {'changed.vim': 'plugin'})
let scmnr.2542 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/starrange'}, {'starrange.vim': 'plugin'})
let scmnr.2843 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/fliplr'}, {'fliplr.vim': 'plugin'})
let scmnr.3162 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/tabops'}, {'tabops.vim': 'plugin'})
let scmnr.3640 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/shu/theoldones'}, {'theoldones.vim': 'plugin'})

" dos Santos
let scmnr.3092 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/andre-luiz-dos-santos/autocomp'}, {'autocomp.vim': 'plugin'})

" Carlos Ruiz-Henestrosa
let scmnr.4122 = vamkr#AddCopyHook({'type': 'darcs', 'url': 'http://darcsden.com/karl/vim-ptsc-header'}, {'ptsc-header.vim': 'plugin'})

" mihaly himics
let scmnr.3127 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/trialsolution/gamsvim'}, {'gams.vim': 'syntax'})

" Aydar Khabibullin
let scmnr.3428 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/abra/obsidian2'}, {'obsidian2.vim': 'colors'})

" Andrew Lunny
let scmnr.4101 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/alunny/pegjs-vim'}, {'pegjs.vim': 'plugin'})

" Phui-Hock Chang
let scmnr.3917 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/phuihock/tagport.vim'}, {'tagport.vim': 'ftplugin'})

" Michael Nussbaum
" The following plugin does not have a separate repository:
let scmnr.3851 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/michaelnussbaum08/Mark-Ring'}, {'mark_ring.vim': 'plugin'})

" Aldis Berjoza
" The following plugin does not have a separate repository:
let scmnr.3674 = {'url': 'https://github.com/graudeejs/dot.vim/raw/master/colors/universal-blue.vim', 'archive_name': 'universal-blue.vim', 'type': 'archive', 'script-type': 'color scheme'}

" tien le
let scmnr.3414 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/tienle/bocau'}, {'bocau.vim': 'colors'})

" Jiri Kratochvil
let scmnr.3399 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/klokane/vim-phpunit'}, {'phpunit.vim': 'plugin'})

" Daniel B
" The following plugins do not have a separate repository:
let scmnr.3140 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/dbb/vim'}, {'obsidian.vim': 'colors'})
let scmnr.3470 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/dbb/vim'}, {'tidydiff.vim': 'plugin'})
let scmnr.3693 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/dbb/vim'}, {'FixCSS.vim': 'plugin'})
let scmnr.3913 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/dbb/vim'}, {'CapsulaPigmentorum.vim': 'colors'})
let scm['plugins@dbb'] = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/dbb/vim'}, {'CapsulaPigmentorum.vim': 'colors', 'FixCSS.vim': 'plugin', 'tidydiff.vim': 'plugin', 'obsidian.vim': 'colors'})

" Steffen Siering
" The following plugin does not have a separate repository:
let scmnr.3034 = {'url': 'https://github.com/urso/dotrc/raw/master/vim/syntax/haskell.vim', 'archive_name': 'haskell.vim', 'type': 'archive', 'script-type': 'syntax'}

" C. Coutinho
let scmnr.3023 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/kikijump/tslime.vim'}, {'tslime.vim': 'plugin'})

" joseph wecker
let scmnr.2964 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/josephwecker/neutron.vim'}, {'neutron.vim': 'colors'})
let scm['murphytango'] = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/josephwecker/murphytango.vim'}, {'murphytango.vim': 'color scheme'})

" Einar Lielmanis
let scmnr.2469 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/einars/translit.vim'}, {'translit.vim': 'plugin'})

" Chris Gaffney
let scmnr.2466 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/gaffneyc/vim-cdargs'}, {'cdargs.vim': 'plugin'})

" Benjamin Hoffstein
let scmnr.2449 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/hoffstein/vim-tsql'}, {'sqlserver.vim': 'syntax'})

" Benjamin Esham
let scmnr.432 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/bdesham/biogoo'}, {'biogoo.vim': 'colors'})

" Hans Fugal
let scmnr.105 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/fugalh/desert.vim'}, {'desert.vim': 'colors'})

" Peter Hosey
let scmnr.2475 = vamkr#AddCopyHook({'type': 'git', 'url': 'https://bitbucket.org/boredzo/vim-ini-syntax'}, {'ini.vim': 'syntax'})

" Jochen Bartl
let scmnr.2479 = vamkr#AddCopyHook({'type': 'hg', 'url': 'https://bitbucket.org/lobo/grsecurityvim'}, {'grsecurity.vim': 'syntax'})

" Leandro Penz
let scmnr.808 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/lpenz/vimcommander'}, {'vimcommander.vim': 'plugin', 'vimcommander.txt': 'doc'})

" Anders Schau Knatten
let scmnr.3733 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/knatten/olga_key'}, {'olga_key.vim': 'syntax'})

" Jannis Pohlmann
let scmnr.2278 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://git.gezeiten.org/git/jptemplate'}, {'jptemplate.vim': 'plugin'})

" Dmitry Ermolov
let hook='execute "edit" fnameescape(%d."/Makefile") | %s@\V~/.vim@.@ | write! | execute "lcd" fnameescape(%d) | call mkdir("plugin") | call vam#utils#RunShell("make && make install") | lcd -'
let scmnr.3648 = {'type': 'git', 'url': 'git://github.com/9uMaH/autocpp', 'addon-info': {'post-install-hook': hook, 'post-scms-update-hook': substitute(hook, '\Vcall mkdir("plugin") | ', '', '')}}
unlet hook

" Jian Liang
let hook='execute "edit" fnameescape(%d."/install_linux_dev.sh") | %s@\V~/.vim@.@ | write! | execute "lcd" fnameescape(%d) | call mkdir("plugin") | call vam#utils#RunShell("sh ./install_linux_dev.sh") | lcd -'
let scmnr.4637 = {'type': 'git', 'url': 'https://code.google.com/p/symfind/', 'addon-info': {'post-install-hook': hook, 'post-scms-update-hook': substitute(hook, '\Vcall mkdir("plugin") | ', '', '')}}
unlet hook

" Idan Arye
let hook='execute "lcd" fnameescape(%d) | call vam#utils#RunShell("make") | lcd -'
let scmnr.4356 = {'type': 'git', 'url': 'git://github.com/Hackerpilot/Dscanner', 'addon-info': {'runtimepath': 'editors/vim', 'post-install-hook': hook, 'post-scms-update-hook': hook}}
unlet hook

" Jason Duell
let scmnr.51   = {'url': 'http://cscope.sourceforge.net/cscope_maps.vim', 'archive_name': 'cscope_maps.vim', 'type': 'archive', 'script-type': 'utility'}

"-----------------------------------------------------------------------------------------------------------------------

" Andrew Stewart
let scm['vim-gitgutter'] = {'type': 'git', 'url': 'git://github.com/airblade/vim-gitgutter'}

" Scott Bronson
let scm['vim-toggle-wrap'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-toggle-wrap'}
let scm['vim-visual-star-search'] = {'type': 'git', 'url': 'git://github.com/bronson/vim-visual-star-search'}

" Shrikant Sharat Kandula
let scm['t-syntax'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/t-syntax'}
" There is already another “gotofile” plugin on vim.org
let scm['gotofile@sharat87'] = {'type': 'hg', 'url': 'https://bitbucket.org/sharat87/vim-gotofile'}

" Drew Neil
let scm['vim-pml'] = {'type': 'git', 'url': 'git://github.com/nelstrom/vim-pml'}

" Alfredo Deza
let scm['coveragepy'] = {'type': 'git', 'url': 'git://github.com/alfredodeza/coveragepy.vim'}
let scm['konira'] = {'type': 'git', 'url': 'git://github.com/alfredodeza/konira.vim'}
let scm['khuno'] = {'type': 'git', 'url': 'git://github.com/alfredodeza/khuno.vim'}

" Magnus Woldrich
let scm['todo-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-todo'}
let scm['perldoc-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/perldoc.vim'}
let scm['irc-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/irc.vim'}
let scm['ratpoison-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-ratpoison'}
let scm['github-recent-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-github-recent'}
let scm['vidir-ls-syntax'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-syntax-vidir-ls'}
let scm['vim-extendedcolors'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-extendedcolors'}
let scm['vim-highlight-default-highlight-groups'] = {'type': 'git', 'url': 'git://github.com/trapd00r/vim-highlight-default-highlight-groups'}

" Wannes Meert
let scm['wmnusmv'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmnusmv.vim'}
let scm['wmnotes'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmnotes.vim'}
let scm['wmpycalc'] = {'type': 'git', 'url': 'git://github.com/wannesm/wmpycalc.vim'}

" Michael Smith
let scm['vim-colours-dark-lord'] = {'type': 'git', 'url': 'git://github.com/michaeljsmith/vim-colours-dark-lord'}
let scm['vimdbg'] = {'type': 'git', 'url': 'git://github.com/michaeljsmith/vimdbg', 'addon-info': {'runtimepath': 'src'}}

" teramako
let scm['jscomplete-vim'] = {'type': 'git', 'url': 'git://github.com/teramako/jscomplete-vim'}

" intuited - Ted
let scm['vim-vamoose'] = {'type': 'git', 'url': 'git://github.com/intuited/vim-vamoose'}
let scm['visdo'] = {'type': 'git', 'url': 'git://github.com/intuited/visdo'}

" beyondwords (github)
let scm['vim-twig'] = {'type': 'git', 'url': 'git://github.com/beyondwords/vim-twig'}

" Gunther Groenewege
let scm['vim-less'] = {'type': 'git', 'url': 'git://github.com/groenewege/vim-less'}

" Daniel Hofstetter
let scm['scss-syntax'] = {'type': 'git', 'url': 'git://github.com/cakebaker/scss-syntax.vim'}

" Barry Arthur
let scm['fanfingtastic'] = {'type': 'git', 'url': 'git://github.com/dahu/vim-fanfingtastic'}
let scm['VimLint'] = {'type': 'git', 'url': 'git://github.com/dahu/VimLint'}

" Brian Collins
let scm['vim-jst'] = {'type': 'git', 'url': 'git://github.com/briancollins/vim-jst'}

" Luke Randall
let scm['haskellmode-vim'] = {'type': 'git', 'url': 'git://github.com/lukerandall/haskellmode-vim'}

" Muraoka Taro
let scm['nyancat-vim'] = {'type': 'git', 'url': 'git://github.com/koron/nyancat-vim'}

" Matt Sacks
let scm['vim-complete'] = {'type': 'git', 'url': 'git://github.com/mattsacks/vim-complete'}

" Michael Foukarakis
let scm['robotframework-vim'] = {'type': 'git', 'url': 'git://github.com/mfukar/robotframework-vim'}

" Val Markovic
" installation instructions: https://github.com/Valloric/YouCompleteMe#full-installation-guide
let scm['YouCompleteMe'] = {'type': 'git', 'url': 'git://github.com/Valloric/YouCompleteMe'}

" zaiste
let scm['tmux'] = {'type': 'git', 'url': 'git://github.com/zaiste/tmux.vim'}

" tfnico
let scm['vim-gradle'] = {'type': 'git', 'url': 'git://github.com/tfnico/vim-gradle'}

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
let scm['unite-outline'] = {'type': 'git', 'url': 'git://github.com/h1mesuke/unite-outline', 'addon-info': {'dependencies': {'%3396': {}}}}
let scm['unicode-haskell'] = {'type': 'git', 'url': 'git://github.com/frerich/unicode-haskell'}
let scm['vim-makegreen'] = {'type': 'git', 'url': 'git://github.com/reinh/vim-makegreen'}
let scm['vim-scala@behaghel'] = {'type': 'git', 'url': 'git://github.com/behaghel/vim-scala'}
let scm['factor'] = {'type': 'git', 'url': 'git://github.com/slavapestov/factor', 'addon-info': {'runtimepath': 'misc/vim'}}
let scm['html-template-syntax'] = {'type': 'git', 'url': 'git://github.com/pbrisbin/html-template-syntax'}
let scm['opalang'] = {'type': 'git', 'url': 'git://github.com/MLstate/opalang', 'addon-info': {'runtimepath': 'tools/editors/vim'}}
let scm['SkyBison'] = {'type': 'git', 'url': 'git://github.com/paradigm/SkyBison'}
let scm['jedi-vim'] = {'type': 'git', 'url': 'git://github.com/davidhalter/jedi-vim'}
let scm['vim-css3-syntax'] = {'type': 'git', 'url': 'git://github.com/hail2u/vim-css3-syntax'}
let scm['neco-tweetvim'] = {'type': 'git', 'url': 'git://github.com/yomi322/neco-tweetvim'}
let scm['ctrlp-cmatcher'] = {'type': 'git', 'url': 'git://github.com/JazzCore/ctrlp-cmatcher', 'addon-info': {'dependencies': {'%3736': {}}}}
let scm['vim-plugin-viewdoc'] = {'type': 'git', 'url': 'git://github.com/powerman/vim-plugin-viewdoc'}
let scm['vim-qt-syntax'] = {'type': 'git', 'url': 'https://bitbucket.org/kh3phr3n/vim-qt-syntax'}
let scm['vim-textobj-space'] = {'type': 'git', 'url': 'git://github.com/saihoooooooo/vim-textobj-space'}
let scm['vim-textobj-underscore'] = {'type': 'git', 'url': 'git://github.com/lucapette/vim-textobj-underscore'}
let scm['vim-slime'] = {'type': 'git', 'url': 'git://github.com/jpalardy/vim-slime'}
let scm['vimbufsync'] = {'type': 'git', 'url': 'git://github.com/def-lkb/vimbufsync', 'addon-info': {'runtimepath': 'vim/merlin'}}
let scm['merlin'] = {'type': 'git', 'url': 'git://github.com/def-lkb/merlin', 'addon-info': {'runtimepath': 'vim/merlin', 'dependencies': {'vimbufsync': {}}}}
let scm['ocp-indent'] = {'type': 'git', 'url': 'git://github.com/OCamlPro/ocp-indent'}
let scm['pgnvim'] = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/Raimondi/pgnvim'}, {'pgn.vim': 'syntax'})

" Marius Gedminas
let scm['python-imports@mgedmin'] = {'type': 'git', 'url': 'git://github.com/mgedmin/python-imports.vim'}

" Meikel Brandmeyer
let scm['vim-clojure-static'] = {'type': 'git', 'url': 'git://github.com/guns/vim-clojure-static'}

" elixir-lang
let scm['vim-elixir'] = {'type': 'git', 'url': 'git://github.com/elixir-lang/vim-elixir'}

" Carlos Galdino
let scm['elixir-snippets'] = {'type': 'git', 'url': 'git://github.com/carlosgaldino/elixir-snippets'}

" Johannes Raggam - Tabline by: mkitt (Matthew Kitt)
let scm['tabline'] = {'type': 'git', 'url': 'git://github.com/mkitt/tabline.vim'}

" Tim Clem
let scm['vim-arduino'] = {'type': 'git', 'url': 'git://github.com/tclem/vim-arduino'}

" Jacobo de Vera
let scm['vim-opengrok-search'] = {'type': 'git', 'url': 'git://github.com/jdevera/vim-opengrok-search'}

" Justin M. Keyes
let scm['vim-sneak'] = {'type': 'git', 'url': 'git://github.com/justinmk/vim-sneak'}
let scm['vim-gtfo'] = {'type': 'git', 'url': 'git://github.com/justinmk/vim-gtfo'}

"-----------------------------------------------------------------------------------------------------------------------

" lei fw
" XXX This probably won’t normally update.
" let hook='execute "lcd" fnameescape(%d) | call mkdir("plugin") | call rename("ctags_cache", "plugin/ctags_cache") | call vam#utils#CopyFile("c_complete.vim", "plugin/c_complete.vim") | call vam#utils#CopyFile("c_complete.py", "plugin/c_complete.py")'
" let scmnr.3684 = {'type': 'git', 'url': 'git://github.com/abadcafe/ctags_cache', 'addon-info': {'post-install-hook': hook, 'post-scms-update-hook': substitute(hook, '\Vcall mkdir("plugin")', 'vam#utils#RmFR("plugin/ctags_cache")', '')}}
" unlet hook

" Amit Ranjit
" let hook='execute "lcd" fnameescape(%d) | call mkdir("plugin") | call rename("vimpy", "plugin/vimpy") | call vam#utils#CopyFile("vimpy.vim", "plugin/vimpy.vim")'
" let scmnr.3752 = {'type': 'git', 'url': 'git://github.com/amitdev/vimpy', 'addon-info': {'post-install-hook': hook, 'post-scms-update-hook': substitute(hook, '\Vcall mkdir("plugin")', 'vam#utils#RmFR("plugin/vimpy")', '')}}
" unlet hook

" Micah Elliott
" Following repository does not contain correct directory tree
" let scmnr.1365 = {'type': 'git', 'url': 'git://gist.github.com/720355'}

" Caleb Cushing
" Following repository does not contain correct directory tree
" let scmnr.2409 = {'type': 'git', 'url': 'git://github.com/xenoterracide/sql_iabbr'}

" Chris Yip
" Following repository does not contain correct directory tree
" let scmnr.3220 = {'type': 'git', 'url': 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'}

" Weakish Jiang
" let scm['rc'] = {'type': 'git', 'url': 'git://gist.github.com/986788'}

" Jevgeni Tarasov
" The following repository is referenced on vim.org, but not present on github:
" let scmnr.3570 = vamkr#AddCopyHook({'type': 'git', 'url': 'git://github.com/wolfsund/terse'}, {'terse.vim': 'plugin'})

" r: see vamkr#GetVim
let r=[scm, scmnr]
" vim: ft=vim ts=2 sts=2 sw=2 et fdm=marker fmr=▶,▲ tw=0 nowrap
