#!/bin/bash

source ./colors.sh

# add any new brews to this list
brews=( \
    cloudfoundry/tap/cf-cli \
    docker-machine \
    gradle \
    jq \
    maven \
    sbt \
    vault \
)

# add any new casks to this list
casks=( \
    dbeaver-community \
    docker \
    intellij-idea-ce \
    iterm2 \
    p4v \
    postman \
    sourcetree \
)

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
&& successfully_installed "homebrew"

brew_install() {
    local app=${1}
    local cask=${2:-""}
    local app_name=$(echo ${app} | awk '{print $NF}' FS=/ | sed 's/-/ /g')

    brew install ${cask} ${app} \
    && successfully_installed "${app_name}"
}

for app in ${casks[@]}; do
    brew_install ${app} "--cask"
done

for app in ${brews[@]}; do
    brew_install ${app}
done
