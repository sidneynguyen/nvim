-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>ma', mark.add_file, { desc = 'mark' })
      vim.keymap.set('n', '<leader>mm', ui.toggle_quick_menu, { desc = 'menu' })

      vim.keymap.set('n', '<C-j>', function()
        ui.nav_file(1)
      end)
      vim.keymap.set('n', '<C-k>', function()
        ui.nav_file(2)
      end)
      vim.keymap.set('n', '<C-l>', function()
        ui.nav_file(3)
      end)
      vim.keymap.set('n', '<C-h>', function()
        ui.nav_file(4)
      end)
    end,
  },
}
