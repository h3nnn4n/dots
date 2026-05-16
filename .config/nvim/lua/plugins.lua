-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Defaults to load everything eagerly, matching vim-plug behavior.
  -- Opt into lazy-loading per-plugin later by adding `event=`, `ft=`, `cmd=`, `keys=` etc.
  defaults = { lazy = false },

  spec = {
    -- Editor essentials
    'editorconfig/editorconfig-vim',
    'embear/vim-localvimrc',
    'wellle/context.vim',

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', branch = 'master', build = ':TSUpdate' },
    'romgrk/nvim-treesitter-context',

    -- Icons / filetype syntax
    'ryanoasis/vim-devicons',
    'HerringtonDarkholme/yats.vim',
    'cespare/vim-toml',
    'tikhomirov/vim-glsl',

    -- Snippets (kept; expansion via <C-k>)
    'Shougo/neosnippet.vim',
    'Shougo/neosnippet-snippets',

    -- Completion
    { 'saghen/blink.cmp', version = '*' },

    -- LSP / linter / formatter management
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'stevearc/conform.nvim',
    'mfussenegger/nvim-lint',

    -- Folding
    'Konfekt/FastFold',
    'tmhedberg/SimpylFold',

    -- Git
    'tpope/vim-fugitive',
    'airblade/vim-gitgutter',

    -- Django / Ruby / YAML
    'vim-scripts/django.vim',
    'vim-ruby/vim-ruby',
    'tpope/vim-rails',
    { 'tpope/vim-rbenv', ft = 'ruby' },
    { 'tpope/vim-bundler', ft = 'ruby' },
    'stephpy/vim-yaml',

    -- Misc utilities
    'mbbill/undotree',
    'vim-scripts/a.vim',
    'machakann/vim-highlightedyank',
    'mhinz/vim-startify',
    'myusuf3/numbers.vim',
    'bronson/vim-trailing-whitespace',
    'godlygeek/tabular',
    'jeetsukumaran/vim-buffergator',
    'scrooloose/nerdcommenter',

    -- UI
    'morhetz/gruvbox',
    'scrooloose/nerdtree',
    'tpope/vim-surround',
    'easymotion/vim-easymotion',
    { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
    'junegunn/fzf.vim',
    'bling/vim-airline',
    'nathanaelkane/vim-indent-guides',
    'kien/rainbow_parentheses.vim',

    -- LSP
    'neovim/nvim-lspconfig',

    -- Keymap discoverability
    'folke/which-key.nvim',

    -- Filetypes
    'nathangrigg/vim-beancount',
    'hashivim/vim-terraform',

    -- AI: inline completion + chat
    'nvim-lua/plenary.nvim',
    'milanglacier/minuet-ai.nvim',
    'olimorris/codecompanion.nvim',
    'MeanderingProgrammer/render-markdown.nvim',
  },
})
