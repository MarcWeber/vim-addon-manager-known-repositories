# DEPRECATION WARNING

**[VAM-KR][1] REPOSITORY IS NOW A MIRROR OF [VIM-PI][2]. YOU SHOULD POST ALL 
ISSUES AND PULL REQUESTS TO THE LATTER. ANY CHANGES TO THIS REPOSITORY RESULTING
IN A MERGE CONFLICT WITH UPSTREAM WILL BE DELETED BY A CRON JOB.**

[1]: https://github.com/MarcWeber/vim-addon-manager-known-repositories
[2]: https://bitbucket.org/vimcommunity/vim-pi

## VIM-PI (vim plugin index) (previously vim-addon-manager-known-repositories)

ZyX, Marc, Shougo are discussing how to move this all to the next level so that
all
- plugin manager (VAM, NeoBundle, PyPi etc)
- users
- distribution systems (Gentoo Portag, Nix, npackd)

can benefit the most.

### discussions going on:

#### discussion 1)
http://vim-wiki.mawercer.de/wiki/topic/vim%20plugin%20managment.html (bottom,
which hooks do we need, how to compile supporting tools, how declare dependencies)

#### discussion 2)

More discussions:
Some additional discussions are taking place at vim-pi's [bitbucket issue 
tracker](https://bitbucket.org/vimcommunity/vim-pi/issues).

- API, move contents to database having a online store ?: 
  https://bitbucket.org/vimcommunity/vim-pi/issue/80


## Older vim-addon-manager-known-repository README contents:

This repository is an extension to http://github.com/MarcWeber/vim-addon-manager

It is the "default source" of descriptions where to get which addons for vim-addon-manager.

Have a look at all supported plugins online: http://mawercer.de/~marc/vam/index.php

For speed reasons vam#install#LoadKnownRepos() is used to load the repo as needed only.

As VAM this repository is mantainained by ZyX and Marc Weber

Contributing:

- Contribute to db/scmsources.vim which contains all the git,svn,mercurial,..
  sources

db/vimorgsources.json contains a dump from www.vim.org which is generated automatically.
The default implementation merges both prefering the source control ones

Issues which may cause us to immediately remove plugins†:

- security issues or other similar sever issues (didn't happen yet)

Issues which may cause us to deprecate plugins, which means they can be
installed but a warning will be shown†:

- there are other plugins doing the same, but better - unless the less useful 
  plugins are a significant simpler and people indiciate that
    they are still using it.

- a plugin is obviously broken in a way so that its causing more harm than 
  value.

† If in doubt create a github ticket and let's discuss the issue.

### BUGS:

  There are two plugins: one called align an done called Align. This will cause
  trouble on Windows !
