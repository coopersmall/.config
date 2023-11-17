local vgit = require('vgit')

vgit.setup()

vim.keymap.set("n", "<leader>gh", "<CMD>VGit buffer_history_preview<CR>")
vim.keymap.set("n", "<leader>gd", "<CMD>VGit buffer_diff_staged_preview<CR>")
vim.keymap.set("n", "<leader>gs", "<CMD>VGit buffer_stage<CR>")
vim.keymap.set("n", "<leader>gc", "<CMD>VGit project_commit_preview<CR>")
