local M = {}

function M.setup()
  require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {bold = true},
    keywordStyle = { bold = true},
    statementStyle = { bold = true },
    typeStyle = {bold = true},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
      palette = {},
      theme = { 
        wave = {}, lotus = {}, dragon = {}, all = {
          ui = {
            bg_gutter = "none"
          }
        } 
      },
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        String = { fg = colors.palette.carpYellow, italic = true },
        Search = { bg = colors.palette.fujiWhite, fg = colors.palette.sumiInk0 }, -- Brighter yellow background with dark text
        Visual = { bg = colors.palette.waveBlue2 }, 
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
      }
    end,
    theme = "wave",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
      dark = "wave",           -- try "dragon" !
      light = "lotus"
    },
  })
end

return M



