return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy', -- Load after startup
    config = function()
      local hooks = require 'ibl.hooks'
      local flavor = vim.g.catppuccin_flavour or require('catppuccin').flavour
      vim.notify(flavor, vim.log.levels.INFO)
      local catppuccin = require('catppuccin.palettes').get_palette(flavor)

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
