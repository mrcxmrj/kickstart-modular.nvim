return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      local files = require 'mini.files'
      files.setup { mappings = { go_in_plus = '<CR>', synchronize = 'w' }, options = { use_as_default_explorer = false } }
      vim.keymap.set('n', '<leader>fe', function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local _ = files.close() or files.open(bufname, false)
      end, { desc = 'File explorer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
