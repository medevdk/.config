return {
	require("lazy").setup({
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			event = { "BufReadPre", "BufNewFile" },

			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					auto_install = true,
					ensure_installed = {
						"lua",
						"vim",
						"json",
						"html",
						"css",
						"vimdoc",
						"go",
						"gomod",
						"gowork",
						"gosum",
            "c",
            "cpp"
					},
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
					autopairs = { enable = true },
					context_commentstring = {
						enable = true,
						enable_autocmd = false,
					},
				})
			end,
		},
	}),
}
