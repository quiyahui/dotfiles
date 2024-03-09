return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
      },
      ---@type lspconfig.options
      servers = {
        eslint = {},
        prismals = {},
        svelte = {},
        vuels = {},
        -- tailwindcss = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git")(...)
        --   end,
        -- },
        -- tsserver = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git")(...)
        --   end,
        -- },
      },
    },
  },
}
