-- Taken from:
-- https://gist.github.com/mengwangk/570a6ceb8cd14e55f4d89ac865850418#file-init-vim-L102
--
-- Some resources:
-- https://neovim.io/doc/user/lua-guide.html#lua-guide

local nvim_lsp = require('lspconfig')

local servers = {
  'clangd',
  'pyright',
  'rust_analyzer',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end
