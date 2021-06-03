# Setup guide

## Dotfiles
```Bash
git clone --branch min --separate-git-dir=$HOME/.myconf https://github.com/thorbenbelow/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .
```

## Setup
```Bash
chmod 777 ~/.myconf/init.sh
~/.myconf/init.sh
```
