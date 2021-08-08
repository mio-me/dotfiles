#!/usr/bin/env bash

git clone --separate-git-dir=$HOME/.myconf https://github.com/thorbenbelow/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .


# update
echo "Updating system..."
sudo pacman -Syu
echo "Finished Updating."

# create folder structure
mkdir -p $HOME/dev/uni
mkdir -p $HOME/dev/private
mkdir -p $HOME/dev/work
mkdir -p $HOME/dev/nag


# yay
if [[ ! -d "$HOME/yay" ]]; then
	echo "Installing yay..."
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd $HOME
	echo "yay succesfully installed."
else
	echo "yay is already installed."
fi

# git
echo "Setting up Git. Please follow the instructions:"
read -p "Git: Enter name: " name
read -p "Git: Enter mail: " mail
git config --global user.name "$name"
git config --global user.email "$mail"
git config --global core.editor "nvim"
git config --global pull.rebase true
git config --global rebase.autoStash true
echo "Git configured succesfully."

# base
echo "Installing base packages..."
yay -S --nodiffmenu --noeditmenu --noupgrademenu bat \
	kitty \
	neovim \
	exa \
	xclip \
	google-chrome
echo "Installation succesfull."

# oh-my-zsh
echo "Setting up zsh"
yay -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
config checkout .
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



# Generate ssh-key
read -p "Create new ssh-key? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	echo "Creating new ssh-key..."
	ssh-keygen -t ecdsa -b 521 -N '' -f ~/.ssh/id_ecdsa <<<y 2>&1 >/dev/null
	xclip -sel c < ~/.ssh/id_ecdsa.pub
	echo "Public key copied to clipboard."
else
	echo "Skipped creating ssh-key."
fi

# snap
read -p "Install snapd? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	if [[ ! -d "$HOME/snap" ]]; then
		echo "Installing snapd..."
		yay -S --nodiffmenu --noeditmenu --noupgrademenu snapd
		sudo systemctl enable --now snapd.socket
		sudo ln -s /var/lib/snapd/snap /snap
		echo "snapd installed succesfully."
	else
		echo "snapd is already installed."
	fi
else
	echo "Skipped installing snapd"
fi

# extended
read -p "Install extended? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	echo "Installing extended..."
	yay -S --nodiffmenu --noeditmenu --noupgrademenu --removemake --cleanafter spotify \
		zoom \
		nerd-fonts-complete \
		discord \
		timeshift \
		visual-studio-code-bin \
		npm \
		python-pip \
		obs-studio
	sudo snap install intellij-idea-ultimate --classic
	sudo snap install pycharm-professional --classic
	sudo snap install datagrip --classic
	echo "Finished installing extended."
else
	echo "Skipped installing extended."
fi

# docker
read -p "Install docker? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	echo "Installing docker..."
	yay -S --nodiffmenu --noeditmenu --noupgrademenu docker
	sudo systemctl start docker.service
	sudo systemctl enable docker.service
	echo "Finished installing docker."
else
	echo "Skipped installing docker."
fi

echo "Finished setup."
