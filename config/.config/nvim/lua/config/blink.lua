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
          kind_icon = {
            text = function(ctx)
              local lspkind = require("lspkind")
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                      end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                        mode = "symbol",
                        })
            end

              return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                        end
                        end
                        return hl
                        end,
          }
        }
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
