export ZSH="/home/thorben/.oh-my-zsh"

ZSH_THEME="afowler"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='mvim'


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
#alias chrome="chromium &"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thorben/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thorben/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/thorben/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thorben/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

