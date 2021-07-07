set shell=/bin/bash
if &term == "alacritty" || &term == "vim"
  let &term = "xterm-256color"
endif

set mouse=a
set clipboard^=unnamed
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'gko/vim-coloresque'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
Plug 'rakr/vim-two-firewatch'
Plug 'vimlab/split-term.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'lervag/vimtex'
Plug 'dkarter/bullets.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()
" All of your Plugins must be added before the following line
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set termguicolors
set background=dark
let g:two_firewatch_italics=1
colo two-firewatch
set tabstop=3
hi Normal guibg=NONE ctermbg=NONE
set encoding=UTF-8
set number relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4
set updatetime=100
set scrolloff=20
autocmd FileType python setlocal completeopt -=preview
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && getcwd() != "/home/suerflowz" | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:airline_theme='minimalist'

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'text',
    \ 'scratch'
    \]

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
" let terminal resize scale the internal windows
" autocmd VimResized * :wincmd =
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf661 ",
\   "variable": "\uf031 ",
\   "implementation": "\uf013 ",
\   "struct": "\uf7ea ",
\   "method": "\uf1b2 ",
\   "field": "\uf337 ",
\   "enum": "\uf5c3 ",
\   "enumerator": "\uf061 ",
\   "typedef": "\uf53f ",
\  }
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd TermOpen * setlocal nonumber norelativenumber


augroup terminal_settings
    autocmd!

    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
          \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \   call nvim_input('<CR>')  |
          \ endif
  augroup END

nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>tt :NERDTreeFocus<CR>
nmap <leader>i :Vista focus<CR>
nnoremap <C-p> :Vista finder coc<CR>

autocmd InsertEnter * let @/=""
command! CargoPlay !cargo play %
