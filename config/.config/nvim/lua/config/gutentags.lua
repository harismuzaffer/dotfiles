local M = {}

function M.setup()
  vim.g.gutentags_ctags_exclude = {
    '*.git', '*.svg', '*.hg', 'build', 'dist',
    '*sites/*/files/*', 'bin', 'node_modules', 'bower_components',
    'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor',
    '*.md', '*-lock.json', '*.lock', '*bundle*.js', '*build*.js',
    '.*rc*', '*.json', '*.min.*', '*.map', '*.bak', '*.zip', '*.pyc',
    '*.class', '*.sln', '*.Master', '*.csproj', '*.tmp', '*.csproj.user',
    '*.cache', '*.pdb', 'tags*', 'cscope.*', '*.css', '*.less', '*.scss',
    '*.exe', '*.dll', '*.mp3', '*.ogg', '*.flac', '*.swp', '*.swo',
    '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.rar', '*.zip', '*.tar',
    '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.pdf', '*.doc', '*.docx',
    '*.ppt', '*.pptx',
  }

  local cache_dir = vim.fn.stdpath("data") .. '/gutentags'
  vim.fn.mkdir(cache_dir, "p")  -- Ensure the directory exists
  vim.g.gutentags_cache_dir = cache_dir
  vim.g.gutentags_project_root = { 'package.json', '.git' }
  vim.g.gutentags_generate_on_new = true
  vim.g.gutentags_generate_on_missing = true
  vim.g.gutentags_generate_on_write = true
  vim.g.gutentags_generate_on_empty_buffer = true
  vim.cmd(string.format([[
    command! -nargs=0 GutentagsClearCache call system('rm -rf %s/*')
  ]], vim.fn.shellescape(cache_dir)))
  vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', '--output-format=u-ctags' }
end

return M

