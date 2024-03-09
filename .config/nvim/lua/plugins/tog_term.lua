--- Modified from https://github.com/beerent/dotfiles/blob/main/nvim/lua/plugins/tog_term.lua

---@type integer|nil
local term_buf = 0
---@type integer|nil
local term_win = 0

function TermToggle(height)
  if vim.fn.win_gotoid(term_win) > 0 then
    vim.cmd("hide")
  else
    vim.cmd("botright new")
    vim.cmd("resize " .. height)
    local success, _ = pcall(vim.cmd, "buffer " .. term_buf)
    if not success then
      vim.fn.termopen(vim.env.SHELL, { detach = 0 })
      term_buf = vim.fn.bufnr("")
      vim.cmd("set nonumber")
      vim.cmd("set norelativenumber")
      vim.cmd("set signcolumn=no")
    end
    vim.cmd("startinsert!")
    term_win = vim.fn.win_getid()
  end
end

return {
  vim.keymap.set({ "n", "i", "t" }, "<C-t>", function()
    TermToggle(12)
  end),

  -- Terminal go back to normal mode
  vim.keymap.set("t", "<C-\\><C-n>", "<C-\\><C-n>", { noremap = true, silent = true }),
  vim.keymap.set("t", "<C-\\><C-n>:q!", "<C-\\><C-n>:q!<CR>", { noremap = true, silent = true }),
}
