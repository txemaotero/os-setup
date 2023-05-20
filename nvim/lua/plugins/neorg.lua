return {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        'xiyaowong/nvim-transparent',
        'nvim-telescope/telescope.nvim',
        "nvim-neorg/neorg-telescope",
        "nvim-treesitter/nvim-treesitter",
    },
    build = ":Neorg sync-parsers",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {},
                ["core.export"] = {},
                ["core.integrations.telescope"] = {},
                ["core.norg.concealer"] = {
                    config = {
                        folds = false,
                    }
                },
                ["core.norg.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    },
                },
                ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            personal = "~/google_drive/notas/personal/",
                            gtd = "~/google_drive/notas/gtd/",
                        }
                    }
                },
            }
        }
    end
}
