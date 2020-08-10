let mapleader=','

"for vim 8.2 on mac, delete key doesnt delete the previously written text
set backspace=indent,eol,start

"when changing buffer, hide the current buffer rather than throwing it away
set hidden

"set filetype on, filetype plugin on and filetype indent on
filetype plugin indent on

set tabstop=4

"show line numbers
set nu

"max number of tabs - if max crossed, new tab will hide the oldest one
set tabpagemax=10

"expand tabs to spaces
set expandtab

"how much to shift when indenting
set shiftwidth=4

"hightlight the matches when searching
set hlsearch

"always show a cursor line
set cursorline

"tab completion
set wildmenu

set wildmode=list:longest,full

"find command will find files in the paths: '.' and ',,' and '**'. '.' means dir of the file, ',,' means the current working dir, and '**' means each directory under the current working  directory
set path=.,,**

"syntax highlighting
syntax on

"CtrlP and ack.vim settings - use ripgrep as search program(default is usually grep)
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
  let g:ackprg = 'rg --vimgrep'
endif
"always start CtrlP with the current directory
let g:ctrlp_cmd='CtrlP :pwd'

if executable('rg') | 
    set gp=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m|
endif
set history=1000

"This unsets the "last search pattern" register by hitting return
nnoremap <Leader>c :noh<CR><CR>

"open next result from quickfix results
nnoremap <F1> :cn<CR>zz

"open previous result from quickfix results
nnoremap <F2> :cp<CR>zz

"in quickfix window, F3 will open the file under cursor, center the screen and focus back to quickfix window
nnoremap <F3> <CR>zz<C-W>p<Down>

"vimgrep shortcut 
nnoremap <F4> :vimgrep<space>

"vimgrep shortcut: new tab
nnoremap <F5> :tabnew<CR>:vimgrep<space>

"F6 will open buffer list. Upon inputting buffer number, that buffer will open
nnoremap <F6> :buffers<CR>:buffer<Space>

"open quickfix window
nnoremap <Leader>q :copen<CR>

"open CtrlP to search from buffers list
nnoremap <Leader>l :CtrlPBuffer<CR>

"make window movemnt more natura using shift arrows
nnoremap <S-Left> <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <S-Up> <C-W>k
nnoremap <S-Down> <C-W>j

"delete the current buffer
nnoremap <Leader>d :bd<CR>



let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files()
  let list = map(split(system(
              \ 'git diff --name-status HEAD'), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=0 DiffRev call s:get_diff_files()

"open vimdiff for the file under cursor in quickfix window"
nnoremap <Leader>s <CR>:!git difftool --tool=vimdiff --no-prompt %<CR>
"close the current instance of vim - assuming that we are in diffmode, it will exit you from diffmmode and land at the place where vimdiff was invoked
nnoremap <Leader>, :qa<CR>:copen<CR>
"open the next file from quickfix in diff mode
nmap  <silent> <A-Down> :silent! qa<CR>:cp<CR><Leader>s
"open the prev file from quickfix in diff mode
nmap <silent> <A-Up> :silent! qa<CR>:cn<CR><Leader>s
"load all modified files in quickfix window
nnoremap <Leader>m :DiffRev<CR>

map <silent> <Leader>p :qa<CR><CR>

autocmd BufNewFile,BufRead *.ts setlocal filetype=javascript

"let g:ale_completion_enabled = 1

" required for fzf
set rtp+=/usr/local/opt/fzf

"to toggle tags window
nmap <F8> :TagbarToggle<CR>

"for gutentags, exlcude these file types
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.yml', '*.json', '*.scss', '*.less', 'node_modules']
let g:gutentags_cache_dir = '~/code/gutentags'

"go to definition with ctrlp
map <silent> <leader>jd :CtrlPTag<cr><c-\>w

"go to def using fzf tags
nnoremap <silent> <Leader>gd :Tags <C-R><C-W><CR>

"find the word under cursor in all files
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

"tags in the budder
nnoremap <leader>tb :BTags<CR>

"tags in the project
nnoremap <leader>tp :Tags<CR>

"prevent completion from tags and included files
set complete=.

"for deoplete
let g:deoplete#enable_at_startup = 1
