local M = {}

function M.setup()
  require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = 'powerline_dark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = {},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        {
          'filename',
          file_status = true,  -- displays file status (readonly status, modified status)
          path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40 -- Shortens path to leave 40 space in the window
          -- for other components. Terrible name any suggestions?
        },
      },
      lualine_x = {
        function()
          return require("nvim-treesitter").statusline({
            indicator_size = 150,
            type_patterns = { "class", "function", "method" },
            separator = "  ",
          })
        end,
        'filetype',
      },
      lualine_y = {'%l:%c|%L', "progress"},
      lualine_z = {},
    },
    extensions = {'quickfix', 'fugitive', 'fzf', 'nerdtree'}
  }
end

return M
