-- CTRL e toggle the file tree
-- CTRL h / l -> move left / right
-- E expand all
-- W collapse all
-- CTRL k -> display file info
-- g? -> open help with all pre-defined key combos


return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- vim.keymap.set("n", "<leader>ee", ":NvimTreeFindFileToggle<CR>", {
    -- noremap = true
    -- })


    vim.g.loaded_netrw       = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors    = true

    -- local api                = require("nvim-tree.api")

    -- local function my_on_attach(bufnr)
    --   local function opts(desc)
    --     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    --   end

    --   -- default mappings
    --   api.config.mappings.default_on_attach(bufnr)

    --   --on_attach
    --   vim.keymap.set("n", "<leader>h", api.tree.close, opts("Close"))
    --   vim.keymap.set("n", "<leader>H", api.tree.collapse_all, opts("Collapse All"))
    -- end

    require("nvim-tree").setup({

      -- on_attach = my_on_attach,
      git = { enable = false },
      notify = {
        absolute_path = false
      },
      view = {
        signcolumn = no,
        width = 30,
      },

    })
  end
}
