let mapleader=','

"To leave the cursor in the same column when you use Ctrl+D, Ctrl+F, Ctrl+B, Ctrl+U, G, H, M, L, gg
set nostartofline

"cursor always be at least 4 lines away from the top or bottom of the window
set scrolloff=4

set bg=dark
colorscheme gruvbox 

"for vim 8.2 on mac, delete key doesnt delete the previously written text
set backspace=indent,eol,start

"when changing buffer, hide the current buffer rather than throwing it away
set hidden

"set filetype on, filetype plugin on and filetype indent on
filetype plugin indent on

set tabstop=4

"show line numbers
set nu

"show relatuve line numebrs
set relativenumber

"toggle line numbers
nnoremap <Leader>sl :set invnumber<CR>

"toggle relativenumbers
nnoremap <Leader>rl :set invrelativenumber<CR>

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

"change ctrlp mapping
let g:ctrlp_map = '<C-S-L>'

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

"mapping for fzf to open files and buffers
nnoremap <C-P> :Files<CR>
nnoremap <Leader>l :Buffers<CR>

"make window movemnt more natura using shift arrows
nnoremap <S-Left> <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <S-Up> <C-W>k
nnoremap <S-Down> <C-W>j

nnoremap <M-Down> 7j
nnoremap <M-Up> 7k
nnoremap <M-Left> 4b
nnoremap <M-Right> 4w

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
" nnoremap <Leader>s <CR>:!git difftool --tool=vimdiff --no-prompt %<CR>
"close the current instance of vim - assuming that we are in diffmode, it will exit you from diffmmode and land at the place where vimdiff was invoked
" nnoremap <Leader>, :qa<CR>:copen<CR>
"open the next file from quickfix in diff mode
" nmap  <silent> <A-Down> :silent! qa<CR>:cp<CR><Leader>s
"open the prev file from quickfix in diff mode
" nmap <silent> <A-Up> :silent! qa<CR>:cn<CR><Leader>s
"load all modified files in quickfix window
" nnoremap <Leader>m :DiffRev<CR>

"map <silent> <Leader>p :qa<CR><CR>

autocmd BufNewFile,BufRead *.ts setlocal filetype=javascript

"let g:ale_completion_enabled = 1

" required for fzf
set rtp+=$fzf


" required for coc
"set rtp+=/Users/mammoth/.vim/pack/plugins/start/cocvim/plugin

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

"set complete options
set completeopt=menu,menuone,noinsert

"for deoplete
"set rtp+=/Users/mammoth/dotfiles/vim/.vim/pack/syntax/start/deoplete
"let g:deoplete#enable_at_startup = 1

"mapping language server.. needed for lsc
"let g:lsc_server_commands = {'python': 'pyls', 'javascript': 'typescript-language-server --stdio'}
" Setting a value to a blank string leaves that command unmapped:
"let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': ''}

"turn off disgonistics from lsc
let g:lsc_enable_diagnostics=v:false

"highlight references lsp
let g:lsp_highlight_references_enabled = 1

"for vimlsp and asyncomplete
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': [''],
        \ })
endif

if executable('rls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'allowlist': ['rust'],
        \ })
endif


augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> <Leader>gi <plug>(lsp-implementation)
    nmap <buffer> <Leader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction


" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0


"for lsc
let g:asyncomplete_auto_popup = 0
"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 1


"for vim git log
let g:GITLOG_default_mode = 2
map <silent> <f7> :call GITLOG_ToggleWindows()<cr>
map <silent> <f5> :call GITLOG_FlipWindows()<cr>


" GoTo code navigation for cocvim
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"coc ends her

"open nerdtree file browser
map <C-n> :NERDTreeToggle<CR>
map <C-S-n> :NERDTreeFind<CR>

"get file history(git) using tig
nnoremap <Leader>h :!tig %<CR>

"using a dedicated backup dir will prevent unrelated files in the working dir"
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//


" Disable default mappings of nnn
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>n :NnnPicker<CR>
"Start nnn in the current file's directory
nnoremap <leader>nn :NnnPicker '%:p:h'<CR>


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
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
