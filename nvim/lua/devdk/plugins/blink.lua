return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim", -- vs code like pictograms
		"Kaiser-Yang/blink-cmp-dictionary",
	},
	version = "*",

	--@module 'blink.cmp'
	--@type blink.cmp.Config
	opts = {
		keymap = {
			-- CTRL-Y -> accept
			-- CTRL-P / N -> Previous / Next
			preset = "default",

			--Tab / Shift TAB
			["<Tab>"] = {
				function(cmp)
					return cmp.select_next()
				end,
				"snippet_forward",
				"fallback",
			},

			["<S-Tab>"] = {
				function(cmp)
					return cmp.select_prev()
				end,
				"snippet_backward",
				"fallback",
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,

			nerd_font_variant = "mono",
		},

		completion = {
			accept = { auto_brackets = { enabled = true } },

			menu = {
				--nvim-cmp style menu
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			--Show documentation when selecting a completion item
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},

			--Display a preview of the selected items on the current line
			ghost_text = { enabled = true },

			--
		},

		cmdline = {
			--Disable sources for command-line mode
			enabled = false,
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "markdown", "dictionary" },

			providers = {
				lsp = {
					--Number of chars needed to trigger lsp
					min_keyword_length = 2,

					--Boost / penalize the score of the items????
					score_offset = 0,
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
				},
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					enabled = true,
					max_items = 8,
					min_keyword_length = 3,
					opts = {
						dictionary_directories = { vim.fn.expand("~/.config/nvim/spell") },
						dictionary_files = {
							vim.fn.expand("~/.config/nvim/spell/en.utf-8.add"),
						},
					},
				},
			},
		},

		signature = { enabled = true },
	},
}
