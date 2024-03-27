return {
  'mbbill/undotree',
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo tree' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<plug>UndotreeNextState', {})
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<plug>UndotreePreviousState', {})
  end,
}
