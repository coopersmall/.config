function Colors(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })
end

vim.cmd([[autocmd Colorscheme * lua Colors()]])
