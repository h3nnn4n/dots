local ok, alpha = pcall(require, 'alpha')
if not ok then return end

local startify = require('alpha.themes.startify')

local session_buttons = {
  startify.button('s', '  Restore session for cwd',
    '<cmd>lua require("persistence").load()<cr>'),
  startify.button('S', '  Select session',
    '<cmd>lua require("persistence").select()<cr>'),
}

for i, btn in ipairs(session_buttons) do
  table.insert(startify.section.top_buttons.val, i, btn)
end

alpha.setup(startify.config)
