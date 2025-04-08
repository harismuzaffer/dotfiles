local M = {}

M.opts = {
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'mono' },
  sources = {
    default = { 'lsp', 'snippets', 'buffer' , 'path'},
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  cmdline = { enabled = false },
  completion = {
    keyword = { range = 'full' },

    accept = { auto_brackets = { enabled = false }, },

    list = { selection = { preselect = true, auto_insert = false } },

    menu = {
      draw = {
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" }, 
        },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      }
    },

    documentation = { auto_show = true, auto_show_delay_ms = 10 },

    ghost_text = { enabled = true },
  },
  signature = { enabled = true }

}

M.opts_extend = { "sources.default" }

vim.lsp.enable {
  'pyright',
    'rust-analyzer'
}

return M
