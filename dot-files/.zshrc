# for homebrew
export PATH="/usr/local/sbin:$PATH"

# go path
export GOPATH=$HOME/Go

export UPDATE_ZSH_DAYS=1
export ZSH="/Users/Zeshan/.oh-my-zsh"

COMPLETION_WAITING_DOTS="true"
HYPHEN_INSENSITIVE="true"
ZSH_THEME="robbyrussell"

plugins=(
  fasd
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

export JAVA_8_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home'
export JAVA_11_HOME='/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home'

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

java11
