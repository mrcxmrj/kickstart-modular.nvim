-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Remap tmux prefix
vim.keymap.set('n', '<C-b>', '<C-a>', { desc = 'Increment that works with tmux prefix' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Make scrolling and searching less disorienting
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center after scrolling up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center after scrolling down' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center after searching' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center after searching back' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = "Don't move cursor when J-ing" })

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking deletion' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking deletion' })

vim.keymap.set('n', '<leader>o', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = 'New line below' })
vim.keymap.set('n', '<leader>O', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = 'New line above' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
