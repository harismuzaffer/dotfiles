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

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText guibg=#333333 guifg=#ffffff

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
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        {
                'filename',
                file_status = true,  -- displays file status (readonly status, modified status)
                path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 40 -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
        },
    },
    lualine_x = {
        function()
            return require("nvim-treesitter").statusline({
                indicator_size = 150,
                type_patterns = { "class", "function", "method" },
                separator = "  ",
            })
        end,
        'filetype',
    },
    lualine_y = {'%l:%c|%L', "progress"},
    lualine_z = {},
  },
  extensions = {'quickfix', 'fugitive', 'fzf', 'nerdtree'}
}

require'nvim-web-devicons'.setup {}

-- get git(hub link) of line(s)
require"gitlinker".setup()

require('fold-preview').setup{}
require('hlslens').setup()

local config = {
    -- at least one working provider is required
    -- to disable a provider set it to empty table like openai = {}
    providers = {
        openai = {
            disable = true,
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv("OPENAI_API_KEY"),
        },
        copilot = {
            disable = false,
            endpoint = "https://api.githubcopilot.com/chat/completions",
            secret = {
                "bash",
                "-c",
                "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
            },
        },
    },

    -- prefix for all commands
    cmd_prefix = "Gp",
    -- optional curl parameters (for proxy, etc.)
    -- curl_params = { "--proxy", "http://X.X.X.X:XXXX" }
    curl_params = {},

    -- log file location
    log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
    -- write sensitive data to log file for	debugging purposes (like api keys)
    log_sensitive = false,

    -- directory for persisting state dynamically changed by user (like model or persona)
    state_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/persisted",

    -- default agent names set during startup, if nil last used agent is used
    default_command_agent = nil,
    default_chat_agent = nil,

    -- default command agents (model + persona)
    -- name, model and system_prompt are mandatory fields
    -- to use agent for chat set chat = true, for command set command = true
    -- to remove some default agent completely set it like:
    -- agents = {  { name = "ChatGPT3-5", disable = true, }, ... },
    agents = {
        {
            name = "ChatGPT4o",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
            provider = "openai",
            name = "ChatGPT4o-mini",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
            provider = "copilot",
            name = "ChatCopilot",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
            provider = "openai",
            name = "CodeGPT4o",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
            provider = "openai",
            name = "CodeGPT4o-mini",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o-mini", temperature = 0.7, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n```",
        },
        {
            provider = "copilot",
            name = "CodeCopilot",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 0.8, top_p = 1, n = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").code_system_prompt,
        },
    },

    -- directory for storing chat files
    chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
    -- chat user prompt prefix
    chat_user_prefix = "💬:",
    -- chat assistant prompt prefix (static string or a table {static, template})
    -- first string has to be static, second string can contain template {{agent}}
    -- just a static string is legacy and the [{{agent}}] element is added automatically
    -- if you really want just a static string, make it a table with one element { "🤖:" }
    chat_assistant_prefix = { "🤖:", "[{{agent}}]" },
    -- The banner shown at the top of each chat file.
    chat_template = require("gp.defaults").chat_template,
    -- if you want more real estate in your chat files and don't need the helper text
    -- chat_template = require("gp.defaults").short_chat_template,
    -- chat topic generation prompt
    chat_topic_gen_prompt = "Summarize the topic of our conversation above"
    .. " in two or three words. Respond only with those words.",
    -- chat topic model (string with model name or table with model name and parameters)
    -- explicitly confirm deletion of a chat file
    chat_confirm_delete = true,
    -- conceal model parameters in chat
    chat_conceal_model_params = true,
    -- local shortcuts bound to the chat buffer
    -- (be careful to choose something which will work across specified modes)
    chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
    chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
    chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
    chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
    -- default search term when using :GpChatFinder
    chat_finder_pattern = "topic ",
    chat_finder_mappings = {
        delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-d>" },
    },
    -- if true, finished ChatResponder won't move the cursor to the end of the buffer
    chat_free_cursor = false,
    -- use prompt buftype for chats (:h prompt-buffer)
    chat_prompt_buf_type = false,

    -- how to display GpChatToggle or GpContext
    ---@type "popup" | "split" | "vsplit" | "tabnew"
    toggle_target = "vsplit",

    -- styling for chatfinder
    ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
    style_chat_finder_border = "single",
    -- margins are number of characters or lines
    style_chat_finder_margin_bottom = 8,
    style_chat_finder_margin_left = 1,
    style_chat_finder_margin_right = 2,
    style_chat_finder_margin_top = 2,
    -- how wide should the preview be, number between 0.0 and 1.0
    style_chat_finder_preview_ratio = 0.5,

    -- styling for popup
    ---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
    style_popup_border = "single",
    -- margins are number of characters or lines
    style_popup_margin_bottom = 8,
    style_popup_margin_left = 1,
    style_popup_margin_right = 2,
    style_popup_margin_top = 2,
    style_popup_max_width = 160,

    -- in case of visibility colisions with other plugins, you can increase/decrease zindex
    zindex = 49,

    -- command config and templates below are used by commands like GpRewrite, GpEnew, etc.
    -- command prompt prefix for asking user for input (supports {{agent}} template variable)
    command_prompt_prefix_template = "🤖 {{agent}} ~ ",
    -- auto select command response (easier chaining of commands)
    -- if false it also frees up the buffer cursor for further editing elsewhere
    command_auto_select_response = true,

    -- templates
    template_selection = "I have the following from {{filename}}:"
    .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}",
    template_rewrite = "I have the following from {{filename}}:"
    .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
    .. "\n\nRespond exclusively with the snippet that should replace the selection above.",
    template_append = "I have the following from {{filename}}:"
    .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
    .. "\n\nRespond exclusively with the snippet that should be appended after the selection above.",
    template_prepend = "I have the following from {{filename}}:"
    .. "\n\n```{{filetype}}\n{{selection}}\n```\n\n{{command}}"
    .. "\n\nRespond exclusively with the snippet that should be prepended before the selection above.",
    template_command = "{{command}}",

    -- image generation settings
    image = {
        -- you can disable image generation logic completely by image = {disable = true}
        disable = false,

        secret = os.getenv("OPENAI_API_KEY"),

        -- image prompt prefix for asking user for input (supports {{agent}} template variable)
        prompt_prefix_template = "🖌️ {{agent}} ~ ",
        -- image prompt prefix for asking location to save the image
        prompt_save = "🖌️💾 ~ ",
        -- default folder for saving images
        store_dir = (os.getenv("TMPDIR") or os.getenv("TEMP") or "/tmp") .. "/gp_images",
        -- default image agents (model + settings)
        -- to remove some default agent completely set it like:
        -- image.agents = {  { name = "DALL-E-3-1024x1792-vivid", disable = true, }, ... },
        agents = {
            {
                name = "DALL-E-3-1024x1024-vivid",
                model = "dall-e-3",
                quality = "standard",
                style = "vivid",
                size = "1024x1024",
            },
            {
                name = "DALL-E-3-1792x1024-vivid",
                model = "dall-e-3",
                quality = "standard",
                style = "vivid",
                size = "1792x1024",
            },
            {
                name = "DALL-E-3-1024x1792-vivid",
                model = "dall-e-3",
                quality = "standard",
                style = "vivid",
                size = "1024x1792",
            },
            {
                name = "DALL-E-3-1024x1024-natural",
                model = "dall-e-3",
                quality = "standard",
                style = "natural",
                size = "1024x1024",
            },
            {
                name = "DALL-E-3-1792x1024-natural",
                model = "dall-e-3",
                quality = "standard",
                style = "natural",
                size = "1792x1024",
            },
            {
                name = "DALL-E-3-1024x1792-natural",
                model = "dall-e-3",
                quality = "standard",
                style = "natural",
                size = "1024x1792",
            },
            {
                name = "DALL-E-3-1024x1024-vivid-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "vivid",
                size = "1024x1024",
            },
            {
                name = "DALL-E-3-1792x1024-vivid-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "vivid",
                size = "1792x1024",
            },
            {
                name = "DALL-E-3-1024x1792-vivid-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "vivid",
                size = "1024x1792",
            },
            {
                name = "DALL-E-3-1024x1024-natural-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "natural",
                size = "1024x1024",
            },
            {
                name = "DALL-E-3-1792x1024-natural-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "natural",
                size = "1792x1024",
            },
            {
                name = "DALL-E-3-1024x1792-natural-hd",
                model = "dall-e-3",
                quality = "hd",
                style = "natural",
                size = "1024x1792",
            },
        },
    },

    -- example hook functions (see Extend functionality section in the README)
    hooks = {
        -- GpInspectPlugin provides a detailed inspection of the plugin state
        InspectPlugin = function(plugin, params)
            local bufnr = vim.api.nvim_create_buf(false, true)
            local copy = vim.deepcopy(plugin)
            local key = copy.config.openai_api_key or ""
            copy.config.openai_api_key = key:sub(1, 3) .. string.rep("*", #key - 6) .. key:sub(-3)
            local plugin_info = string.format("Plugin structure:\n%s", vim.inspect(copy))
            local params_info = string.format("Command params:\n%s", vim.inspect(params))
            local lines = vim.split(plugin_info .. "\n" .. params_info, "\n")
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
            vim.api.nvim_win_set_buf(0, bufnr)
        end,

        -- GpInspectLog for checking the log file
        InspectLog = function(plugin, params)
            local log_file = plugin.config.log_file
            local buffer = plugin.helpers.get_buffer(log_file)
            if not buffer then
                vim.cmd("e " .. log_file)
            else
                vim.cmd("buffer " .. buffer)
            end
        end,

        -- GpImplement rewrites the provided selection/range based on comments in it
        Implement = function(gp, params)
            local template = "Having following from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please rewrite this according to the contained instructions."
            .. "\n\nRespond exclusively with the snippet that should replace the selection above."

            local agent = gp.get_command_agent()
            gp.logger.info("Implementing selection with agent: " .. agent.name)

            gp.Prompt(
            params,
            gp.Target.rewrite,
            agent,
            template,
            nil, -- command will run directly without any prompting for user input
            nil -- no predefined instructions (e.g. speech-to-text from Whisper)
            )
        end,

        -- your own functions can go here, see README for more examples like
        -- :GpExplain, :GpUnitTests.., :GpTranslator etc.

        -- -- example of making :%GpChatNew a dedicated command which
        -- -- opens new chat with the entire current buffer as a context
        -- BufferChatNew = function(gp, _)
        -- 	-- call GpChatNew command in range mode on whole buffer
        -- 	vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        -- end,

        -- -- example of adding command which opens new chat dedicated for translation
        -- Translator = function(gp, params)
        -- 	local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
        -- 	gp.cmd.ChatNew(params, chat_system_prompt)
        --
        -- 	-- -- you can also create a chat with a specific fixed agent like this:
        -- 	-- local agent = gp.get_chat_agent("ChatGPT4o")
        -- 	-- gp.cmd.ChatNew(params, chat_system_prompt, agent)
        -- end,

        -- -- example of adding command which writes unit tests for the selected code
        -- UnitTests = function(gp, params)
        -- 	local template = "I have the following code from {{filename}}:\n\n"
        -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
        -- 		.. "Please respond by writing table driven unit tests for the code above."
        -- 	local agent = gp.get_command_agent()
        -- 	gp.Prompt(params, gp.Target.enew, agent, template)
        -- end,

        -- -- example of adding command which explains the selected code
        -- Explain = function(gp, params)
        -- 	local template = "I have the following code from {{filename}}:\n\n"
        -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
        -- 		.. "Please respond by explaining the code above."
        -- 	local agent = gp.get_chat_agent()
        -- 	gp.Prompt(params, gp.Target.popup, agent, template)
        -- end,
    },
}

require("gp").setup(config)

EOS
