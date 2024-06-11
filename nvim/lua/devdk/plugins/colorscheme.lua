return {
  "folke/tokyonight.nvim",
  priority = 1000,
  -- opts = { style = "storm" },
  config = function()
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64aC"
    local bg_visual = "#275378"
    local fg = "#cbe0f0"
    local fg_dark = "##b4d0e9"
    local fg_gutter = "627e97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd("colorscheme tokyonight")
    -- vim.cmd.colorscheme("tokyonight")
  end,
}
