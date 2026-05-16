local ok, lualine = pcall(require, 'lualine')
if not ok then return end

lualine.setup({
  options = {
    theme = 'gruvbox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_z = { 'tabs' },
  },
})
