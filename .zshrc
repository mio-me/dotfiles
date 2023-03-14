export ZSH="$HOME/.oh-my-zsh"

RPI=192.168.0.2

ZSH_THEME="robbyrussell"
# Good themes: robbyrussell afowler af-magic dieter
HIST_STAMPS="yyyy-mm-dd"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Go Lang
export PATH=$PATH:/usr/local/go/bin
# Jetbrains ide's
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# Python packages
export PATH="$(python3 -m site --user-base)/bin:$PATH"
# Mozilla contributor tools
export PATH="/home/thorben/.mozbuild/git-cinnabar:$PATH"

source $ZSH/oh-my-zsh.sh

# Env
export LANG=en_US.UTF-8
export EDITOR='nvim'

function loadenv() {
if [ -f $1 ]; then
  export $(cat $1 | sed 's/#.*//g' | xargs)
fi
}

if [ -f ~/.zsh/completions/_zsh ]; then
    source ~/.zsh/completions/_zsh
fi

# Zoxide
eval "$(zoxide init zsh)"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Config
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias ohmyzsh="code ~/.oh-my-zsh"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias awesomeconfig="code ~/.config/awesome"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
alias pkglist="nvim ~/.myconf/init/pkg.txt"
alias o="xdg-open"

# Files and directories
alias bat="batcat"
alias cat="bat -n"
alias copy="xclip -sel c"
alias lvim="$HOME/.local/bin/lvim"
alias hx="$HOME/.local/bin/hx"


if command -v exa &> /dev/null
then
  alias ls="exa"
  alias l="exa --long --all"
  alias la="exa --long --all"
  alias ll="clear && la"
fi

# Terraform
if command -v terraform &> /dev/null
then
  alias ti="terraform init"
  alias tiu="terraform init -upgrade"
  alias tp="terraform plan"
  alias tpp="terraform plan -out planned"
  alias ta="terraform apply"
  alias tap="terraform apply planned"
fi

# Google
GOOGLE_DIR="$HOME/dev/google"
export PATH=$PATH:$GOOGLE_DIR/depot_tools
alias d8="$GOOGLE_DIR/v8/out/x64.optdebug/d8"


# WSL
if  [[ $(uname -r) == *WSL2 ]]
then
  alias exp="explorer.exe"
  alias rmident="find . -name '*:Zone.Identifier' -type f -delete"
fi

# Misc
alias pi="sudo pacman -S"
alias py="python3"
alias vi="nvim"
alias aspire="ssh thorben@192.168.0.103"

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
if command -v kubectl &> /dev/null
then
  alias km="kubectl --kubeconfig ~/dev/pv/kube/k3s/k3s.yaml"
  alias k="kubectl"
  alias kustom="kubectl apply -k"
fi

# Docker
if command -v docker &> /dev/null
then
  alias d="docker"
  alias dcu="docker compose up"
  alias dcd="docker compose down"
  alias docker-compose="docker compose"
  alias pidocker="DOCKER_HOST=ssh://pi@$RPI docker"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
