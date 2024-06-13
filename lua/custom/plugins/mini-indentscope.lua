return {
  {
    'echasnovski/mini.indentscope',
    version = false,
    event = 'BufEnter',
    opts = {
      symbol = '│',
      options = { try_as_border = true },
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'lazy',
          'mason',
          'notify',
          'oil',
          'Oil',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
