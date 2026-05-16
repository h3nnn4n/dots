local ok, lint = pcall(require, 'lint')
if not ok then return end

lint.linters_by_ft = {
  python = { 'ruff' },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  svelte = { 'eslint_d' },
  sh = { 'shellcheck' },
  bash = { 'shellcheck' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
  callback = function() lint.try_lint() end,
})
