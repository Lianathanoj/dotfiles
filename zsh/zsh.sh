# theme
ZSH_THEME="robbyrussell"
 
# plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

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

# remap <Ctrl-f> and <Ctrl-g> to use fzf; requires ~/.fzf.zsh to be sourced
 bindkey '^F' fzf-history-widget
 bindkey '^G' fzf-file-widget
