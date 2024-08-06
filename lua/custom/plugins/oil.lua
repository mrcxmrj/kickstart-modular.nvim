return {
  'stevearc/oil.nvim',
  opts = { keymaps = {
    ['l'] = 'actions.select',
    ['h'] = 'actions.parent',
  } },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
