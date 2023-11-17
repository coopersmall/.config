local treesj = require('treesj')

treesj.setup({
    use_default_keymaps = false,
    keys = {},
})

vim.keymap.set(
    'n',
    '<Tab>',
    require("treesj").toggle,
    { noremap = true, silent = true }
)
