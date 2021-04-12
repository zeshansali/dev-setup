# NOTE: update permissions before running this script,
#
# chmod 744 ~/path/to/script

while getopts e: flag; do
  case "${flag}" in
    e) email=${OPTARG};;
  esac
done

# create base ssh config
gen_ssh_config() {
  cat > ~/.ssh/config <<EOL
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOL
}

# generate ssh key and add to ssh agent
gen_ssh_key() {
  ssh-keygen -t ed25519 -C $email
  eval "$(ssh-agent -s)"
  gen_ssh_config
  ssh-add -K "~/.ssh/id_e25519"
}

init_dev_env() {
  git clone git@github.com:zeshansali/dev-setup.git ~/setup
  chmod 744 ~/setup/init-dev.sh
  ~/setup/init-dev.sh
}

gen_ssh_key
xcode-select --install
init_dev_env
