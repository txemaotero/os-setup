return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require "luasnip"

        ls.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI",
        }

        require("luasnip.loaders.from_vscode").lazy_load()

        -- Go next
        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true }
        )

        -- Go prev
        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true }
        )

        -- To chose between nodes
        vim.keymap.set({ "i" }, "<c-l>", function()
            if ls.choise_active() then
                ls.change_choice()
            end
        end)
    end
}
