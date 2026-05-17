local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup({
  ensure_installed = {
    'python',
    'lua',
    'ruby',
    'rust',
    'c',
    'hcl',
    'yaml',
    'toml',
    'bash',
    'sql',
    'typescript',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
    'query',
  },
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.cindent = false
    if not vim.bo.indentkeys:find('0<CR>') then
      vim.bo.indentkeys = vim.bo.indentkeys .. ',0<CR>'
    end
  end,
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
vim.opt.foldlevel = 99
