# zsh variables
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue,bold"
ZSH_AUTOSUGGEST_USE_ASYNC=true

# plugins
plugins=(
    alias-tips
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# map <Ctrl-space> to accept autosuggestions
bindkey '^ ' autosuggest-accept

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
export NVIM_CONFIG="$HOME/Github/dotfiles/init.vim"

# source bash files
source $ZSH/oh-my-zsh.sh
source ~/Github/dotfiles/zsh/work_zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# custom source function
function source-all() {
    source $HOME/.zshrc
    tmux source-file $HOME/.tmux.conf
}
alias sa=source-all

# remap <Ctrl-f> and <Ctrl-g> to use fzf; requires ~/.fzf.zsh to be sourced
 bindkey '^F' fzf-history-widget
 bindkey '^G' fzf-file-widget

 # add pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

PROMPT='%{$fg[yellow]%}[%D{%T}] '$PROMPT
