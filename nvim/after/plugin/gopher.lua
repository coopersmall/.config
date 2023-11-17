require('gopher').setup({
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
    },
})

vim.keymap.set('n', 'goe', '<CMD>GoIfErr<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'goi', '<CMD>GoImpl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gotj', '<CMD>GoTagAdd json<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'goty', '<CMD>GoTagAdd yaml<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gotrj', '<CMD>GoTagRm json<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gotry', '<CMD>GoTagRm yaml<CR>', { noremap = true, silent = true })
