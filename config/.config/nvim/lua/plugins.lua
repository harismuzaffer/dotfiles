return {
  -- Productivity Plugins
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { 
    "ludovicchabant/vim-gutentags", 
    config = function()
      require("config.gutentags").setup()
    end
  },
  { "liuchengxu/vista.vim" },
  { "tpope/vim-fugitive" },
  { "psliwka/vim-smoothie" },
  { "vimwiki/vimwiki" },
  { "adamheins/vim-highlight-match-under-cursor" },
  { "mhinz/vim-signify" },
  { "wfxr/minimap.vim" },
  { "ggVGc/vim-fuzzysearch" },
  { "jesseleite/vim-agriculture" },
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { 
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end
  },
  { "RRethy/nvim-treesitter-textsubjects" },
  { "nvim-lua/plenary.nvim" },
  { 
    "ruifm/gitlinker.nvim",
    config = function()
      require("gitlinker").setup()
    end
  },
  { "rhysd/git-messenger.vim" },
  { "brooth/far.vim" },
  { "github/copilot.vim" },
  { "robitx/gp.nvim" },

  -- Syntax Plugins
  { "neoclide/coc.nvim", branch = "release" },
  { "jiangmiao/auto-pairs" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "majutsushi/tagbar" },
  { "kkoomen/vim-doge" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "romgrk/nvim-treesitter-context" },
  { "windwp/nvim-ts-autotag" },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = false,
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
      vim.api.nvim_set_keymap("n", "<Leader>gb", ":GitBlameToggle<CR>", { noremap = true, silent = true })
    },

  },
  { 
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end
  },
  { "Vimjas/vim-python-pep8-indent" },
  { 
    "anuvyklack/fold-preview.nvim",
    config = function()
      require("fold-preview").setup()
    end
  },
  { "anuvyklack/keymap-amend.nvim" },
  { "jeetsukumaran/vim-indentwise" },
  { "fei6409/log-highlight.nvim" },

  -- Colors and UI
  { "gruvbox-community/gruvbox" },
  { "nvim-lualine/lualine.nvim" },
  { 
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {}
    end
  }
}

