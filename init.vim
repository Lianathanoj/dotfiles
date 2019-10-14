call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'haya14busa/incsearch.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin on

" set timeout to reduce visual mode remaps
set timeoutlen=300

" start NERDTree if folder is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" NERDTree mappings
nnoremap <C-o> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>

let g:NERDTreeIgnore = ['^node_modules$']

" fzf mappings
nnoremap <C-f> :Rg<CR>
nnoremap <C-g> :Files<CR>

" general mappings
nnoremap oo o<Esc>
nnoremap OO O<Esc>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
tnoremap jj <C-\><C-n>
inoremap jj <Esc>`^

" share clipboard between terminals
set clipboard+=unnamedplus

" return to same line number of recently-closed file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" highlighting options
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

hi search ctermfg=black
hi search ctermbg=blue

" deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" appearance
set tabstop=4 shiftwidth=4 expandtab
set hlsearch
set ruler
set number
set ignorecase
set smartcase
set cursorline

" automatically source config on save
autocmd! bufwritepost $NVIM_CONFIG source $NVIM_CONFIG 

