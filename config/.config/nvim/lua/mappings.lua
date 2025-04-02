vim.opt.background = "dark"
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")

-- This is being overridden by the theme, so putting it after setting theme
vim.cmd("hi Conceal guifg=#6c6c6c")

-- Enable true color support if available
if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

-- Required for fzf

-- FZF key mappings
vim.api.nvim_set_keymap("n", "<C-P>", ":GFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>l", ":Buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ra", ":Rg<CR>", { noremap = true, silent = true })

-- Go to definition using fzf tags
vim.api.nvim_set_keymap("n", "<Leader>gdd", ":Tags <C-R><C-W><CR>", { noremap = true, silent = true })

-- Find the word under cursor in all files
vim.api.nvim_set_keymap("n", "<Leader>rg", ":Rg <C-R><C-W><CR>", { noremap = true, silent = true })

-- Browse tags in the buffer
vim.api.nvim_set_keymap("n", "<Space>", ":BTags<CR>", { noremap = true, silent = true })

-- Browse tags in the project
vim.api.nvim_set_keymap("n", "<Leader><Space>", ":Tags<CR>", { noremap = true, silent = true })

-- FZF Layout Configuration
vim.g.fzf_layout = { window = { width = 0.97, height = 0.80 } }

vim.env.FZF_DEFAULT_OPTS = "--preview-window 'right:50%:wrap' " ..
    "--bind ctrl-y:preview-up,ctrl-e:preview-down," ..
    "ctrl-b:preview-page-up,ctrl-f:preview-page-down," ..
    "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down," ..
    "shift-up:preview-top,shift-down:preview-bottom," ..
    "alt-up:half-page-up,alt-down:half-page-down"
-- Fzf configuration ends here

vim.api.nvim_set_keymap("n", "<Leader>/", "<Plug>RgRawSearch -F \"\"<Left>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>/", "<Plug>RgRawVisualSelection", { noremap = false, silent = true })

-- Toggle tags window
vim.api.nvim_set_keymap("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })

-- Toggle Vista
vim.api.nvim_set_keymap("n", "<F7>", ":Vista!!<CR>", { noremap = true, silent = true })

-- CoC settings
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-g>u<CR><C-r>=coc#on_enter()<CR>'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gf", "<Plug>(coc-type-definition)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gi", "<Plug>(coc-implementation)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gr", "<Plug>(coc-references)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua show_documentation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rn", "<Plug>(coc-rename)", { noremap = false, silent = true })

-- Navigate diagnostics
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { noremap = false, silent = true })

-- Remap scroll in float windows/popups
vim.api.nvim_set_keymap("n", "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1, 3) : '<C-f>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0, 3) : '<C-b>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-f>", "coc#float#has_scroll() ? '<c-r>=coc#float#scroll(1)<cr>' : '<Right>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-b>", "coc#float#has_scroll() ? '<c-r>=coc#float#scroll(0)<cr>' : '<Left>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1, 3) : '<C-f>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0, 3) : '<C-b>'", { noremap = true, expr = true, silent = true })

-- Function to show documentation
function show_documentation()
  if vim.tbl_contains({"vim", "help"}, vim.bo.filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  else
    vim.fn.CocAction("doHover")
  end
end

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.fn.CocActionAsync("highlight")
  end,
})

vim.cmd("highlight CocHighlightText guibg=#333333 guifg=#ffffff")
-- Coc settings ends here

-- Get file history (git) using tig
vim.api.nvim_set_keymap("n", "<Leader>h", ":terminal tig %<CR>", { noremap = true, silent = true })

-- Minimap mappings
vim.api.nvim_set_keymap("n", "<Leader>mm", ":MinimapToggle<CR>", { noremap = true, silent = true })

-- Signify mappings
vim.api.nvim_set_keymap("n", "<Leader>hd", ":SignifyDiff<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>hp", ":SignifyHunkDiff<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>hu", ":SignifyHunkUndo<CR>", { noremap = true, silent = true })

-- Git Messenger
vim.g.git_messenger_no_default_mappings = true
vim.g.git_messenger_always_into_popup = true
vim.api.nvim_set_keymap("n", "<Leader>gm", "<Plug>(git-messenger)", { noremap = false, silent = true })

-- Fuzzy search
vim.api.nvim_set_keymap("n", "//", ":FuzzySearch<CR>", { noremap = true, silent = true })

-- Vim Illuminate: Whitelist specific file types
vim.g.Illuminate_ftwhitelist = { "javascript", "python", "rust" }

-- jq command to parse JSON
if vim.fn.executable("jq") == 1 then
    vim.api.nvim_set_keymap("n", "<Leader>jq", ":%!jq .<CR>", { noremap = true, silent = true })
end

-- Doge: Documentation generator
vim.g.doge_enable_mappings = 0
vim.api.nvim_set_keymap("n", "<Leader>gd", "<Plug>(doge-generate)", { noremap = false, silent = true })


