-- Taken from:
-- https://gist.github.com/mengwangk/570a6ceb8cd14e55f4d89ac865850418#file-init-vim-L102
--
-- Some resources:
-- https://neovim.io/doc/user/lua-guide.html#lua-guide
-- Updated to use vim.lsp.config (nvim 0.11+) instead of deprecated lspconfig

local servers = {
  'clangd',
  'pyright',
  'rust_analyzer',
}

-- Enable LSP servers using the new vim.lsp API
vim.lsp.enable(servers)
