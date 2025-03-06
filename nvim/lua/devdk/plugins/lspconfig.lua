---@diagnostic disable: trailing-space
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "marksman" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
			-- "hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opt = {} },
			{ "j-hui/fidget.nvim", opts = {} },
		},

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc" },

				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
					},
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
				settings = {},
				single_file_support = true,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				cmd = { "vscode-css-language-server", "--stdio" },
				filetypes = { "css", "scss", "less" },
				-- root_dir = function(fname)
				-- 	return root_pattern(fname) or vim.loop.os_homedir()
				-- end,
				settings = {
					css = {
						validate = true,
					},
					less = {
						validate = true,
					},
					scss = {
						validate = true,
					},
				},
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
				cmd = { "vscode-json-language-server", "--stdio" },
			})

			lspconfig.marksman.setup({})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--clang-tidy",
					"-j=5",
					"--malloc-trim",
				},
				filetypes = { "c", "cpp" },
			})

			lspconfig.gopls.setup({
				cmd = { "gopls" },
				capabilities = capabilities,
				filetypes = { "go", "gomod" },
				root_dir = util.root_pattern("go.mod", ".git"),
				settings = {
					gopls = {
						gofumpt = true,
						experimentalPostfixCompletions = true,
						analyses = {
							nilness = true,
							unusedwrite = true,
							useany = true,
							unusedparams = true,
							shadow = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						semanticTokens = true,
					},
				},
			})

			-- autocmd("BufWritePre", {
			-- 	pattern = "*.go",
			-- 	callback = function()
			-- 		local params = vim.lsp.util.make_range_params()
			-- 		params.context = { only = { "source.organizeImports" } }
			-- 		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
			-- 		-- machine and codebase, you may want longer. Add an additional
			-- 		-- argument after params if you find that you have to write the file
			-- 		-- twice for changes to be saved.
			-- 		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
			-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
			-- 		for cid, res in pairs(result or {}) do
			-- 			for _, r in pairs(res.result or {}) do
			-- 				if r.edit then
			-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
			-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
			-- 				end
			-- 			end
			-- 		end
			-- 		vim.lsp.buf.format({ async = false })
			-- 	end,
			-- })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
