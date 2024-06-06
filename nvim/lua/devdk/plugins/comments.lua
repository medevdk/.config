return {
	--'gcc' toggle the current line in Normal Mode
	--'gc' toggle the current line in Visual mode
	"numToStr/Comment.nvim",
	-- opts={},
	lazy = false,
	config = function()
		--ignore empty lines
		require("Comment").setup({
			ignore = "^$",
		})
	end,
}
