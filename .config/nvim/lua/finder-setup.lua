if vim.g.use_fzf_lua == nil then
  vim.g.use_fzf_lua = false
end

local ok_fzf, fzf_lua = pcall(require, 'fzf-lua')
if ok_fzf then
  fzf_lua.setup({ winopts = { fullscreen = true, preview = { layout = 'vertical' } } })
end

local LHS = { '<leader>f', '<leader>F', '<leader>l', '<leader>L', '<leader>/', '<leader>rg', '<leader>gs', '<leader>gu', '<leader>gt', '<leader>gc' }

local function unmap_all()
  for _, lhs in ipairs(LHS) do
    pcall(vim.keymap.del, 'n', lhs)
  end
end

local function map(lhs, rhs, desc, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  opts.desc = desc
  vim.keymap.set('n', lhs, rhs, opts)
end

local function apply_fzf()
  unmap_all()
  map('<leader>f',  '<cmd>GFiles<cr>',           'Git files')
  map('<leader>F',  '<cmd>Files<cr>',            'All files')
  map('<leader>l',  '<cmd>BLines<cr>',           'Buffer lines')
  map('<leader>L',  '<cmd>Lines<cr>',            'All lines')
  map('<leader>/',  ':Rg<Space>',                'Rg prompt', { silent = false })
  map('<leader>rg', ':Rg <C-R><C-W><CR>',        'Rg word under cursor')
  map('<leader>gs', ":call fzf#run(fzf#wrap({'source': 'git diff --cached --name-only', 'sink': 'e'}))<cr>", 'Git staged')
  map('<leader>gu', ":call fzf#run(fzf#wrap({'source': 'git diff --name-only', 'sink': 'e'}))<cr>", 'Git unstaged')
  map('<leader>gt', ":call fzf#run(fzf#wrap({'source': 'git ls-files --others --exclude-standard', 'sink': 'e'}))<cr>", 'Git untracked')
  map('<leader>gc', '<cmd>GFiles?<cr>', 'Git changes (all uncommitted)')
end

local function apply_fzf_lua()
  unmap_all()
  map('<leader>f',  '<cmd>FzfLua git_files<cr>',  'Git files (fzf-lua)')
  map('<leader>F',  '<cmd>FzfLua files<cr>',      'All files (fzf-lua)')
  map('<leader>l',  '<cmd>FzfLua blines<cr>',     'Buffer lines (fzf-lua)')
  map('<leader>L',  '<cmd>FzfLua lines<cr>',      'All lines (fzf-lua)')
  map('<leader>/',  '<cmd>FzfLua live_grep<cr>',  'Live grep (fzf-lua)')
  map('<leader>rg', '<cmd>FzfLua grep_cword<cr>', 'Rg word under cursor (fzf-lua)')
  map('<leader>gs', "<cmd>lua require('fzf-lua').fzf_exec('git diff --cached --name-only', { actions = { ['default'] = require('fzf-lua').actions.file_edit } })<cr>", 'Git staged (fzf-lua)')
  map('<leader>gu', "<cmd>lua require('fzf-lua').fzf_exec('git diff --name-only', { actions = { ['default'] = require('fzf-lua').actions.file_edit } })<cr>", 'Git unstaged (fzf-lua)')
  map('<leader>gt', "<cmd>lua require('fzf-lua').fzf_exec('git ls-files --others --exclude-standard', { actions = { ['default'] = require('fzf-lua').actions.file_edit } })<cr>", 'Git untracked (fzf-lua)')
  map('<leader>gc', '<cmd>FzfLua git_status<cr>', 'Git changes (fzf-lua)')
end

local function activate()
  if vim.g.use_fzf_lua then apply_fzf_lua() else apply_fzf() end
end

activate()

vim.api.nvim_create_user_command('FinderFzf', function()
  vim.g.use_fzf_lua = false
  activate()
  vim.notify('Finder → fzf.vim', vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command('FinderFzfLua', function()
  vim.g.use_fzf_lua = true
  activate()
  vim.notify('Finder → fzf-lua', vim.log.levels.INFO)
end, {})
