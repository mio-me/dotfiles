export ZSH="/home/thorben/.oh-my-zsh"

ZSH_THEME="afowler"
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='nvim'

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Config
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias awesomeconfig="code ~/.config/awesome"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
alias pkglist="nvim ~/.myconf/init/pkg.txt"

# Files and directories
alias dev="cd ~/dev"
alias cat="bat -n"
alias copy="xclip -sel c"
alias ls="exa"
alias la="exa --long --all"
alias o="xdg-open"

# Misc
alias pi="sudo pacman -S"
alias py="python"
alias vi="nvim"
alias aspire="ssh thorben@192.168.0.103"
alias battery="acpi -b"

# Git
export GPG_TTY=$(tty)
function gitid() {
	f=$(gpg --list-secret-keys --keyid-format=long $1)
	[[ $f =~ '^sec +rsa4096\/(\w+) ' ]]
	key=$match[1]
	git config user.email $1
	git config user.signingkey $match[1]
	echo "Git Email: " $1
	echo "Git Signingkey: " $key
}
alias gm="git commit -m"

# kube
alias k="kubectl"

# Docker
alias d="docker"
alias dcu="docker compose up"
alias dcd="docker compose down"

# Terraform
alias ti="terraform init"
alias tiu="terraform init -upgrade"
alias tp="terraform plan"
alias tpp="terraform plan -out planned"
alias ta="terraform apply"
alias tap="terraform apply planned"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
