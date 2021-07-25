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

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias awesomeconfig="code ~/.config/awesome"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
alias pi="sudo pacman -S"
alias up="docker-compose up"
alias down="docker-compose down"
alias py="python"
alias cat="bat -n"
alias ls="exa"
alias la="exa --long --all"
alias vi="nvim"
alias o="xdg-open"
alias dev="cd ~/dev"
alias aspire="ssh thorben@192.168.0.103"
alias d="docker"
alias k="kubectl"
alias battery="acpi -b"
alias copy="xclip -sel c"
