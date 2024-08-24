return {

  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim" },

  {

    "zaldih/themery.nvim",

    config = function()
      require("themery").setup({
        themes = {
          { name = "",        colorscheme = "catppuccin-frappe" },
          { name = "--night", colorscheme = "catppuccin-frappe" },
          {
            name = "TokyoNight ",
            colorscheme = "tokyonight-night"
          },
          {
            name = "Kanagawa ",
            colorscheme = "kanagawa-wave"
          },
          {
            name = "Catppuccin ",
            colorscheme = "catppuccin-mocha"
          },
          {
            name = "Rose Pine ",
            colorscheme = "rose-pine-main"
          },

          { name = "",      colorscheme = "tokyonight-storm" },
          { name = "--day", colorscheme = "tokyonight-storm" },

          {
            name = "Catppuccin ",
            colorscheme = "catppuccin-latte"
          },

          {
            name = "TokyoNight ",
            colorscheme = "tokyonight-day"
          },
        },
      })
    end
  }
}
