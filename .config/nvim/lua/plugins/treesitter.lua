return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "csv",
        "elixir",
        "go",
        "prisma",
        "proto",
        "qmljs",
        "svelte",
        "rust",
        -- required for rest-nvim/rest.nvim
        "http",
        "json",
      })
    end,
  },
}
