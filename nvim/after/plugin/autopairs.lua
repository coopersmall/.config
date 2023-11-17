local autopairs = require('nvim-autopairs')

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_check_bracket_line = true,
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add pair on that treesitter node
        javascript = { 'template_string' },
        java = false,     -- don't check treesitter on java
    }
})
