#!/usr/bin/env bash 

###################################################################################################
# Description:  This creates a local Github directory, downloads homebrew, downloads git, sets up
#               git credentials, and clones my dotfiles.
# Instructions: Navigate to https://github.com/Lianathanoj/dotfiles/setup/setup1.sh, download the
#               file, and run `bash setup1_mac.sh`. You'll need to intermittently type in certain
#               information such as password, Github credentials, etc. We need to do this in this
#               manner because some steps in setup2.sh require brew and git to be installed. This
#               script tries to be idempotent in that you can run it multiple times with the same
#               outcome.
###################################################################################################

# create Github directory if it doesn't already exist
GITHUB_DIR=$HOME/Github
mkdir -p $GITHUB_DIR

# download homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
grep -qF 'eval "$(/opt/homebrew/bin/brew shellenv)"' $HOME/.zprofile || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
grep -qF 'export PATH="/opt/homebrew/bin:$PATH"' $HOME/.zshrc || echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc 

# download git, set up credentials, and start ssh agent
brew install git
git config --global user.name "Jonathan Lian"
git config --global user.email jonathan.lian123@gmail.com
ssh-keygen -t ed25519 -C "jonathan.lian123@gmail.com"
eval "$(ssh-agent -s)"

# create ssh config file if it doesn't already exist
SSH_CONFIG=$HOME/.ssh/config
if test -f "$SSH_CONFIG" ; then
    echo "~/.ssh/config exists."
else
    echo "~/.ssh/config does not exist; creating ~/.ssh/config file."
    touch "$SSH_CONFIG"
fi

# add ssh key to agent and store passphrase in keychain
# POTENTIAL TODO: add steps for grepping ~/.ssh/id_ABC if id_ed25519 is not generated
grep -qF '~/.ssh/id_ed25519' ~/.ssh/config || echo -e 'Host *\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/id_ed25519' >> ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo -e '\nYou will now need to add the SSH key to your Github account. Follow the instructions at https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account\n'
read -p 'Press any key to continue once you have added the SSH key to your Github account.' -n1 -s

# clone my dotfiles repo into the local Github directory
git clone git@github.com:Lianathanoj/dotfiles.git $GITHUB_DIR/dotfiles

bash $GITHUB_DIR/dotfiles/setup/setup2.sh
