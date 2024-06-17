return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global variable
        if vim.g.disable_autoformat then
          return
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        go = { 'gofmt' },
        c = { 'clang-format' },
      },
    },
  },
  {
    vim.api.nvim_create_user_command('ConformDisable', function()
      vim.g.disable_autoformat = true
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    }),
    vim.api.nvim_create_user_command('ConformEnable', function()
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    }),
  },
}
-- vim: ts=2 sts=2 sw=2 et
