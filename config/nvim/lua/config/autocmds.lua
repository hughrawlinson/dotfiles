-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix mouse button behavior: prevent left mouse button from acting like right mouse button
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Set mousemodel to 'extend' to fix the mouse button issue
    -- 'popup_setpos' causes left button to act like right button
    -- 'extend' gives normal mouse behavior
    vim.opt.mousemodel = "extend"
    print("Fixed mouse button behavior - mousemodel set to: " .. vim.opt.mousemodel:get())
  end,
  desc = "Fix mouse button behavior",
})
