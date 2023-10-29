#############################################
#  Cale's Motherfuckin' Zshell Config File  #
#############################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vi"

# Theme
ZSH_THEME="charms2"

# Plugins
plugins=(git)

# Source
source $ZSH/oh-my-zsh.sh

# Aliases
alias cd="pushd"
alias pd="popd"
alias ds="dirs -v"
alias ls="ls -ac"

# Apps
alias v="nvim"
alias vi="vim"
alias vif= "vim \$(fzf)"
alias mk="minikube"
alias top="gotop -pa"

# Bin for personal commands
export PATH="~/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Maven
alias mt="mvn test"
alias md="mvn detekt:check -Ddetekt.config=detekt-asd.yml"
alias mtad="mvn test && mvn detekt:check -Ddetekt.config=detekt-asd.yml"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_281.jdk/Contents/Home"

# Python
alias p=python
alias j=jupyter
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias md="markdown_py"

PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"

# silver-lion commands
#export ELASTIC_APM_INSTRUMENT="false"

# . file paths
ZRC="$HOME/.zshrc"
VRC="$HOME/.vimrc"

# [ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Oracle Instant Client
export ORACLE_HOME="$HOME/instantclient_19_8"
export OCI_DIR="$HOME/instantclient_19_8"
export PATH="$ORACLE_HOME:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

