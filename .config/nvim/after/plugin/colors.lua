local hour = os.date("*t").hour

function ColorDay()
  vim.cmd.colorscheme("kanagawa-lotus")
end

function ColorNight()
  vim.cmd.colorscheme("catppuccin-frappe")

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.api.nvim_create_user_command("ColorNight", ColorNight, {})
vim.api.nvim_create_user_command("ColorDay", ColorDay, {})

if hour > 21 then
  ColorNight()
else
  ColorDay()
end
