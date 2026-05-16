local ok, conform = pcall(require, 'conform')
if not ok then return end

conform.setup({
  formatters_by_ft = {
    python = { 'ruff_format', 'ruff_organize_imports' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    svelte = { 'prettierd' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    rust = { 'rustfmt' },
    zig = { 'zigfmt' },
    lua = { 'stylua' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    toml = { 'taplo' },
    terraform = { 'terraform_fmt' },
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>q', function()
  conform.format({ async = false, lsp_format = 'fallback' })
end, { desc = 'Format buffer/selection' })
