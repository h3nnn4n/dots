local ok, blink = pcall(require, 'blink.cmp')
if not ok then return end

blink.setup({
  keymap = { preset = 'default' },
  appearance = {
    use_nvim_cmp_as_default = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'minuet' },
    providers = {
      minuet = {
        name = 'minuet',
        module = 'minuet.blink',
        score_offset = 8,
        async = true,
        timeout_ms = 3000,
      },
    },
  },
  completion = {
    trigger = { prefetch_on_insert = false },
    menu = {
      auto_show = true,
      draw = {
        treesitter = {},
      },
    },
    documentation = { auto_show = false },
  },
})

local function set_cmp_hls()
  local bg1, bg2, bg3 = '#3c3836', '#504945', '#665c54'
  local fg, fg_light = '#ebdbb2', '#fbf1c7'

  vim.api.nvim_set_hl(0, 'Pmenu',      { bg = bg1, fg = fg })
  vim.api.nvim_set_hl(0, 'PmenuSel',   { bg = bg2, fg = fg_light, bold = true })
  vim.api.nvim_set_hl(0, 'PmenuSbar',  { bg = bg1 })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = bg3 })

  vim.api.nvim_set_hl(0, 'BlinkCmpMenu',             { link = 'Pmenu' })
  vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection',    { link = 'PmenuSel' })
  vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder',       { fg = bg3, bg = bg1 })
  vim.api.nvim_set_hl(0, 'BlinkCmpLabel',            { bg = bg1, fg = fg })
  vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch',       { bg = bg1, fg = '#fabd2f', bold = true })
  vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated',  { bg = bg1, fg = bg3, strikethrough = true })
  vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { bg = bg1, fg = bg3 })
  vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail',      { bg = bg1, fg = bg3 })
  vim.api.nvim_set_hl(0, 'BlinkCmpKind',             { bg = bg1, fg = '#83a598' })
  vim.api.nvim_set_hl(0, 'BlinkCmpSource',           { bg = bg1, fg = bg3 })

  -- vim-trailing-whitespace's red match was bleeding into the menu padding.
  vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'NONE' })
end

set_cmp_hls()
vim.api.nvim_create_autocmd('ColorScheme', { callback = set_cmp_hls })
