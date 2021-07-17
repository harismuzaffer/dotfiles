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
nnoremap <CR> :Rg<CR>

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
nmap <Leader>/ :RgRaw -F 
vmap <Leader>// <Plug>RgRawVisualSelection
nmap <Leader>/// <Plug>RgRawWordUnderCursor


" toggle tags window
nmap <F8> :TagbarToggle<CR>

" toggle Vista
nmap <F7> :Vista!!<CR>
"COC setting starts here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" coc.nvim config starts
" GoTo code navigation for cocvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" for refactoring. This needs external tools. e.g. for python, installing
" coc-pyright is enough
nmap <leader>rn <Plug>(coc-rename)


" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" COC setting ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" get file history(git) using tig
nnoremap <Leader>h :!tig %<CR>

" nnn file manager
nnoremap <silent> <leader>n :NnnPicker<CR>
"Start nnn in the current file's directory
nnoremap <leader>nn :NnnPicker '%:p:h'<CR>

" minimap mappings 
nnoremap <Leader>mm :MinimapToggle<CR>

" Signify mappings
nnoremap <leader>hd :SignifyDiff<cr>
nnoremap <leader>hp :SignifyHunkDiff<cr>
nnoremap <leader>hu :SignifyHunkUndo<cr>

" fuzzysearch
nnoremap // :FuzzySearch<CR>

" vim illuminate: whitelist only these file type
let g:Illuminate_ftwhitelist = ['javascript', 'python', 'rust']

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

" doge: documentation generator
let g:doge_enable_mappings = 0
nmap <Leader>gd <Plug>(doge-generate)
