return {
  'sindrets/diffview.nvim',
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      merge_tool = {
        layout = 'diff3_mixed',
        disable_diagnostics = true,
      },
    },
  },
  config = function(_, opts)
    require('diffview').setup(opts)

    vim.keymap.set('n', '<leader>gdh', '<cmd>DiffviewOpen<cr>', { desc = '[g]it [d]iffview against [h]EAD' })
    vim.keymap.set('n', '<leader>gdq', '<cmd>DiffviewClose<cr>', { desc = '[g]it [d]iffview [q]uit' })

    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Repo history' })
    vim.keymap.set('n', '<leader>gfh', '<cmd>DiffviewFileHistory --follow %<cr>', { desc = 'File history' })
    vim.keymap.set('v', '<leader>hl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = 'Range history' })
    vim.keymap.set('n', ',hl', '<Cmd>.DiffviewFileHistory --follow<CR>', { desc = 'Line history' })

    local function get_default_branch_name()
      local res = vim.system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true }):wait()
      return res.code == 0 and 'main' or 'master'
    end
    -- Diff against local main branch
    vim.keymap.set('n', '<leader>gdm', function()
      vim.cmd('DiffviewOpen ' .. get_default_branch_name())
    end, { desc = 'Diff against main' })
    -- Diff against remote main branch
    vim.keymap.set('n', '<leader>gdM', function()
      vim.cmd('DiffviewOpen HEAD..origin/' .. get_default_branch_name())
    end, { desc = 'Diff against origin/main' })
  end,
}
