-- Nvim tree lua setup
require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    hijack_cursor       = false,
    update_cwd          = true,
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {".git", "node_modules", ".cache"}
    },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    git = {
        ignore = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = true,
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
                    buftype  = { "nofile", "terminal", "help", }
                }
            }
        }
    }
}
