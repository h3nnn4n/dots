local ok, minuet = pcall(require, 'minuet')
if not ok then return end

minuet.setup({
  provider = 'openai_compatible',
  provider_options = {
    openai_compatible = {
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
