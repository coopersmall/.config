local notify = require("notify")

notify.setup(
    {
        background_colour = "NotifyBackground",
        fps = 30,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = ""
        },
        level = 2,
        max_width = 50,
        render = "wrapped-compact",
        stages = "fade",
        timeout = 1500,
        top_down = true,
    }
)

vim.notify = notify

local function notify_output(command, opts)
    local output = ""
    local notification
    local notify = function(msg, level)
        local notify_opts = vim.tbl_extend(
            "keep",
            opts or {},
            { title = table.concat(command, " "), replace = notification }
        )
        notification = vim.notify(msg, level, notify_opts)
    end
    local on_data = function(_, data)
        output = output .. table.concat(data, "\n")
        notify(output, "info")
    end
    vim.fn.jobstart(command, {
        on_stdout = on_data,
        on_stderr = on_data,
        on_exit = function(_, code)
            if #output == 0 then
                notify("No output of command, exit code: " .. code, "warn")
            end
        end,
    })
end

-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

local function get_notif_data(client_id, token)
    if not client_notifs[client_id] then
        client_notifs[client_id] = {}
    end

    if not client_notifs[client_id][token] then
        client_notifs[client_id][token] = {}
    end

    return client_notifs[client_id][token]
end


local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
    local notif_data = get_notif_data(client_id, token)

    if notif_data.spinner then
        local new_spinner = (notif_data.spinner + 1) % #spinner_frames
        notif_data.spinner = new_spinner

        notif_data.notification = vim.notify(nil, nil, {
            hide_from_history = true,
            icon = spinner_frames[new_spinner],
            replace = notif_data.notification,
        })

        vim.defer_fn(function()
            update_spinner(client_id, token)
        end, 100)
    end
end

local function format_title(title, client_name)
    return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
    return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local client_id = ctx.client_id

    local val = result.value

    if not val.kind then
        return
    end

    local notif_data = get_notif_data(client_id, result.token)

    if val.kind == "begin" then
        local message = format_message(val.message, val.percentage)

        notif_data.notification = vim.notify(message, "info", {
            title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
            icon = spinner_frames[1],
            timeout = false,
            hide_from_history = false,
        })

        notif_data.spinner = 1
        update_spinner(client_id, result.token)
    elseif val.kind == "report" and notif_data then
        notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
            replace = notif_data.notification,
            hide_from_history = false,
        })
    elseif val.kind == "end" and notif_data then
        notif_data.notification =
            vim.notify(val.message and format_message(val.message) or "Complete", "info", {
                icon = "",
                replace = notif_data.notification,
                timeout = 1500,
            })

        notif_data.spinner = nil
    end
end

-- table from lsp severity to vim severity.
local severity = {
    "error",
    "warn",
    "info",
    "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
    vim.notify(method.message, severity[params.type])
end

vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = "#8A1F1F" })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = "#79491D" })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = "#4F6752" })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = "#8B8B8B" })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = "#4F3552" })
vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = "#F70067" })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = "#F79000" })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = "#A9FF68" })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = "#8B8B8B" })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = "#D484FF" })
vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = "#F70067" })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = "#F79000" })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = "#A9FF68" })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = "#8B8B8B" })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = "#D484FF" })
vim.api.nvim_set_hl(0, 'NotifyERRORBody', { fg = "#ffffff" })
vim.api.nvim_set_hl(0, 'NotifyWARNBody', { fg = "#ffffff" })
vim.api.nvim_set_hl(0, 'NotifyINFOBody', { fg = "#ffffff" })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBody', { fg = "#ffffff" })
vim.api.nvim_set_hl(0, 'NotifyTRACEBody', { fg = "#ffffff" })
