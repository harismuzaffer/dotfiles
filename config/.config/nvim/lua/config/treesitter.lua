local M = {}

function M.setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "vimdoc", "markdown", "python", "rust" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    autotag = {
      enable = true,
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
      }
    },
  }
  -- Setup for treesitter-context
  require('treesitter-context').setup {
    enable = true,
    throttle = true,
    max_lines = 1,
  }
end

return M
