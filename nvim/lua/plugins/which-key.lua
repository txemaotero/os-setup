--------------- Key maps--------------------------------
return {
    'folke/which-key.nvim',
    config = function()
        -- Setup options
        require("which-key").setup({
            plugins = {
                spelling = {
                    enabled = true,
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false,
                    motions = true, -- adds help for motions
                    text_objects = false,
                    windows = false, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                },
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "center", -- align columns left, center or right
            },
            triggers_blacklist = {
                i = { "f" },
                v = { "f" },
            },
        })

        -- WhichKeyFloat transparent background
        vim.cmd("highlight WhichKeyFloat ctermbg=BLACK ctermfg=BLACK")

        local wk = require("which-key")

        local mappings = require("mappings")

        for key, val in pairs(mappings) do
            if key == "special_help" then
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = "help",
                    callback = function()
                        wk.register(val.mappings, {buffer = vim.api.nvim_get_current_buf()})
                    end,
                })
            elseif val.opts then
                wk.register(val.mappings, val.opts)
            else
                wk.register(val.mappings)
            end
        end
    end
}

