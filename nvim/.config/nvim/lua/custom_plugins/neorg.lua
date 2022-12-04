require('neorg').setup {
    load = {
        ["core.defaults"] = {},
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
        ["core.gtd.base"] = {
            config = {
                workspace = "gtd",
            }
        },
        ["core.gtd.ui"] = {},
        ["core.gtd.helpers"] = {},
        ["core.gtd.queries"] = {},
        ["core.queries.native"] = {},
    }
}
