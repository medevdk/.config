return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim', -- vs code like pictograms
  },
  version = '*',

  --@module 'blink.cmp'
  --@type blink.cmp.Config
  opts = {
    keymap = {
      -- CTRL-Y -> accept
      -- CTRL-P / N -> Previous / Next
      preset = 'default',

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

      nerd_font_variant = 'mono',
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },

      menu = {
        --nvim-cmp style menu
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
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

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },

      --Disable sources for command-line mode
      cmdline = {},

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
          min_keyword_length = 5,
          max_items = 5,
        },
        markdown = {
          name = 'RenderMarkdown',
          module = 'render-markdown.integ.blink',
          fallbacks = { 'lsp' }
        },
      },
    },

    signature = { enabled = true }
  },
}
