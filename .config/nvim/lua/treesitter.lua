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
