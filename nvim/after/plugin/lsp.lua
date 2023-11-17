local lsp = require('lsp-zero')

lsp.preset({})

lsp.ensure_installed({
    'gopls',
    'rust_analyzer',
    'tsserver',
    'eslint',
    'html',
    'cssls',
    'bashls',
    'sqlls',
    'lua_ls',
    'dockerls',
    'docker_compose_language_service',
    'yamlls',
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', 'tt', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', 'tr', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        ['gopls'] = { 'go' },
        ['rust_analyzer'] = { 'rust' },
        ['tsserver'] = { 'typescript', 'js' },
        ['buf'] = { 'proto' },
        ['html'] = { 'html' },
        ['cssls'] = { 'css', 'scss', 'less' },
        ['bashls'] = { 'sh' },
        ['sqlls'] = { 'sql' },
        ['dockerls'] = { 'dockerfile' },
        ['yamlfmt'] = { 'yaml' },
    }
})

local nvim_lsp = require('lspconfig')
nvim_lsp.lua_ls.setup({
    on_attach = function(client, bufnr)
        ih.on_attach(client, bufnr)
    end,
    settings = {
        Lua = {
            hint = {
                enable = true,
            },
        },
    },
})

-- Specify an autocommand to switch to helm_ls for Helm YAML files
vim.cmd([[
  augroup HelmLS
      autocmd FileType tpl setlocal filetype=helm
      autocmd FileType yaml setlocal filetype=helm
  augroup END
]])

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<CR>'] = cmp.mapping.confirm({
            -- documentation says this is important.
            -- I don't know why.
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        })
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    }
})

vim.diagnostic.config({
    virtual_text = true
})

vim.lsp.set_log_level('warn')
