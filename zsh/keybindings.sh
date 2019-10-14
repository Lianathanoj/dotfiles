# goes up one directory
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# goes to previous directory 
function previous_widget() {
    BUFFER="cd -"
    zle accept-line
}
zle -N previous_widget
bindkey "^j" previous_widget

# goes to home directory 
function home_widget() {
    BUFFER="cd"
    zle accept-line
}
zle -N home_widget
bindkey "^h" home_widget
