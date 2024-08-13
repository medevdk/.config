return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- "nvim-tree/nvim-web-devicons"
  },
  config = function()
    vim.keymap.set("n", "<leader>ee", ":NvimTreeFindFileToggle<CR>", {
      noremap = true
    })

    vim.g.loaded_netrw       = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors    = true

    require("nvim-tree").setup({
      view = {
        width = 30,
      },

    })
  end
}
