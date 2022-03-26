#!/usr/bin/env bash

git clone --separate-git-dir=$HOME/.myconf https://github.com/mio-me/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .

# git
#git config --global commit.gpgsign false
#git config --global tag.gpgsign false

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim 'PlugInstall --sync' +qa

# reset
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME remote set-url origin git@github.com:thorbenbelow/dotfiles.git
