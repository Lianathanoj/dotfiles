call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'haya14busa/incsearch.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

filetype plugin on

" remap leader
let mapleader = "\<Space>"

" set timeout to reduce visual mode remaps
set timeoutlen=300

" start NERDTree if folder is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Refresh NERDTree automatically when entering
autocmd BufEnter NERD_tree_* | execute 'normal R'

" quit vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree mappings
nnoremap <C-o> :NERDTreeFind %<CR>zz
nnoremap <C-n> :NERDTree<CR>

let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden = 1

" fzf mappings
nnoremap <C-f> :Rg<CR>
nnoremap <C-g> :Files<CR>

" open fzf window in tmux popup window
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

" sneak mappings
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" general mappings
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

" mappings for splitting windows
nnoremap <C-w>- <C-w>s
nnoremap <C-w>\ <C-w>v

" mappings for resizing vim windows
nnoremap <Leader><Up> 10<C-w>+
nnoremap <Leader><Down> 10<C-w>-
nnoremap <Leader><Right> 10<C-w>>
nnoremap <Leader><Left> 10<C-w><

" mapping for yanking file name to register
nnoremap cp :let @* = expand("%:p")<CR>

" mapping for repeating the last macro
nnoremap , @@

" share clipboard between terminals
set clipboard+=unnamedplus

" use persistent history
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

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

" deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
