" SETTINGS START HERE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader key: useful to create extra set of shortcuts
" this is special variable, so adding it at the top regardless of the section
" it belong to
let mapleader=','

" To leave the cursor in the same column when you use Ctrl+D, Ctrl+F, Ctrl+B, Ctrl+U, G, H, M, L, gg
set nostartofline

" cursor always be at least 4 lines away from the top or bottom of the window
set scrolloff=4

" for vim 8.2 on mac, delete key doesnt delete the previously written text
set backspace=indent,eol,start

" when changing buffer, hide the current buffer rather than throwing it away
set hidden

" If this many milliseconds nothing is typed the swap file will be written to disk: default is 4000ms
set updatetime=100

" set filetype on, filetype plugin on and filetype indent on
filetype plugin indent on

" There are two things: the TAB character and pressing TAB key. How many
" columns a TAB character is worth, that is defined by the variable called
" tabstop. On the other hand, the variable softtabstop defines the TAB key,
" not the TAB character. softtabstop of 4 means that pressing TAB key will 
" insert 4 spaces and pressing backspace will delete 4 spaces. A setting of
" tabstop=8 and softtabstop=4 means that pressing TAB key once will insert 4
" spaces and hitting it once more will insert 4 more spaces but since 4+4=8
" equals the lenght of TAB character i.e. tabstop, vim will convert all 8
" spaces to one TAB character now
set softtabstop=4

" show line numbers
set nu

"show relatuve line numebrs
set relativenumber

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

" Set grep program. For Ack settings - use ripgrep as search program(default is usually grep)
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set gp=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m|
endif

set history=1000


" native completion of vim: set it to current buffer only 
set complete=.

" set complete options
set completeopt=menu,menuone,noinsert

" using a dedicated backup dir will prevent unrelated files in the working dir"
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//


" SETTINGS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MAPPINGS START HERE

" toggle line numbers
nnoremap <Leader>sl :set invnumber<CR>

" toggle relativenumbers
nnoremap <Leader>rl :set invrelativenumber<CR>

" This unsets the last search pattern register by hitting return
nnoremap <Leader>c :noh<CR>

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

" lines and characters movemnt for normal mode - short
nnoremap <S-M-Down> 3j
nnoremap <S-M-Up> 3k
nnoremap <S-M-Right> 10l
nnoremap <S-M-Left> 10h

" lines and characters movemnt for insert mode - short
inoremap <S-M-Down> <C-o>3j
inoremap <S-M-Up> <C-o>3k
inoremap <S-M-Right> <C-o>10l
inoremap <S-M-Left> <C-o>10h

" delete the current buffer
nnoremap <Leader>d :bd<CR>

" Highlight all instances of word under cursor, when idle. Function is defined
" in functions section
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"MAPPINGS END HERE

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

" Function to source only if file exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" FUNCTIONS END HERE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" non minimal settings"

call SourceIfExists("~/vimrcplus.vim")
