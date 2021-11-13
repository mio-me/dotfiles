#!/bin/bash

# apt
echo "deb http://deb.debian.org/debian unstable main" >> /etc/apt/sources.list

# Base
apt update -y
cat $HOME/.myconf/base.txt | tr '\n' ' ' | apt install -y

# git
git config --global gpg.sign false

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim 'PlugInstall --sync' +qa

# reset
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME remote set-url origin git@github.com:thorbenbelow/dotfiles.git