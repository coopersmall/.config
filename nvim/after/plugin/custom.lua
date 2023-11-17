local custom = require('coop.custom')

-- Define the key mapping
vim.api.nvim_set_keymap('n', '<leader>rl', [[:lua require('coop.custom').selectMatchingLines()<CR>]],
    { noremap = true, silent = true })
