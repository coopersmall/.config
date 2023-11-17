local multicursor = require('multicursors')

multicursor.setup(
    {
        DEBUG_MODE = false,
        create_commands = true, -- create Multicursor user commands
        updatetime = 50,        -- selections get updated if this many milliseconds nothing is typed in the insert mode see :help updatetime
        nowait = true,          -- see :help :map-nowait
        -- see :help hydra-config.hint
        hint_config = false,
        -- accepted values:
        -- -1 true: generate hints
        -- -2 false: don't generate hints
        -- -3 [[multi line string]] provide your own hints
        generate_hints = {
            normal = false,
            insert = false,
            extend = false,
        },
    }
)

local function is_active()
    local ok, hydra = pcall(require, 'hydra.statusline')
    return ok and hydra.is_active()
end

local function get_name()
    local ok, hydra = pcall(require, 'hydra.statusline')
    if ok then
        return hydra.get_name()
    end
    return ''
end

vim.keymap.set('n', '<C-j>', '<CMD>MCunderCursor<CR>')
vim.keymap.set('n', '<C-f>', '<CMD>MCpattern<CR>')
