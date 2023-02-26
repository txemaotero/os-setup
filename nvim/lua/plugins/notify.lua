-- Fancy notifications
return {
    'rcarriga/nvim-notify',
    config = function()
        require("notify").setup({
            -- Animation style (see below for details)
            stages = "fade_in_slide_out",

            -- Function called when a new window is opened, use for changing win settings/config
            on_open = nil,

            -- Default timeout for notifications
            timeout = 5000,

            -- For stages that change opacity this is treated as the highlight behind the window
            -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
            background_colour = "#000000",

            -- Icons for the different levels
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
        })

        vim.notify = require("notify")
    end
}
