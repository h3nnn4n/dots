local ok, persistence = pcall(require, 'persistence')
if not ok then return end

persistence.setup()

vim.keymap.set('n', '<leader>sl', function() persistence.load() end,
  { desc = 'Session: load last for cwd' })
vim.keymap.set('n', '<leader>sp', function() persistence.select() end,
  { desc = 'Session: pick from list' })
vim.keymap.set('n', '<leader>sq', function() persistence.stop() end,
  { desc = 'Session: stop saving for this cwd' })
