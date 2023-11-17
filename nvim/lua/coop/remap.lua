--[[
 ____
|  _ \ ___ _ __ ___   __ _ _ __
| |_) / _ \ '_ ` _ \ / _` | '_ \
|  _ <  __/ | | | | | (_| | |_) |
|_| \_\___|_| |_| |_|\__,_| .__/
                          |_|

--]]

vim.g.mapleader = " "
vim.keymap.set("n", "<C-o>", vim.cmd.Ex)
vim.keymap.set("n", "<C-p>", "<CMD>visual<CR>")

vim.keymap.set("n", '<leader>pv', ':Ex<CR>')
vim.keymap.set("n", '<leader>u', ':UndotreeShow<CR>')

vim.keymap.set("n", 'Y', 'yg$')
vim.keymap.set("n", 'C-j', 'mxj`z')
vim.keymap.set("n", 'J', '<C-d>zz')
vim.keymap.set("n", 'K', '<C-u>')
vim.keymap.set("n", 'n', 'nzzzv')
vim.keymap.set("n", 'N', 'Nzzzv')

vim.keymap.set("n", '<leader>vwm', function()
    require('vim-with-me').StartVimWithMe()
end)
vim.keymap.set("n", '<leader>svwm', function()
    require('vim-with-me').StopVimWithMe()
end)

vim.keymap.set('n', 'p', "<leader>p")
vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set('v', '<leader-y>', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

vim.keymap.set('n', '<C-k>', "<CMD>cnext<CR>zz")
vim.keymap.set('n', '<C-j>', "<CMD>cprev<CR>zz")
vim.keymap.set('n', '<leader>k', "<CMD>lnext<CR>zz")
vim.keymap.set('n', '<leader>j', "<CMD>lprev<CR>zz")


vim.keymap.set('n', '<leader>s', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set('n', '<leader>x', "<CMD>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<leader>cd', ":cd %:p:h<CR>:pwd<CR>")

vim.keymap.set('v', '<C-i>', "<Esc>")
vim.keymap.set('i', '<C-i>', "<Esc>")

vim.keymap.set('n', '<C-q>', "<CMD>q!<CR>")
vim.keymap.set('n', '<C-s>', "<CMD>w<CR>")

vim.keymap.set('n', '<C-n>', "<CMD>enew<CR>")

vim.keymap.set('n', '<S-h>', "<CMD>bprev<CR>")
vim.keymap.set('n', "<S-l>", "<CMD>bnext<CR>")

vim.keymap.set('n', '<leader>cr', "<CMD>lua Colors()<CR>")

vim.keymap.set('n', '<leader>o', "<C-o>")
vim.keymap.set('n', '<leader>i', "<C-i>")

vim.keymap.set('n', '<C-q>', "<CMD>qa<CR>")

vim.keymap.set('n', '<leader>yy', '"*yy')
vim.keymap.set('n', '<leader>yiw', '"*yiw')
vim.keymap.set('n', '<leader>yi"', '"*yi"')
vim.keymap.set('n', '<leader>yi(', '"*yi(')
vim.keymap.set('n', '<leader>yi{', '"*yi{')

vim.keymap.set('n', '<C-o>', 'o<Esc>')
vim.keymap.set('n', '<C-O>', 'O<Esc>')

vim.keymap.set('n', '<leader>h', '<CMD>noh<CR>')

vim.keymap.set('n', '<leader>lsp', '<CMD>LspStop<CR><CMD>LspStart<CR>')

vim.keymap.set('n', 't', '$')
vim.keymap.set('n', 'T', '0')
