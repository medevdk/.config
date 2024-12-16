return {
  --in insert mode <C-/> and in normal mode ?
  --will give info for available keys
  --
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },

  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = '[F]ind [Files]' })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = '[F]ind with [G]rep' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = '[F]ind in [B]uffer' })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = '[F]ind in [H]elp' })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = '[F]ind [T]odos' })

    local telescope = require("telescope")
    local telescopeConfig = require("telescope.config")

    --Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    --I want to search in hidden / dot files
    table.insert(vimgrep_arguments, "--hidden")
    --I do not want to search in the.git directory
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        -- path_display = path_display,
        layout_strategy = "horizontal",
        file_ignore_patterns = {
          -- ".git",
        },
        mappings = {
          i = {
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })

    -- require("telescope").load_extension("ui-select")
    -- vim.g.zoxide_use_select = true

    -- require("telescope").load_extension("noice")
  end,
}
