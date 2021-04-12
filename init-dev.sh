# TODO: use flags for the various install steps in this script
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install tech
brew install coreutils
brew install git
brew install git-gui
brew install postgresql
brew install tmux
brew install --cask docker
brew install docker-compose
brew install --cask iterm2

# install sdks
curl -s "https://get.sdkman.io" | bash
source "~/.sdkman/bin/sdkman-init.sh"
sdk i java 8.0.275.j9-adpt
sdk i java 11.0.9.j9-adpt
n # don't set to default
sdk i scala 2.13.4
sdk u scala 2.13.4

# install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# download zsh plugins
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# setup dot file symlinks
dotFiles=(.zshrc .vimrc .gitconfig .gitignore)
for dotFile in ${dotFiles[@]}; do
  rm ~/$dotFile
  ln -s ~/dev/setup/dot-files/$dotFile ~/$dotFile
done
