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
      max_tokens = 128,
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
      max_tokens = 128,
      top_p = 0.9,
    },
  },
  openrouter = {
    api_key = 'OPENROUTER_API_KEY',
    end_point = 'https://openrouter.ai/api/v1/chat/completions',
    model = 'qwen/qwen3-coder-flash',
    name = 'openrouter',
    stream = true,
    optional = {
      max_tokens = 128,
      top_p = 0.9,
    },
  },
  deepseek_fim = {
    api_key = 'DEEPSEEK_API_KEY',
    end_point = 'https://api.deepseek.com/beta/completions',
    model = 'deepseek-chat',
    name = 'deepseek-fim',
    stream = true,
    optional = {
      max_tokens = 128,
    },
  },
}

-- Which provider_options key each target lives under.
local slots = {
  cloud = 'openai_compatible',
  local_ = 'openai_compatible',
  openrouter = 'openai_compatible',
  deepseek_fim = 'openai_fim_compatible',
}

minuet.setup({
  provider = 'openai_fim_compatible',
  provider_options = {
    openai_compatible = providers.openrouter,
    openai_fim_compatible = providers.deepseek_fim,
  },
  -- Latency tuning: smaller prompt + single completion = faster round-trips.
  context_window = 8000,
  n_completions = 1,
  debounce = 150,
  throttle = 700,
  request_timeout = 3,
})

local function swap(target)
  local slot = slots[target]
  minuet.config.provider = slot
  minuet.config.provider_options[slot] =
    vim.tbl_deep_extend('force', {}, providers[target])
  vim.notify('Minuet → ' .. providers[target].name, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('MinuetCloud', function() swap('cloud') end, {})
vim.api.nvim_create_user_command('MinuetLocal', function() swap('local_') end, {})
vim.api.nvim_create_user_command('MinuetOpenrouter', function() swap('openrouter') end, {})
vim.api.nvim_create_user_command('MinuetDeepseekFim', function() swap('deepseek_fim') end, {})

vim.api.nvim_create_user_command('MinuetModel', function()
  local provider = minuet.config.provider
  local opts = minuet.config.provider_options[provider]
  vim.notify(string.format('Minuet: %s / %s', opts.name or provider, opts.model), vim.log.levels.INFO)
end, {})
