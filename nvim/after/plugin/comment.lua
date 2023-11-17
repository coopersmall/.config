local comment = require('Comment')

comment.setup(
    {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = 'cc',
            ---Block-comment toggle keymap
            block = 'cb',
        },
        opleader = {
            line = 'cc',
            block = 'cb',
        },
        extra = {
            above = 'ccO',
            below = 'cco',
            eol = 'ccA',
        },
        mappings = {
            basic = true,
            extra = false,
        },
        pre_hook = nil,
        post_hook = nil,
    }
)
