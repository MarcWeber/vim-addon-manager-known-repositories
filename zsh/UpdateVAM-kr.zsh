#!/bin/zsh
set -x
VIMPIREP=ssh://git@bitbucket.org/vimcommunity/vim-pi
VAMKRREP=ssh://git@github.com/MarcWeber/vim-addon-manager-known-repositories
VIMPIDIR=~/tmp/vim-pi
VIMPI_SAFE_REPO=~/.vam/vim-pi

GIT=/usr/bin/git
PYTHON=/usr/bin/python
PERL=/usr/bin/perl
CURL=/usr/bin/curl
RM=/bin/rm

if ! test -d $VIMPIDIR ; then
    test -d $VIMPIDIR:h || /bin/mkdir -p $VIMPIDIR:h || exit 1
    $GIT clone $VIMPIREP $VIMPIDIR || exit 2
    cd $VIMPIDIR || exit 3
else
    cd $VIMPIDIR || exit 3
    $GIT pull
fi
$GIT checkout -f master || exit 4
$CURL -o script-info.json http://www.vim.org/script-info.php
if ! $PERL $VIMPI_SAFE_REPO/perl/www_vim_org.pl --verbose
then
    $RM script-info.json
    $GIT reset --hard HEAD
    exit 1
fi
if ! $PYTHON -O $VIMPI_SAFE_REPO/python/autoget.py new
then
    $RM script-info.json
    $GIT reset --hard HEAD
    exit 1
fi
$RM script-info.json

function safe_push()
{
    # By the time we are trying to push new changes may have added
    integer ATTEMPTS=5
    while ! $GIT push $@ && (( ATTEMPTS-- )) ; do
        if ! $GIT pull $@
            return 1
        fi
    done
    (( ATTEMPTS == -1 ))
    return $?
}

if $GIT commit ./db -m "Cron job update" ; then
    if safe_push ; then
        # VAM-kr is a mirror now. Do not try too hard: 5 attempts or any merge 
        # conflict and “push -f”.
        safe_push $VAMKRREP || \
            $GIT push -f $VAMKRREP
    fi
fi
