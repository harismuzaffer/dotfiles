local M = {}

local parsers = { "lua", "vimdoc", "markdown", "markdown_inline", "python", "rust" }

function M.setup()
  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "markdown", "python", "rust" },
    callback = function()
      if not pcall(vim.treesitter.start) then
        return
      end
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
