local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.nav_hunk('next') end)
      return '<Ignore>'
    end, 'Next hunk')

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.nav_hunk('prev') end)
      return '<Ignore>'
    end, 'Prev hunk')

    map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
    map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
    map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage selection')
    map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset selection')
    map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
    map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
    map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
    map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
    map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
    map('n', '<leader>hd', gs.diffthis, 'Diff this')
    map('n', '<leader>ht', gs.toggle_word_diff, 'Toggle word diff')
  end,
})
