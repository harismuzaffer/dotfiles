local M = {}

function M.setup(opts)
  local default_opts = {
    winopts = {
      row = 0.5,
      col = 0,
      width = 1,
      height = 0.8,
      preview = {
        border         = "rounded",       -- preview border: accepts both `nvim_open_win`
        wrap           = true,           -- preview line wrap (fzf's 'wrap|nowrap')
        vertical       = "down:45%",      -- up|down:size
        horizontal     = "right:62%",     -- right|left:size
        layout         = "flex",          -- horizontal|vertical|flex
      },
    },
    keymap = {
      builtin = {
        [1] = true, -- Inherit defaults
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
        ["<C-e>"] = "preview-down",
        ["<C-y>"] = "preview-up",
      },
    },
    fzf_opts = {
      ["--layout"]         = "default",
      ["--border"]         = "none",
    }
  }

  -- Merge default_opts with opts if provided
  local final_opts = vim.tbl_deep_extend("force", default_opts, opts or {})

  -- Configure fzf-lua with the merged options
  require('fzf-lua').setup(final_opts)
  vim.api.nvim_set_keymap("n", "<C-P>", ":lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>p", ":lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>l", ":lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>ra", ":lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rG", ":lua require('fzf-lua').grep_cWORD()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rg", ":lua require('fzf-lua').grep_cword()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rr", ":lua require('fzf-lua').live_grep_glob()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rc", ":lua require('fzf-lua').git_commits()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rbc", ":lua require('fzf-lua').git_bcommits()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<Leader>rl", ":lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true })

  -- Browse tags in the buffer
  vim.api.nvim_set_keymap("n", "<Space>", ":lua require('fzf-lua').btags()<CR>", { noremap = true, silent = true })

  -- Browse tags in the project
  vim.api.nvim_set_keymap("n", "<Leader><Space>", ":lua require('fzf-lua').tags()<CR>", { noremap = true, silent = true })
end

return M

