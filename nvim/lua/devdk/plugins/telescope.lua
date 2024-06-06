return {
	--in insert mode <C-/> and in normal mode ?
	--will give info for available keys
	--
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")

		telescope.setup({
			defaults = {
				-- path_display = path_display,
				layout_strategy = "horizontal",
				file_ignore_patterns = {
					".git",
				},
				mappings = {},
			},
			pickers = {
				find_files = {
					-- theme = "dropdown",
				},
			},
		})
	end,
}
