local hour = os.date("*t").hour
-- local colorscheme = "tokyonight-day"
local colorscheme = "kanagawa-lotus"
if hour > 21 then
  colorscheme = "catppuccin-frappe"

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.cmd.colorscheme(colorscheme)
