local servers = {
  'pyright', 'ts_ls', 'clangd', 'svelte', 'rust_analyzer',
  'zls', 'lua_ls', 'terraformls', 'bashls', 'taplo', 'yamlls',
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})
require('mason-tool-installer').setup({
  ensure_installed = {
    'ruff', 'eslint_d', 'prettierd', 'clang-format',
    'stylua', 'shfmt', 'shellcheck',
  },
})

local ok_blink, blink = pcall(require, 'blink.cmp')
if ok_blink then
  vim.lsp.config('*', { capabilities = blink.get_lsp_capabilities() })
end

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
