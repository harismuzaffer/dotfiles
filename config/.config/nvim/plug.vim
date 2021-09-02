let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" productivity
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'psliwka/vim-smoothie'
Plug 'vimwiki/vimwiki'
Plug 'RRethy/vim-illuminate'
Plug 'mhinz/vim-signify'
Plug 'wfxr/minimap.vim'
Plug 'ggVGc/vim-fuzzysearch'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'pechorin/any-jump.vim'
Plug 'ggandor/lightspeed.nvim'
Plug 'nacro90/numb.nvim'

" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context'
Plug 'windwp/nvim-ts-autotag'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'Vimjas/vim-python-pep8-indent'

" colors
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
