return {
    'monaqa/dial.nvim',
    config = function ()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group{
            -- default augends used when no group name is specified
            default = {
                augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.constant.alias.bool,    -- boolean value (true <-> false)
                augend.constant.new{
                    elements = {"TRUE", "FALSE"},
                    word = true,
                    cyclic = true,
                },
                augend.constant.new{
                    elements = {"True", "False"},
                    word = true,
                    cyclic = true,
                },
                augend.date.alias["%d/%m/%Y"],
                augend.date.new{
                    pattern = "%d-%m-%Y",
                    default_kind = "day",
                    -- if true, it does not match dates which does not exist, such as 2022/05/32
                    only_valid = true,
                    -- if true, it only matches dates with word boundary
                    word = false,
                },
                augend.constant.new{
                    elements = {"and", "or"},
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true,  -- "or" is incremented into "and".
                },
                augend.constant.new{
                    elements = {"&&", "||"},
                    word = false,
                    cyclic = true,
                },
            },
        }
        vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
        vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
        vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), {noremap = true})
        vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), {noremap = true})
        vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
        vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
        vim.keymap.set("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
        vim.keymap.set("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})
    end
}
