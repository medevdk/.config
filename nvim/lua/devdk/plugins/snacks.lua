return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		notifier = { enabled = true },
		lazygit = { enabled = true },
		dashboard = { enabled = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit ",
		},
	},
}
