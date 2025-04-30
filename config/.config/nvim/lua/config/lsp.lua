-- lua/config/lsp.lua
local M = {}

function M.setup()
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = { buffer = event.buf }

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
  })

  vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
      -- Only open float if diagnostics exist at the cursor position
      local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
      if #diagnostics > 0 then
        vim.diagnostic.open_float(nil, { scope = "cursor", focusable = false })
      end
    end,
    desc = "Show diagnostics on hover",
  })

  -- Define Pyright configuration
  vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" }, -- Command to start Pyright
    filetypes = { "python" },                  -- Associate with Python files
    root_markers = {                          -- Files indicating project root
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      ".git",
    },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,             -- Automatically find import paths
          useLibraryCodeForTypes = true,      -- Use library code for type inference
          diagnosticMode = "openFilesOnly",   -- Limit diagnostics to open files (faster)
        },
      },
    },
    capabilities = require("blink.cmp").get_lsp_capabilities(), -- Integrate blink.cmp capabilities
  })

  vim.lsp.config("rust-analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = {
      "Cargo.toml",
      ".git",
    },
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
        cargo = {
          buildScripts = { enable = true },
        },
        procMacro = { enable = true },
      },
    },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })

end

return M
