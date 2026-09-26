-- Leader must be set before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Options ]] See `:help vim.opt`
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching unless \C or capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt:append 'algorithm:histogram'

-- Display certain whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Always show the tabline (used for harpoon marks)
vim.opt.showtabline = 2

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Disable netrw (Neo-tree handles directories)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Keymaps ]]
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Copy relative path of current file
vim.keymap.set('n', '<leader>l', function()
  vim.fn.setreg('+', vim.fn.expand '%')
end, { desc = 'Copy relative path' })

-- Copy link to remote
vim.keymap.set('n', '<leader>L', function()
  local workingDir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local relativePath = vim.fn.expand '%'

  local remotePath = os.getenv 'REMOTE_LINK_PREFIX' .. workingDir .. os.getenv 'REMOTE_LINK_BRANCH_SEPARATOR' .. relativePath

  vim.fn.setreg('+', remotePath)
end, { desc = 'Copy remote link' })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
