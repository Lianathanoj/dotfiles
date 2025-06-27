if exists('g:vscode')
  " VSCode extension
  source $HOME/.config/nvim/vscode_settings.vim
else
  " ordinary neovim
  source $HOME/.config/nvim/default_settings.vim
endif
