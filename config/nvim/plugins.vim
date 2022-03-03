call plug#begin('~/.config/nvim/plugged')

" Show list of plugins in statusline
Plug 'bling/vim-bufferline'

" Delete unnecessary whitespace
Plug 'csexton/trailertrash.vim'

" Fish Script support
Plug 'dag/vim-fish'

" Tab manager
Plug 'gcmt/taboo.vim'

" Colour the balanced parens
Plug 'kien/rainbow_parentheses.vim'

" Lets gcc happen
Plug 'tpope/vim-commentary'

" Git client in vim
Plug 'tpope/vim-fugitive'

" Required for other tpope plugins
Plug 'tpope/vim-liquid'

" tpope's sensible defaults
Plug 'tpope/vim-sensible'

" Highlight text, surround it in parens or whatever
Plug 'tpope/vim-surround'

" The status bar
Plug 'vim-airline/vim-airline'

" Themes for the status bard
Plug 'vim-airline/vim-airline-themes'

" HTML/JSX generation
Plug 'vim-scripts/Emmet.vim'

" Log my vim usage
Plug 'wakatime/vim-wakatime'

" Typescript Syntax
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" For async completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" For Denite features
Plug 'Shougo/denite.nvim'

" Display function signatures in command line
Plug 'Shougo/echodoc.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

" Language Support
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'cdata/vim-tagged-template'

" HTML
Plug 'othree/html5.vim'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" Rust
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

call plug#end()
