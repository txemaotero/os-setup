-- Treesitter config
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- Install all lenguages
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>v",
            node_incremental = "v",
            scope_incremental = "grc",
            node_decremental = "V",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    indent = {
        enable = true,
        disable = {"python"}
    }
}
