local M = {}

M.opts = {
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = true, auto_show_delay_ms = 100 } },
  sources = {
    default = { 'lsp', 'snippets' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}

M.opts_extend = { "sources.default" }

vim.lsp.enable {
  'pyright',
  'rust-analyzer'
}

return M
