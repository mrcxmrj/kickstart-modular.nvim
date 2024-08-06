return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'abeldekat/harpoonline', version = '*' },
  event = 'UiEnter',
  config = function()
    local Harpoonline = require 'harpoonline'
    Harpoonline.setup {
      on_update = function()
        require('lualine').refresh()
      end,
    }

    require('lualine').setup {
      options = {
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {
          statusline = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { Harpoonline.format, 'filename' },
        lualine_x = {
          'filetype',
        },
        lualine_y = {
          'progress',
        },
        lualine_z = {
          'location',
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
