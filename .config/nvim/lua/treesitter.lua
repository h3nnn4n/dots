local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not ok then return end

nvim_treesitter.setup({})

nvim_treesitter.install({
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
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf = args.buf
    if not pcall(vim.treesitter.start, buf) then return end
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
vim.opt.foldlevel = 99
