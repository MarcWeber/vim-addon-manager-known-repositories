#!/bin/zsh
set -x
VAMKRREP=ssh://git@github.com/MarcWeber/vim-addon-manager-known-repositories
VAMKRDIR=~/tmp/vam-kr
VAMKR_SAFE_REPO=~/.vam/vim-addon-manager-known-repositories

GIT=/usr/bin/git
PYTHON=/usr/bin/python
PERL=/usr/bin/perl
CURL=/usr/bin/curl
RM=/bin/rm

if ! test -d $VAMKRDIR ; then
    test -d $VAMKRDIR:h || /bin/mkdir -p $VAMKRDIR:h || exit 1
    $GIT clone $VAMKRREP $VAMKRDIR || exit 2
    cd $VAMKRDIR || exit 3
else
    cd $VAMKRDIR || exit 3
    $GIT pull
fi
$GIT checkout -f master || exit 4
$CURL -o script-info.json http://www.vim.org/script-info.php
if ! $PERL $VAMKR_SAFE_REPO/perl/www_vim_org.pl --verbose
then
    $RM script-info.json
    $GIT reset --hard HEAD
    exit 1
fi
if ! $PYTHON -O $VAMKR_SAFE_REPO/python/autoget.py -20
then
    $RM script-info.json
    $GIT reset --hard HEAD
    exit 1
fi
$RM script-info.json
if $GIT commit ./db -m "Cron job update" ; then
    $GIT push
fi
