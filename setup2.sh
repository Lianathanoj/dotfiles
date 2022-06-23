#!/usr/bin/env bash

################################################################################################
# Description:  This bootstraps and configures my dev environment preferences.
# Instructions: This script is automatically ran at the end of setup1.sh's completion and
#               references local dotfiles pulled from Github.
################################################################################################

GITHUB_DIR=$HOME/Github

# download zsh and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# download tmux
brew install tmux

# download Python build dependencies
brew install openssl readline sqlite3 xz zlib tcl-tk

# download pyenv
brew install pyenv
grep -qF 'export PYENV_ROOT="$HOME/.pyenv"' $HOME/.zshrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.zshrc
grep -qF 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' $HOME/.zshrc || echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.zshrc
grep -qF 'eval "$(pyenv init -)"' $HOME/.zshrc || echo 'eval "$(pyenv init -)"' >> $HOME/.zshrc

# download pyenv-virtualenv
brew install pyenv-virtualenv
grep -qF 'eval "$(pyenv virtualenv-init -)"' $HOME/.zshrc || echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.zshrc
exec "$SHELL"

# create virtualenv for Python versions 2 and 3 used with pyenv
pyenv install 2.7.18
pyenv install 3.8.13
pyenv virtualenv 2.7.18 python2
pyenv virtualenv 3.8.13 python3
pyenv global python3 python2

# download prerequisites for neovim deoplete (autocompletion)
pip3 install pynvim

# download neovim, fzf, ripgrep, and vim-plug as prerequisites
brew install neovim fzf ripgrep
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# create neovim init file if it doesn't exist
cat $GITHUB_DIR/dotfiles/init.vim > $HOME/.config/nvim/init.vim

# source neovim preferences and run PlugInstall non-interactively to install vim plugins
mkdir -p $HOME/.config/nvim/plugged
nvim +source +qa
nvim --headless +PlugInstall +qa
nvim +UpdateRemotePlugins +qa

# copy tmux preferences to be auto-sourced on new session
cat $GITHUB_DIR/dotfiles/.tmux.conf > $HOME/.tmux.conf

# download zsh plugins then source zsh preferences
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/zsh-syntax-highlighting
grep -qF "source '$GITHUB_DIR'/dotfiles/zsh/zsh.sh" $HOME/.zshrc || echo "source '$GITHUB_DIR'/dotfiles/zsh/zsh.sh" >> $HOME/.zshrc
