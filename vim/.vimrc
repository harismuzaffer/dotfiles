" SETTINGS START HERE

" leader key: useful to create extra set of shortcuts
" this is special variable, so adding it at the top regardless of the section
" it belong to
let mapleader=','

" To leave the cursor in the same column when you use Ctrl+D, Ctrl+F, Ctrl+B, Ctrl+U, G, H, M, L, gg
set nostartofline

" cursor always be at least 4 lines away from the top or bottom of the window
set scrolloff=4

set bg=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox 

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" for vim 8.2 on mac, delete key doesnt delete the previously written text
set backspace=indent,eol,start

" when changing buffer, hide the current buffer rather than throwing it away
set hidden

" set filetype on, filetype plugin on and filetype indent on
filetype plugin indent on

" when hitting Tab/Backspace keys, how far should cursor move...This is
" different from length of Tab character. When expandtab is on, then there will
" be no Tab character at all- meaning hitting Tab key will enter spaces...equivalent
" to the number specified in softtabstop. If expandtab is off, then hitting Tab
" will enter both, the Tab characters and spaces depending on the value of
" tabstop. For example, if tabstop is 8 and softtabstop is 4, then hitting Tab
" key will enter 4 spaces first time then on second hit, it will convert all
" the 8 spaces into one Tab character. Hitting Tab 5 times will enter 2 Tab
" characters and 4 spaces.
set tabstop=4

" show line numbers
set nu

"show relatuve line numebrs
set relativenumber


" max number of tabs - if max crossed, new tab will hide the oldest one
set tabpagemax=10

" expand tabs to spaces
set expandtab

" how much to shift when indenting
set shiftwidth=4

" hightlight the matches when searching
set hlsearch

" always show a cursor line
set cursorline

" tab completion
set wildmenu

" When more than one match, list all matches and complete till longest common string then each full match
set wildmode=list:longest,full

" find command will find files in the paths: '.' and ',,' and '**'. '.' means dir of the file, 
" ',,' means the current working dir, and '**' means each directory under the current working  directory
set path=.,,**

" syntax highlighting
syntax on

" line number coloring
highlight LineNr guifg=#6A6C69

" Set grep program. For Ack settings - use ripgrep as search program(default is usually grep)
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set gp=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m|
endif

set history=1000

" required for fzf. Make sure you have fzf path set in your bashrc, zsh etc
set rtp+=$fzf

" native completion of vim: set it to current buffer only 
set complete=.

" set complete options
set completeopt=menu,menuone,noinsert

" using a dedicated backup dir will prevent unrelated files in the working dir"
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" this is a temp hack. Pressing the escape key has a slight delay.
set ttimeoutlen=2

" SETTINGS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MAPPINGS START HERE

" toggle line numbers
nnoremap <Leader>sl :set invnumber<CR>

" toggle relativenumbers
nnoremap <Leader>rl :set invrelativenumber<CR>

" This unsets the last search pattern register by hitting return
nnoremap <Leader>c :noh<CR><CR>

" open next result from quickfix results
nnoremap <F1> :cn<CR>zz

" open previous result from quickfix results
nnoremap <F2> :cp<CR>zz

" in quickfix window, F3 will open the file under cursor, center the screen and focus back to quickfix window
nnoremap <F3> <CR>zz<C-W>p<Down>

" vimgrep shortcut 
nnoremap <F4> :vimgrep<space>

" vimgrep shortcut: new tab
nnoremap <F5> :tabnew<CR>:vimgrep<space>

" open buffer list. Upon inputting buffer number, that buffer will open
nnoremap <F6> :buffers<CR>:buffer<Space>

" open quickfix window
nnoremap <Leader>q :copen<CR>

" mapping for fzf to open files and buffers
nnoremap <C-P> :Files<CR>
nnoremap <Leader>l :Buffers<CR>

" make window movemnt more natura using shift arrows
nnoremap <S-Left> <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <S-Up> <C-W>k
nnoremap <S-Down> <C-W>j

" Maximize the current window
nnoremap <C-W>M <C-W>\| <C-W>_
" Restore window width and height 
nnoremap <C-W>m <C-W>=

" lines and characters movemnt for normal mode
nnoremap <M-Down> 7j
nnoremap <M-Up> 7k
nnoremap <M-Right> 25l
nnoremap <M-Left> 25h

" lines and characters movemnt for insert mode
inoremap <M-Down> <C-o>7j
inoremap <M-Up> <C-o>7k
inoremap <M-Right> <C-o>25l
inoremap <M-Left> <C-o>25h

" delete the current buffer
nnoremap <Leader>d :bd<CR>

" go to def using fzf tags
nnoremap <silent> <Leader>gdd :Tags <C-R><C-W><CR>

" find the word under cursor in all files
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" browse tags in the buffer
nnoremap <leader>tb :BTags<CR>

" browse tags in the project
nnoremap <leader>tp :Tags<CR>

" toggle tags window
nmap <F8> :TagbarToggle<CR>

" coc.nvim config starts
" GoTo code navigation for cocvim
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>


" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc ends here

"get file history(git) using tig
nnoremap <Leader>h :!tig %<CR>

" nnn file manager
nnoremap <silent> <leader>n :NnnPicker<CR>
"Start nnn in the current file's directory
nnoremap <leader>nn :NnnPicker '%:p:h'<CR>

" Highlight all instances of word under cursor, when idle. Function is defined
" in functions section
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"MAPPINGS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SET VARIABLES START HERE

" for gutentags, exlcude these file types
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.yml', '*.json', '*.scss', '*.less', 'node_modules']
" cache dir for gutentags
let g:gutentags_cache_dir = '~/.gutentags'

" when should ALE lint
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 1

" new version of fzf comes with a new layout which is buggy, keeping the old
" which is also better
let g:fzf_layout = { 'down': '45%' }

" SET VARIABLES END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AUTOCOMMANDS START HERE

" ts files are not being recognised. This is just a hack
autocmd BufNewFile,BufRead *.ts setlocal filetype=javascript

" AUTOCOMMANDS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FUNCTIONS START HERE

" function to toggle auto highlighting of word under cursor
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

" coc vim function to show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" FUNCTIONS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
