# Setup guide

## Update
```Bash
pacman -Syu
```
## yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

## Base
```Bash
yay -S google-chrome \
	kitty \
	neovim \
	exa \
	bat \
	xclip \
	nerd-fonts-complete
```

## Generate ssh-key
```Bash
ssh-keygen -t ecdsa -b 521
xclip -sel c < ~/.ssh/id_ecdsa.pub
```

## snapd
```Bash
yay -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

## docker
```Bash
yay -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
```

## Extended
```Bash
yay -S spotify \
	visual-studio-code-bin \
	zoom \
	discord \
	timeshift
sudo snap install intellij-idea-ultimate --classic
sudo snap install pycharm-professional --classic
sudo snap install datagrip --classic
```

## git
```Bash
git config --global user.name <name>
git config --global user.email <mail> 
git config --global core.editor "nvim"
git config --global pull.rebase true
git config --global rebase.autoStash true
```

## Dotfiles
```Bash
git clone --separate-git-dir=$HOME/.myconf git@gitlab.com:thorbenbelow/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
```

## Windows fonts
```Bash
mkdir /usr/share/fonts/WindowsFonts
cp /windows/Windows/Fonts/* /usr/share/fonts/WindowsFonts/
chmod 644 /usr/share/fonts/WindowsFonts/*
fc-cache --force
```
