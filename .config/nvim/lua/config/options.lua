-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.hlsearch = false

vim.wo.number = true
vim.opt.relativenumber = true

vim.o.breakindent = true
vim.o.wrap = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.swapfile = false

-- Revert LazyVim settings
vim.opt.autowrite = false
vim.opt.clipboard = "unnamed"
