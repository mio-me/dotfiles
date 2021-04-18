# Setup guide

## Dotfiles
```Bash
git clone --separate-git-dir=$HOME/.myconf git@gitlab.com:thorbenbelow/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
```

## Setup
```Bash
chmod 777 ~/.myconf/init.sh
~/.myconf/init.sh
```

## Fonts
```Bash
mkdir /usr/share/fonts/<name>
cp /path/to/fonts/* /usr/share/fonts/<name>/
chmod 644 /usr/share/fonts/<name>/*
fc-cache --force
```

## gdrive
```Bash
yay -S drive-bin
drive init ~/gdrive
```
