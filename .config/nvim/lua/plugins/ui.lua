return {
  {
    "mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-h>", false },
      { "<S-l>", false },
      { "<A-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<A-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      messages = {
        enabled = false,
      },
      presets = {
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    keys = {
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        false,
      },
      {
        "<c-d>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-d>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" },
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
