local M = {}

function M.selectMatchingLines()
    vim.cmd("normal! y^\\<C-v>G/[^\\r\\n\\<C-v>]/\\<CR>`[V`]")
end

return M

