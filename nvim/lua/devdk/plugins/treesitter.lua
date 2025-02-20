return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"markdown",
				"markdown_inline",
				"json",
				"html",
				"css",
				"vimdoc",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"c",
				"cpp",
				"regex",
			},
		},
	},
}
-- return {
--   -- require("lazy").setup({
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     dependencies = { "windwp/nvim-ts-autotag" },
--     event = { "BufReadPre", "BufNewFile" },
--
--     config = function()
--       local configs = require("nvim-treesitter.configs")
--
--       configs.setup({
--         auto_install = true,
--         ensure_installed = {
--           "lua",
--           "vim",
--           "markdown",
--           "markdown_inline",
--           "json",
--           "html",
--           "css",
--           "vimdoc",
--           "go",
--           "gomod",
--           "gowork",
--           "gosum",
--           "c",
--           "cpp"
--         },
--         sync_install = false,
--         highlight = { enable = true },
--         indent = { enable = true },
--         autotag = { enable = true, },
--         autopairs = { enable = true },
--         context_commentstring = {
--           enable = true,
--           enable_autocmd = false,
--         },
--       })
--     end,
--   },
--   -- }),
-- }
