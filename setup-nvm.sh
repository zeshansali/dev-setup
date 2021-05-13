#!/bin/bash

source ./colors.sh

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
&& source ~/.nvm/nvm.sh \
&& successfully_installed "nvm"

# set node version
nvm install node \
&& successfully_installed "node"
