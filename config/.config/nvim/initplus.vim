set bg=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox 

" this is being overridden by the theme, so putting it after setting theme
hi Conceal ctermfg=242 guifg=#6c6c6c

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" required for fzf. Make sure you have fzf path set in your bashrc, zsh etc
set rtp+=$fzf

"FZF setting starts here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mapping for fzf to open files and buffers
nnoremap <C-P> :GFiles<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>l :Buffers<CR>
nnoremap <Leader>ra :Rg<CR>

" go to def using fzf tags
nnoremap <silent> <Leader>gdd :Tags <C-R><C-W><CR>

" find the word under cursor in all files
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" browse tags in the buffer
nnoremap <space> :BTags<CR>

" browse tags in the project
nnoremap <leader><space> :Tags<CR>

let g:fzf_layout = { 'window': { 'width': 0.97, 'height': 0.80 } }
let $FZF_DEFAULT_OPTS="--preview-window 'right:50%:wrap'
            \ --bind ctrl-y:preview-up,ctrl-e:preview-down,
            \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
            \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
            \shift-up:preview-top,shift-down:preview-bottom,
            \alt-up:half-page-up,alt-down:half-page-down"

"FZF setting ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" RgRaw - vimagriculture
nmap <Leader>/ <Plug>RgRawSearch -F ""<Left>
vmap <Leader>/ <Plug>RgRawVisualSelection

" toggle tags window
nmap <F8> :TagbarToggle<CR>

" toggle Vista
nmap <F7> :Vista!!<CR>

"COC setting starts here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" coc.nvim config starts
" GoTo code navigation for cocvim

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <Leader>gf <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" for refactoring. This needs external tools. e.g. for python, installing
" coc-pyright is enough
nmap <leader>rn <Plug>(coc-rename)


" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<C-b>"

" coc vim function to show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" COC setting ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" get file history(git) using tig
nnoremap <Leader>h :terminal tig %<CR>

" minimap mappings 
nnoremap <Leader>mm :MinimapToggle<CR>

" Signify mappings
nnoremap <leader>hd :SignifyDiff<cr>
nnoremap <leader>hp :SignifyHunkDiff<cr>
nnoremap <leader>hu :SignifyHunkUndo<cr>

" git-blame.nvim
let g:gitblame_enabled = 0
nnoremap <Leader>gb :GitBlameToggle<CR>

" git messenger for showing commit of current line information in a popup
let g:git_messenger_no_default_mappings = v:true
let git_messenger_always_into_popup = v:true
nmap <Leader>gm <Plug>(git-messenger)

" fuzzysearch
nnoremap // :FuzzySearch<CR>

" vim illuminate: whitelist only these file type
let g:Illuminate_ftwhitelist = ['javascript', 'python', 'rust']

" jq command to parse json
if (executable("jq"))
    nnoremap <Leader>jq :%!jq .<CR>
endif

" for gutentags, exlcude these file types
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.yml', '*.json', '*.scss', '*.less', 'node_modules', '*.pyc']
" cache dir for gutentags
let g:gutentags_cache_dir = '~/.gutentags'

" doge: documentation generator
let g:doge_enable_mappings = 0
nmap <Leader>gd <Plug>(doge-generate)

lua << EOS
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require'nvim-treesitter.configs'.setup {
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 1,
}

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  }
}

require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
}

require("ibl").setup()

-- Peek lines just when you intend
require('numb').setup()

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'powerline_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
        {
                'filename',
                file_status = true,  -- displays file status (readonly status, modified status)
                path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 40 -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
        }
    },
    lualine_x = {},
    lualine_y = {'%l:%c|%L'},
    lualine_z = {}
  },
  extensions = {'quickfix', 'fugitive', 'fzf', 'nerdtree'}
}

require("nvim-gps").setup()

local gps = require("nvim-gps")

require("lualine").setup({
sections = {
    lualine_x = {
        { gps.get_location, condition = gps.is_available },
        'filetype'
        }
    }
})

require'nvim-web-devicons'.setup {}

-- get git(hub link) of line(s)
require"gitlinker".setup()

require('fold-preview').setup{}
require('hlslens').setup()

EOS
