call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'justinmk/vim-sneak'
call plug#end()

filetype plugin on

" remap leader
let mapleader = "\<Space>"

" set timeout to reduce visual mode remaps
set timeoutlen=300

" sneak mappings
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" general mappings but are redefined in the vscode_settings.json file for
" vscode-specific operations
nnoremap oo o<Esc>
nnoremap OO O<Esc>
nnoremap <leader>dd "_dd
inoremap jj <Esc>`^
inoremap JJ <Esc>`^

" mapping to reselect and re-yank any text pasted in visual mode
xnoremap p pgvy

" mappings for setting indentation
nnoremap t2 :set tabstop=2 shiftwidth=2 expandtab<CR>
nnoremap t4 :set tabstop=4 shiftwidth=4 expandtab<CR>

" mappings for centering search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" mappings for scrolling up and down quickly
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

" mapping for yanking file name to register
nnoremap cp :let @* = expand("%:p")<CR>

" mapping for repeating the last macro
nnoremap , @@

" share clipboard between terminals
set clipboard+=unnamedplus

" return to same line number of recently-closed file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\" zz" | endif
endif

" highlighting options
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" trigger autoread
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

" appearance
set scrolloff=15
set tabstop=2 shiftwidth=2 expandtab
set hlsearch
set ruler
set number
set ignorecase
set smartcase
set cursorline
set number relativenumber
set nu rnu
set nofixendofline

" open new split panes to the bottom right
set splitbelow
set splitright

" automatically source config on save
autocmd! bufwritepost $NVIM_CONFIG source $NVIM_CONFIG 
