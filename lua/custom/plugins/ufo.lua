return {
  'kevinhwang91/nvim-ufo',
  event = 'BufEnter',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  config = function()
    --- @diagnostic disable: unused-local
    local ufo = require 'ufo'
    ufo.setup {
      provider_selector = function(_bufnr, _filetype, _buftype)
        return { 'treesitter', 'indent' }
      end,
    }
    vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
  end,
}
