local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>,", false },
      { "<leader>/", false },
      { "<leader>fb", false },
      { "<leader>fc", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      { "<leader>sC", false },
      { "<leader>sH", false },
      { "<leader>sM", false },
      { "<leader>so", false },
      {
        "<leader><space>",
        Util.telescope("buffers", { sort_lastused = true }),
        desc = "Buffers",
      },
      { "<leader>:", Util.telescope("command_history"), desc = "Command History" },
      -- git
      { "<leader>gc", Util.telescope("git_commits"), desc = "Git Commits" },
      { "<leader>gs", Util.telescope("git_status"), desc = "Git Status" },
      -- search
      { '<leader>s"', Util.telescope("registers"), desc = "Registers" },
      {
        "<leader>sa",
        Util.telescope("find_files", { hidden = true, no_ignore = true, no_ignore_parent = true }),
        desc = "Search all files",
      },
      { "<leader>sA", Util.telescope("autocommands"), desc = "Auto Commands" },
      { "<leader>sb", Util.telescope("current_buffer_fuzzy_find"), desc = "Buffer" },
      { "<leader>sd", Util.telescope("diagnostics"), desc = "Workspace diagnostics" },
      { "<leader>sc", Util.telescope("git_status"), desc = "Find changed git files" },
      { "<leader>sD", Util.telescope("diagnostics", { bufnr = 0 }), desc = "Document diagnostics" },
      { "<leader>sf", Util.telescope("find_files", { cwd = false }), desc = "Find Files (root dir)" },
      { "<leader>sF", Util.telescope("find_files"), desc = "Find Files (cwd)" },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep (root dir)" },
      { "<leader>sG", Util.telescope("live_grep"), desc = "Grep (cwd)" },
      {
        "<leader>sg",
        '"zy<ESC>:Telescope live_grep cwd=false default_text=<c-r>z<CR>',
        mode = "v",
        desc = "Grep curent selection",
      },
      {
        "<leader>sG",
        '"zy<ESC>:Telescope live_grep default_text=<c-r>z<CR>',
        mode = "v",
        desc = "Grep curent selection (cwd)",
      },
      { "<leader>sh", Util.telescope("help_pages"), desc = "Help Pages" },
      { "<leader>sk", Util.telescope("keymaps"), desc = "Key Maps" },
      { "<leader>sm", Util.telescope("marks"), desc = "Jump to Mark" },
      { "<leader>sr", Util.telescope("resume"), desc = "Resume" },
      { "<leader>sR", Util.telescope("oldfiles"), desc = "Recent" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (root dir)" },
      { "<leader>sW", Util.telescope("grep_string"), mode = "v", desc = "Selection (cwd)" },
      { "<leader>sv", Util.telescope("commands"), desc = "Commands" },
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },

  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>sr", false },
      {
        "<leader>fh",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
    },
  },

  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<A-c>",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        window = {
          position = "float",
        },
      },
    },
    keys = {
      { "<leader>E", false },
    },
  },

  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults["<leader>h"] = "+rest client"
      opts.defaults["<leader>r"] = "+refactoring"
    end,
  },
}
