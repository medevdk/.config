local opt = vim.opt

opt.termguicolors = true

opt.backspace = "indent,eol,start"

--Line number
opt.number = true --show absolute number
opt.relativenumber = true --add numbers to each line on the left side

--Tab / Indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true

opt.cursorline = true

--Do not wrap
opt.wrap = false

--Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

--Clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default register

-- Minimum number of lines to keep above and below the cursor
opt.scrolloff = 8

--Spelling
opt.spell = true
opt.spelllang = "en_us"

--Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighLight", { clear = true })
vim.api.nvim_create_autocmd("textYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "incSearch", timeout = 1000 })
	end,
	group = highlight_group,
	pattern = "*",
})
