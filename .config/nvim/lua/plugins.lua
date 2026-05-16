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

    -- Completion stack (legacy)
    { 'Shougo/deoplete.nvim', build = ':UpdateRemotePlugins' },
    'Shougo/neosnippet.vim',
    'Shougo/neosnippet-snippets',
    'deoplete-plugins/deoplete-jedi',
    'racer-rust/vim-racer',
    'Shougo/denite.nvim',

    -- Python tooling
    'davidhalter/jedi-vim',
    { 'stsewd/isort.nvim', build = ':UpdateRemotePlugins' },
    { 'a-vrma/black-nvim', build = ':UpdateRemotePlugins' },

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
    'rhysd/vim-clang-format',
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

    -- LSP / linters
    'neovim/nvim-lspconfig',
    'w0rp/ale',
    'neomake/neomake',
    'vim-syntastic/syntastic',

    -- Filetypes
    'nathangrigg/vim-beancount',
    'hashivim/vim-terraform',
    'juliosueiras/vim-terraform-completion',

    -- AI: inline completion + chat
    'nvim-lua/plenary.nvim',
    'milanglacier/minuet-ai.nvim',
    'olimorris/codecompanion.nvim',
    'MeanderingProgrammer/render-markdown.nvim',
  },
})
