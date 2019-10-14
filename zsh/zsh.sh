# theme
ZSH_THEME="robbyrussell"
 
# plugins
plugins=(git)
plugins=(zsh-autosuggestions)
plugins=(zsh-syntax-highlighting)

# vi-mode
bindkey -v
export KEYTIMEOUT=1

# alias vim to neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# list files on directory change
chpwd() ls

# exports
export ZSH="$HOME/.oh-my-zsh"
export NVIM_CONFIG="$HOME/dotfiles/init.vim"

# source bash files
source $ZSH/oh-my-zsh.sh
source ~/dotfiles/zsh/work_zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
