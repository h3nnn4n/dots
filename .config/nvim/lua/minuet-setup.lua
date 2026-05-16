local ok, minuet = pcall(require, 'minuet')
if not ok then return end

local providers = {
  cloud = {
    api_key = 'DEEPSEEK_API_KEY',
    end_point = 'https://api.deepseek.com/v1/chat/completions',
    model = 'deepseek-chat',
    name = 'deepseek',
    stream = true,
    optional = {
      max_tokens = 256,
      top_p = 0.9,
    },
  },
  local_ = {
    api_key = 'MINUET_LOCAL_API_KEY',
    end_point = 'http://localhost:1234/v1/chat/completions',
    model = 'lmstudio-community/qwen3-vl-30b-a3b-thinking-mlx',
    name = 'lmstudio',
    stream = true,
    optional = {
      max_tokens = 256,
      top_p = 0.9,
    },
  },
}

minuet.setup({
  provider = 'openai_compatible',
  provider_options = {
    openai_compatible = providers.cloud,
  },
  virtualtext = {
    auto_trigger_ft = { '*' },
    keymap = {
      accept = '<C-y>',
      accept_line = '<C-l>',
      next = '<C-f>',
      prev = '<C-b>',
      dismiss = '<C-e>',
    },
  },
})

local function swap(target)
  minuet.config.provider_options.openai_compatible =
    vim.tbl_deep_extend('force', {}, providers[target])
  vim.notify('Minuet → ' .. providers[target].name, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('MinuetCloud', function() swap('cloud') end, {})
vim.api.nvim_create_user_command('MinuetLocal', function() swap('local_') end, {})
