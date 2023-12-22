require "paq" {
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  -- Show list of plugins in statusline
  "bling/vim-bufferline",

  -- Delete unnecessary whitespace
  "csexton/trailertrash.vim",

  -- -- Fish Script support
  "dag/vim-fish",

  -- Tab manager
  "gcmt/taboo.vim",

  -- Colour the balanced parens
  "kien/rainbow_parentheses.vim",

  -- Lets gcc happen
  "tpope/vim-commentary",

  -- Git client in vim
  "tpope/vim-fugitive",

  -- Required for other tpope plugins
  "tpope/vim-liquid",

  -- tpope"s sensible defaults
  "tpope/vim-sensible",

  -- Highlight text, surround it in parens or whatever
  "tpope/vim-surround",

  -- The status bar
  "vim-airline/vim-airline",

  -- Themes for the status bard
  "vim-airline/vim-airline-themes",

  -- Display function signatures in command line
  "Shougo/echodoc.vim",

  "junegunn/fzf.vim",

  -- Template literal syntax highlighting in js/ts
  "cdata/vim-tagged-template",

  -- HTML
  "othree/html5.vim",

  -- CSS
  "hail2u/vim-css3-syntax",

  -- Rust
  -- Collection of common configurations for the Nvim LSP client
  "neovim/nvim-lspconfig",

  -- Completion framework
  "hrsh7th/nvim-cmp",

  -- LSP completion source for nvim-cmp
  "hrsh7th/cmp-nvim-lsp",

  -- Snippet completion source for nvim-cmp
  "hrsh7th/cmp-vsnip",

  -- Other useful completion sources
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",

  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  "simrat39/rust-tools.nvim",

  -- nushell
  "jose-elias-alvarez/null-ls.nvim",
  "LhKipp/nvim-nu",
  "nvim-lua/plenary.nvim"
}

require'nu'.setup{}
