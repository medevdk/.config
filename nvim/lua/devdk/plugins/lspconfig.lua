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
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				cmd = { "gopls" },
				capabilities = capabilities,
				filetypes = { "go", "gomod" },
				-- root_dir = util.root_pattern("go.mod", ".git"),
				settings = {
					gopls = {
						gofumpt = true,
						experimentalPostfixCompletions = true,
						analyses = {
							fieldalignment = true,
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
