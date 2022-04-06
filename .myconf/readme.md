# Setup guide

## Dotfiles
### Dependencies
- curl
- git
- zsh
- vim

```Bash
curl https://raw.githubusercontent.com/thorbenbelow/dotfiles/main/script/bootstrap.sh | sh
```
## Install basic software
Replace `yay` with correct package manager
```Bash
yay -S $(curl https://raw.githubusercontent.com/thorbenbelow/dotfiles/main/.myconf/base.txt | tr '\n' ' ')
```

## Debian unstable
Add to `/etc/apt/sources.list`
```
deb http://deb.debian.org/debian unstable main
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

## awesome
```Bash
pacman -S xorg-server awesome nitrogen picom
localectl set-x11-keymap de
```
