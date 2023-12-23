-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keys = vim.keymap

keys.del("n", "<leader>l")

keys.set("i", "<C-c>", "<ESC>")
keys.set("n", "x", '"_x')

keys.set({ "n", "v" }, "<leader>y", '"+y')
keys.set({ "n", "v" }, "<leader>p", '"+p')

keys.set("n", "<leader>e", vim.diagnostic.open_float)
keys.set("n", "<leader>cq", vim.diagnostic.setloclist)

keys.set("n", "<leader>fp", [[ <cmd>echo expand('%')<CR> ]])
