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
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<C-m>', function()
        harpoon:list():add()
        vim.o.tabline = vim.o.tabline
      end, { desc = 'mark' })

      vim.keymap.set('n', '<leader>m', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'menu' })

      -- custom tabline function to show Harpoon marks
      function harpoon_tabline()
        local file_paths = {}
        local harpoon_files = harpoon:list()

        for index, item in ipairs(harpoon_files.items) do
          local shortcut = tostring(index)
          if index == 1 then
            shortcut = 'j'
          elseif index == 2 then
            shortcut = 'k'
          elseif index == 3 then
            shortcut = 'l'
          elseif index == 4 then
            shortcut = 'h'
          end

          table.insert(file_paths, '%#TabLine# ' .. item.value .. ' %#TablineSel#[' .. shortcut .. '] ')
          -- table.insert(file_paths, '%#TablineSel#[' .. shortcut .. ']' .. '%#TabLineFill# ' .. item.value)
        end

        return table.concat(file_paths, '%#TabLineFill#  ') .. '%#TabLineFill#'
      end

      -- show Harpoon marks in tabline
      vim.o.tabline = '%!v:lua.harpoon_tabline()'
      vim.cmd 'highlight TabLine guifg=#cdd6f4 guibg=#1e1e2e'
      vim.cmd 'highlight TabLineSel guifg=#a6e3a1 guibg=#1e1e2e'

      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(4)
      end)
    end,
  },
}
