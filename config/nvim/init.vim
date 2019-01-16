set nocompatible              " be iMproved, required
filetype off                  " required

set guifont=Source\ Code\ Pro\ Light:h11
" set noantialias
set guioptions-=e
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=r
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-bufferline'
Plug 'csexton/trailertrash.vim'
Plug 'derekwyatt/vim-scala'
Plug 'gcmt/taboo.vim'
Plug 'gmarik/Vundle.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Emmet.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 0
let g:airline_left_sep=''
let g:airline_powerline_fonts = 0
let g:airline_right_sep=''
let g:airline_theme='wombat'

let g:jsx_ext_required = 0

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:vim_jsx_pretty_colorful_config = 1 " default 0

set sessionoptions+=tabpages,globals

set background=dark

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Automatically change vim directory to that of focused file
set autochdir
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
let maplocalleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax enable
" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=4
" Show whitespace
set list
" Width ruler
"set colorcolumn=121
call matchadd('ColorColumn', '\%81v', 100)
set path+=**

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype plugin indent on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " Automatically reload vimrc when saved
  autocmd! bufwritepost .vimrc source %

  au VimEnter * RainbowParenthesesActivate
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif

set shiftwidth=2
set tabstop=2
set expandtab

map <leader>edc      mzO<ESC>j:s/,/,\r/g<CR>(%i<CR><ESC>%a<CR><ESC>(%=%:%s/ *$//g<CR>:noh<CR>'zkdd
if has("gui_running")
  set guifont=Fira\ Code:h12
  set macligatures
  set guioptions-=e
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=r
endif
