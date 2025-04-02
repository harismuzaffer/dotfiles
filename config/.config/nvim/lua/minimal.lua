-- SETTINGS START HERE
--------------------------------------------------------------------------------

-- Disable mouse completely
vim.opt.mouse = ""

-- To leave the cursor in the same column when using navigation keys
vim.opt.startofline = false

-- Fold settings: fold by indentation, disable folding by default, and allow deep nesting
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 9999

-- Enable horizontal scrolling
vim.opt.sidescroll = 1

-- Signs will be shown in the number column to avoid an extra column
vim.opt.signcolumn = "number"

-- Keep the cursor at least 4 lines away from the top or bottom
vim.opt.scrolloff = 4

-- Fix delete key behavior on macOS
vim.opt.backspace = { "indent", "eol", "start" }

-- Hide buffer instead of discarding it when switching
vim.opt.hidden = true

-- Reduce swap file write delay (default is 4000ms)
vim.opt.updatetime = 100

-- Incremental search
vim.opt.incsearch = true

-- Enable filetype detection, plugin support, and indentation
vim.cmd("filetype plugin indent on")

-- TAB settings: define both character width and key behavior
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.tabstop = 8  -- Default tab size

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Always show cursor line
vim.opt.cursorline = true

-- Tab completion
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest", "full" }

-- File search paths
vim.opt.path = ".,,**"

-- Syntax highlighting
vim.cmd("syntax on")

-- Set grep program to ripgrep if available
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --no-heading"
    vim.opt.grepformat = "%f:%l:%c:%m,%f:%l%m,%f  %l%m|"
end

-- Increase command history size
vim.opt.history = 1000

-- Enable completion within the current buffer only
vim.opt.complete = "."
vim.opt.completeopt = { "menu", "menuone", "noinsert" }

-- Use a dedicated backup directory to avoid clutter
vim.opt.backupdir = "/tmp//"
vim.opt.directory = "/tmp//"
vim.opt.undodir = "/tmp//"

-- SETTINGS END HERE
--------------------------------------------------------------------------------

-- MAPPINGS START HERE
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle line numbers
map("n", "<Leader>sl", ":set invnumber<CR>", opts)

-- Toggle ignore case
map("n", "<Leader>ic", ":set ic!<CR>", opts)

-- Toggle relative numbers
map("n", "<Leader>rl", ":set invrelativenumber<CR>", opts)

-- Clear search highlights
map("n", "<Leader>c", ":noh<CR>", opts)

-- Quickfix navigation
map("n", "<F1>", ":cn<CR>zz", opts)
map("n", "<F2>", ":cp<CR>zz", opts)
map("n", "<F3>", "<CR>zz<C-W>p<Down>", opts)

-- Quick buffer switching
map("n", "<C-S>", ":e#<CR>", opts)
map("n", "<Leader>q", ":copen<CR>", opts)

-- Window management
map("n", "<S-Left>", "<C-W>h", opts)
map("n", "<S-Right>", "<C-W>l", opts)
map("n", "<S-Up>", "<C-W>k", opts)
map("n", "<S-Down>", "<C-W>j", opts)
map("n", "<C-W>M", "<C-W>| <C-W>_", opts)
map("n", "<C-W>m", "<C-W>=", opts)

-- Cursor movement shortcuts
map("n", "<M-Down>", "7j", opts)
map("n", "<M-Up>", "7k", opts)
map("n", "<M-Right>", "25l", opts)
map("n", "<M-Left>", "25h", opts)

-- File explorer
map("n", "<Leader>f", ":Ex<CR>", opts)
map("n", "<Leader>fr", ":Ex<CR>", opts)

-- Delete buffer
map("n", "<Leader>d", ":bd<CR>", opts)

-- Toggle highlight of word under cursor
map("n", "z/", ":lua AutoHighlightToggle()<CR>", opts)

-- MAPPINGS END HERE
--------------------------------------------------------------------------------

-- AUTOCOMMANDS START HERE
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.ts",
    command = "setlocal filetype=javascript"
})
-- AUTOCOMMANDS END HERE
--------------------------------------------------------------------------------

-- FUNCTIONS START HERE
function AutoHighlightToggle()
    vim.fn.setreg("/", "")
    if vim.fn.exists("#auto_highlight") == 1 then
        vim.api.nvim_del_augroup_by_name("auto_highlight")
        vim.opt_local.updatetime = 4000
        print("Highlight current word: OFF")
        return false
    else
        local group = vim.api.nvim_create_augroup("auto_highlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
            group = group,
            command = "let @/ = '\\<' .. escape(expand('<cword>'), '\\') .. '\\>'"
        })
        vim.opt_local.updatetime = 500
        print("Highlight current word: ON")
        return true
    end
end

function SourceIfExists(file)
    local expanded_file = vim.fn.expand(file)
    if vim.fn.filereadable(expanded_file) == 1 then
        vim.cmd("source " .. expanded_file)
    end
end

-- FUNCTIONS END HERE
--------------------------------------------------------------------------------
