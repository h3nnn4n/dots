local ok, persistence = pcall(require, 'persistence')
if not ok then return end

persistence.setup()

local session_dir = vim.fn.stdpath('state') .. '/sessions/'
local e = vim.fn.fnameescape

_G.save_named_session = function()
  local name = vim.fn.input('Session name: ')
  if name == '' then return end
  local cwd = vim.fn.getcwd():gsub('[\\/:]+', '%%')
  local file = session_dir .. cwd .. '%%' .. name:gsub('[\\/:]+', '%%') .. '.vim'
  vim.cmd('mks! ' .. e(file))
  print('Saved session: ' .. name)
end

_G.load_named_session = function()
  local cwd = vim.fn.getcwd():gsub('[\\/:]+', '%%')
  local sessions = vim.fn.glob(session_dir .. cwd .. '%%*.vim', true, true)
  if #sessions == 0 then
    print('No named sessions for this directory')
    return
  end
  local items = {}
  for _, s in ipairs(sessions) do
    local name = s:match('%%(.-)%.vim$') or s
    items[#items + 1] = name
  end
  vim.ui.select(items, { prompt = 'Load session:' }, function(item)
    if item then
      local file = session_dir .. cwd .. '%%' .. item .. '.vim'
      vim.cmd('silent! source ' .. e(file))
    end
  end)
end

vim.keymap.set('n', '<leader>ss', _G.save_named_session, { desc = 'Session: save named' })
vim.keymap.set('n', '<leader>sl', function() persistence.load() end,
  { desc = 'Session: load last for cwd' })
vim.keymap.set('n', '<leader>sL', _G.load_named_session, { desc = 'Session: load named' })
vim.keymap.set('n', '<leader>sp', function() persistence.select() end,
  { desc = 'Session: pick from list' })
vim.keymap.set('n', '<leader>sq', function() persistence.stop() end,
  { desc = 'Session: stop auto-saving' })
vim.keymap.set('n', '<leader>sr', function() persistence.start() end,
  { desc = 'Session: resume auto-saving' })
