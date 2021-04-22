set bg=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox 

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" required for fzf. Make sure you have fzf path set in your bashrc, zsh etc
set rtp+=$fzf

" this is a temp hack. Pressing the escape key has a slight delay.
set ttimeoutlen=2

"FZF setting starts here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mapping for fzf to open files and buffers
nnoremap <C-P> :Files<CR>
nnoremap <Leader>l :Buffers<CR>

" go to def using fzf tags
nnoremap <silent> <Leader>gdd :Tags <C-R><C-W><CR>

" find the word under cursor in all files
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" browse tags in the buffer
nnoremap <leader>tb :BTags<CR>

" browse tags in the project
nnoremap <leader>tp :Tags<CR>

"FZF setting ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle tags window
nmap <F8> :TagbarToggle<CR>

"COC setting starts here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"COC setting ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"get file history(git) using tig
nnoremap <Leader>h :!tig %<CR>

" nnn file manager
nnoremap <silent> <leader>n :NnnPicker<CR>
"Start nnn in the current file's directory
nnoremap <leader>nn :NnnPicker '%:p:h'<CR>

" jq command to parse json
if (executable("jq"))
    nnoremap <Leader>jq :%! jq .<CR>
endif

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
" which is better
let g:fzf_layout = { 'down': '45%' }

