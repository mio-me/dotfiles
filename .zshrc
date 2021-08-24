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
