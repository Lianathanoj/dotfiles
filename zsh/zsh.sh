GITHUB_DIR="$HOME/Github"

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
export NVIM_CONFIG="$HOME/Github/dotfiles/nvim/init.vim"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/'"

# source zsh files
source $ZSH/oh-my-zsh.sh
[ -f ~/Github/dotfiles/zsh/work_zsh.sh ] && source ~/Github/dotfiles/zsh/work_zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# custom source function which propagates dotfiles to needed locations
function source-all() {
    cat $GITHUB_DIR/dotfiles/nvim/default_settings.vim > $HOME/.config/nvim/default_settings.vim
    cat $GITHUB_DIR/dotfiles/nvim/vscode_settings.vim > $HOME/.config/nvim/vscode_settings.vim
    cat $GITHUB_DIR/dotfiles/nvim/init.vim > $HOME/.config/nvim/init.vim
    cat $GITHUB_DIR/dotfiles/.tmux.conf > $HOME/.tmux.conf
    source $HOME/.zshrc
    source ~/.zprofile
    tmux source-file $HOME/.tmux.conf
    nvim +source +qa
    nvim --headless +PlugInstall +qa
    nvim +UpdateRemotePlugins +qa
}
alias sa=source-all

# remap <Ctrl-f> and <Ctrl-g> to use fzf; requires ~/.fzf.zsh to be sourced
 bindkey '^F' fzf-history-widget
 bindkey '^G' fzf-file-widget

# have prompt show timestamp, user, and host. we use different colors for differentiating
# between our local environment and cloud VM
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PROMPT='%{$fg[red]%}$USER@%{$fg[red]%}%M %{$fg[yellow]%}[%D{%T}] ${ret_status}'$PROMPT
else
    PROMPT='%{$fg[green]%}$USER@%{$fg[green]%}%M %{$fg[yellow]%}[%D{%T}] ${ret_status}'$PROMPT
fi
