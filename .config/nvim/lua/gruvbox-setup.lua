local ok, gruvbox = pcall(require, 'gruvbox')
if not ok then return end

gruvbox.setup({ contrast = 'hard' })

local function apply_overrides()
  vim.api.nvim_set_hl(0, '@function',             { fg = '#8ec07c', bold = true })
  vim.api.nvim_set_hl(0, '@function.method',      { fg = '#8ec07c', bold = true })
  vim.api.nvim_set_hl(0, '@function.call',        { fg = '#ebdbb2' })
  vim.api.nvim_set_hl(0, '@function.method.call', { fg = '#ebdbb2' })
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox',
  callback = apply_overrides,
})

vim.cmd.colorscheme('gruvbox')
apply_overrides()
