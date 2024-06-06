local opt = vim.opt

opt.termguicolors = true

opt.backspace = "indent,eol,start"

--Line number
opt.number = true         --show absolute number
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

opt.scrolloff = 8
