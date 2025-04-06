-- Use spaces instead of tabs
vim.opt_local.expandtab = true

-- Set indentation width to 2 spaces (Lua convention)
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- Maintain indentation level
vim.opt_local.autoindent = true

-- Improve comment formatting
vim.opt_local.formatoptions:append("cro")

-- Set keyword lookup to open `:help`
vim.opt_local.keywordprg = ":help"

