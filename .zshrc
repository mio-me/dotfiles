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

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
alias pi="sudo pacman -S"
alias up="docker-compose up"
alias down="docker-compose down"
alias cat="bat -n"
alias ls="exa"
alias la="exa --long --all"
alias vi="nvim"
alias o="xdg-open"
