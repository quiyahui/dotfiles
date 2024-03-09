-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.colorcolumn = "80"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex" },
  callback = function()
    vim.opt.linebreak = true
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.http" },
  callback = function()
    vim.cmd([[ setlocal filetype=http ]])
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.qml" },
  callback = function()
    vim.cmd([[ setlocal filetype=qmljs ]])
  end,
})

local vimMutlilineIntialised = false
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    if not vimMutlilineIntialised then
      vim.cmd([[ call vm#maps#default() ]])
      vimMutlilineIntialised = true
    end
  end,
})
