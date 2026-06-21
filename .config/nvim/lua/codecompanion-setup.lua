local ok, _ = pcall(require, 'secrets')

local ok, codecompanion = pcall(require, 'codecompanion')
if not ok then return end

codecompanion.setup({
  adapters = {
    http = {
      deepseek = function()
        return require('codecompanion.adapters').extend('openai_compatible', {
          env = {
            url = 'https://api.deepseek.com',
            api_key = 'DEEPSEEK_API_KEY',
            chat_url = '/v1/chat/completions',
          },
          schema = {
            model = {
              default = 'deepseek-chat',
            },
          },
        })
      end,
      lmstudio = function()
        return require('codecompanion.adapters').extend('openai_compatible', {
          env = {
            url = 'http://localhost:1234',
            api_key = 'lm-studio',
            chat_url = '/v1/chat/completions',
          },
          schema = {
            model = {
              default = 'lmstudio-community/qwen3-vl-30b-a3b-thinking-mlx',
            },
          },
        })
      end,
      opts = { show_presets = false },
    },
    acp = {
      opts = { show_presets = false },
    },
  },
  strategies = {
    chat = { adapter = 'deepseek' },
    inline = { adapter = 'deepseek' },
    agent = { adapter = 'deepseek' },
  },
  display = {
    chat = {
      start_in_insert_mode = false,
    },
  },
})

vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion chat toggle' })
vim.keymap.set('v', '<leader>ac', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion add selection to chat' })
vim.keymap.set('n', '<leader>ab', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion add buffer to chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>am', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })
vim.keymap.set({ 'n', 'v' }, '<leader>ap', ':CodeCompanion ', { desc = 'CodeCompanion inline prompt' })
