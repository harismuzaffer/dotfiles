local M = {}

function M.setup()
  require("nvim-navic").setup({
    lsp = {
      auto_attach = true,
    },

    lazy_update_context = true,
  })
end

return M
