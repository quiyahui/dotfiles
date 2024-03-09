return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>m",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Harpoon: Add to list",
      },
      {
        "<leader>E",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: List",
      },
      {
        "<S-h>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon: Prev",
      },
      {
        "<S-l>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon: Next",
      },
    },
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>uu", vim.cmd.UndotreeToggle, desc = "Undo Tree Toggle" },
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
      {
        "<leader>rr",
        function()
          require("refactoring").select_refactor({ show_success_message = true })
        end,
        desc = "Select Refactor",
      },
      {
        "<leader>rp",
        function()
          require("refactoring").debug.printf({ below = false, show_success_message = true })
        end,
        desc = "Printf",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").debug.print_var({ show_success_message = true })
        end,
        mode = { "x", "n" },
        desc = "Print var",
      },
      {
        "<leader>rc",
        function()
          require("refactoring").debug.cleanup({ show_success_message = true })
        end,
        desc = "Debug cleanup ",
      },
    },
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
    },
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Doc Comment",
      },
    },
    version = "*",
  },

  {
    "mg979/vim-visual-multi",
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = "lsp", -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
    },
  },

  {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
      { "<leader>hr", "<Plug>RestNvim<cr>", desc = "Rest Client: Run request" },
      { "<leader>hp", "<Plug>RestNvimPreview<cr>", desc = "Rest Client: Preview" },
      { "<leader>hR", "<Plug>RestNvimLast<cr>", desc = "Rest Client: Rerun" },
    },
    ft = "http",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- stay in current windows (.http file) or change to results window (default)
        stay_in_current_window_after_split = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- table of curl `--write-out` variables or false if disabled
          -- for more granular control see Statistics Spec
          show_statistics = false,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = false,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end,
  },
}
