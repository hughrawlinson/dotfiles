require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself

    "neovim/nvim-lspconfig",

    { "lervag/vimtex", opt = true }, -- Use braces when passing options

    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
}
require("plugins")
require("rust")
require("completions")
