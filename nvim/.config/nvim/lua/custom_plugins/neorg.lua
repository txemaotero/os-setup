require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            },
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/google_drive/notas/trabajo/",
                    personal = "~/google_drive/notas/personal/",
                }
            }
        }
    }
}
