-- Leader key: useful to create extra set of shortcuts
-- This is a special variable, so adding it at the top regardless of the section it belongs to
vim.g.mapleader = ","
-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
require('lazy').setup('plugins')

-- Other settings
require('minimal')
require('config.lualine')
require('config.treesitter')
require('mappings')
require('lsp')

