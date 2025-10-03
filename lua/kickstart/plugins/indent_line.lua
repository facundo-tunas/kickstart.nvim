return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local hooks = require 'ibl.hooks'
      local catppuccin = require('catppuccin.palettes').get_palette()

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- Normal indent guides
        vim.api.nvim_set_hl(0, 'IndentGuide', { fg = catppuccin.surface0 })

        -- Focused scope without underline
        vim.api.nvim_set_hl(0, 'IndentScope', {
          fg = catppuccin.red,
          underline = false,
        })
      end)

      require('ibl').setup {
        indent = { highlight = { 'IndentGuide' } },
        scope = { highlight = { 'IndentScope' }, show_start = false, show_end = false },
      }
    end,
  },
}
