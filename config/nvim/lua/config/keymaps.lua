-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-h>", "<cmd>ZellijNavigateLeft<CR>", { desc = "Move to left Zellij pane/tab" })
vim.keymap.set("n", "<C-j>", "<cmd>ZellijNavigateDown<CR>", { desc = "Move to down Zellij pane" })
vim.keymap.set("n", "<C-k>", "<cmd>ZellijNavigateUp<CR>", { desc = "Move to up Zellij pane" })
vim.keymap.set("n", "<C-l>", "<cmd>ZellijNavigateRight<CR>", { desc = "Move to right Zellij pane/tab" })
