local ok, alpha = pcall(require, 'alpha')
if not ok then return end

local startify = require('alpha.themes.startify')

local dashboard_buttons = {
  startify.button('s', '  Restore session for cwd',
    '<cmd>lua require("persistence").load()<cr>'),
  startify.button('S', '  Select session',
    '<cmd>lua require("persistence").select()<cr>'),
  startify.button('n', '  Save named session',
    '<cmd>lua _G.save_named_session()<cr>'),
  startify.button('N', '  Load named session',
    '<cmd>lua _G.load_named_session()<cr>'),
  startify.button('?', '  Coding cheatsheet',
    '<cmd>help coding-cheatsheet<cr>'),
  startify.button('a', '  AI cheatsheet',
    '<cmd>help ai-cheatsheet<cr>'),
}

for i, btn in ipairs(dashboard_buttons) do
  table.insert(startify.section.top_buttons.val, i, btn)
end

alpha.setup(startify.config)
