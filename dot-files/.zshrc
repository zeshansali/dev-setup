#################################
#                               #
#          ZSH CONFIGS          #
#                               #
#################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages colorize copydir copyfile cp
  fasd git osx tmux tmuxinator vundle z
)

source $ZSH/oh-my-zsh.sh

####################################
#                                  #
#          CUSTOM COMFIGS          #
#                                  #
####################################

unsetopt correct_all

######
# GO #
######

export GOPATH=$HOME/Go

#######
# SBT #
#######

export SBT_CREDENTIALS="~/.ivy2/.credentials"
export SBT_OPTS="-Dsbt.override.build.repos=true"

###########
# ALIASES #
###########

# kill and remove all docker containers
alias dreset="docker kill $(docker ps -q); docker rm $(docker ps -a -q)"

# kill all ssh-tunnels
alias ssh-reset="kill $(lsof -i -n -P | grep TCP | GREP ssh | awk "{print $2}" | uniq)"

##########
# PYTHON #
##########

# this is to download dependencies from pypi?
alias python-install="pip3 install --trusted-host pypi.org --trusted-host files.pythonhosted.org $1"

# necessary for pyenv to work?
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

########
# NODE #
########

export NVM_DIR=~/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

##################
# ZSH PERF UTILS #
##################

# time zsh start-up
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

##########
# SDKMAN #
##########

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"
