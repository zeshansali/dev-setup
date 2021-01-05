# generate ssh key for new device
# todo: get private key name from first command or pass
#      in as command line param
ssh-keygen -t ed25519 -C "email-address"
eval "$(ssh-agent -s)"
ssh-add -K "~/.ssh/id_e25519"

# install command line tools
# todo: there may be some errors that need to be ironed out here
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install tech
brew install git
brew install git-gui
brew install postgresql
brew install tmux
brew install --cask docker
brew install docker-compose

# node
brew install nvm
export NVM_DIR="~/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
nvm install node

# install sdks
curl -s "https://get.sdkman.io" | bash
sdk i java 8.0.275.j9-adpt # may be missing 
sdk i java 11.0.9.j9-adpt
n # don't set to default
sdk i scala 2.13.4
sdk u scala 2.13.4

# clone dev-setup
git clone git@github.com:zeshansali/dev-setup.git ~/setup

# install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# setup dot file symlinks
dotFiles=(.zshrc .vimrc .gitconfig .gitignore)
for dotFile in ${dotFiles[@]}; do
  rm $dotFile
  ln -s ~/setup/dot-files/$dotFile ~/$dotFile
done
