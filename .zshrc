# alias vim to neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# list files on directory change
chpwd() ls -a

# theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(git)
plugins=(zsh-autosuggestions)
plugins=(zsh-syntax-highlighting)

# exports
export ZSH="/Users/jon/.oh-my-zsh"
export NVIM_CONFIG=$HOME/dotfiles/init.vim

# source bash files
source $ZSH/oh-my-zsh.sh
source ~/dotfiles/work_zshrc.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# goes up one directory
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# vi-mode
bindkey -v
export KEYTIMEOUT=1
