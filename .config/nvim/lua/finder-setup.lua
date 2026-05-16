if vim.g.use_fzf_lua == nil then
  vim.g.use_fzf_lua = false
end

local LHS = { '<leader>f', '<leader>F', '<leader>l', '<leader>L', '<leader>/', '<leader>rg' }

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
end

local function apply_fzf_lua()
  unmap_all()
  map('<leader>f',  '<cmd>FzfLua git_files<cr>',  'Git files (fzf-lua)')
  map('<leader>F',  '<cmd>FzfLua files<cr>',      'All files (fzf-lua)')
  map('<leader>l',  '<cmd>FzfLua blines<cr>',     'Buffer lines (fzf-lua)')
  map('<leader>L',  '<cmd>FzfLua lines<cr>',      'All lines (fzf-lua)')
  map('<leader>/',  '<cmd>FzfLua live_grep<cr>',  'Live grep (fzf-lua)')
  map('<leader>rg', '<cmd>FzfLua grep_cword<cr>', 'Rg word under cursor (fzf-lua)')
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
