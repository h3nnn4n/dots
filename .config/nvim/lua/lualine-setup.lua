local ok, lualine = pcall(require, 'lualine')
if not ok then return end

lualine.setup({
  options = {
    theme = 'gruvbox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } },
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_z = { 'tabs' },
  },
})
