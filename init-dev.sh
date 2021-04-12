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
brew install --cask rectangle

# install sdkman and set java/scala sdks
curl -s "https://get.sdkman.io" | bash
source "~/.sdkman/bin/sdkman-init.sh"
export JAVA_8_VERSION=$(sdk ls java | grep "8.*.j9-adpt" | awk '{ print $NF }')
export JAVA_11_VERSION=$(sdk ls java | grep "11.*.j9-adpt" | awk '{ print $NF }')
sdk i java $JAVA_8_VERSION
sdk i java $JAVA_11_VERSION
sdk u $JAVA_8_VERSION
sdk i scala

# install nvm and set node version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node

# install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# setup dot file symlinks
dotFiles=(.zshrc .vimrc .gitconfig .gitignore)
for dotFile in ${dotFiles[@]}; do
  rm ~/$dotFile
  ln -s ~/dev/setup/dot-files/$dotFile ~/$dotFile
done
