local group = vim.api.nvim_create_augroup("gzip_local2", { clear = true })

vim.api.nvim_create_autocmd(
  { "BufReadPre", "FileReadPre" },
  { command = "setlocal bin", pattern = "*.xopp", group = group }
)
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { command = 'call gzip#read("gzip -dn -S .xopp")', pattern = "*.xopp", group = group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePost", "FileWritePost" },
  { command = 'call gzip#write("gzip -S .xopp")', pattern = "*.xopp", group = group }
)
vim.api.nvim_create_autocmd(
  "FileAppendPre",
  { command = 'call gzip#appre("gzip -dn -S .xopp")', pattern = "*.xopp", group = group }
)
vim.api.nvim_create_autocmd(
  "FileAppendPost",
  { command = 'call gzip#write("gzip -S .xopp")', pattern = "*.xopp", group = group }
)
