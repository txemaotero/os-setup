
-- Setup options
require("which-key").setup {
  plugins = {
    spelling = {
      enabled = tru,
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
}

-- WhichKeyFloat transparent background
vim.cmd "highlight WhichKeyFloat ctermbg=BLACK ctermfg=BLACK"

local wk = require("which-key")
-- Define keybindings
wk.register({
    ["<F5>"]         = { function() require('dap').continue() end,         "Start Debug" },
    ["<C-p>"]        = { function() require('harpoon.ui').nav_file(1) end, "Harp 1" },
    ["<C-t>"]        = { function() require('harpoon.ui').nav_file(2) end, "Harp 2" },
    ["<C-n>"]        = { function() require('harpoon.ui').nav_file(3) end, "Harp 3" },
    ["<C-s>"]        = { function() require('harpoon.ui').nav_file(4) end, "Harp 4" },
    ["<C-j>"]        = { "<C-w>j",                                         "WMove j" },
    ["<C-h>"]        = { "<C-w>h",                                         "WMove h" },
    ["<C-l>"]        = { "<C-w>l",                                         "WMove l" },
    ["<C-k>"]        = { "<C-w>k",                                         "WMove k" },
    ["<leader>"]     = {
        ["/"]        = { "<cmd>Telescope live_grep<cr>", "find text" },
        ["<Tab>"]    = { "<cmd>b#<cr>",                  "alternate buffer" },
        ["."]        = { "<cmd>e $MYVIMRC<cr>",          "open config" },
        [";"]        = { "<cmd>Telescope commands<cr>",  "commands" },
        e            = { "<cmd>NvimTreeToggle<cr>",      "explorer" },
        n            = { "<cmd>let @/ = ''<cr>",         "no highlight" },
        m            = { "<cmd>Vifm<cr>",                "vifm" },
        u            = { "<cmd>UndotreeToggle<cr>",      "undo tree" },
        H            = { "<C-W>s",                       "split below" },
        H            = { "<C-W>s",                       "split below" },
        H            = { "<C-W>s",                       "Split below" },
        V            = { "<C-W>v",                       "Split right" },
        b            = {
            name     = "+buffer",
            d        = { "<cmd>bd<cr>",                "Delete" },
            f        = { "<cmd>bfirst<cr>",            "First" },
            l        = { "<cmd>blast<cr>",             "Last" },
            n        = { "<cmd>bnext<cr>",             "Next" },
            p        = { "<cmd>bprevious<cr>",         "Previous" },
            B        = { "<cmd>Telescope buffers<cr>", "Telescope find" },
        },
        d            = {
            name     = "+debug",
            d        = { function() require('dap').continue() end,                                             "Debug" },
            b        = { function() require('dap').toggle_breakpoint() end,                                    "Breakpoint" },
            j        = { function() require('dap').step_over() end,                                            "Step over" },
            l        = { function() require('dap').step_into() end,                                            "Step into" },
            k        = { function() require('dap').step_out() end,                                             "Step out" },
            c        = { function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Cond. break" },
            l        = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, "Log message" },
            r        = { function() require('dap').repl.open() end,                                            "Repl open" },
            L        = { function() require('dap').run_last() end,                                             "Run last" },
        },
        f            = {
            name     = "+file",
            f        = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",            "Find File" },
            s        = { "<cmd>w<cr>",                                                                         'Save'}
        },
        h            = {
            name     = "+harpoon",
            a        = { function() require('harpoon.mark').add_file() end,        "Quick menu" },
            h        = { function() require('harpoon.ui').toggle_quick_menu() end, "Quick menu" },
            ["1"]    = { function() require('harpoon.ui').nav_file(1) end,         "Harp 1" },
            ["2"]    = { function() require('harpoon.ui').nav_file(2) end,         "Harp 2" },
            ["3"]    = { function() require('harpoon.ui').nav_file(3) end,         "Harp 3" },
            ["4"]    = { function() require('harpoon.ui').nav_file(4) end,         "Harp 4" },
        },
        l            = {
            name     = "+LSP",
            ["?"]    = { "<cmd>SymbolsOutline<cr>", "List variables" },
            ["="]    = "Format",
            r        = "Rename",
            a        = "Action",
            d        = "Diagnostics",
        },
        s            = {
            name     = "+Telescope",
            ["/"]    = { "<cmd>Telescope commands_history<cr>",          "History" },
            [";"]    = { "<cmd>Telescope commands",                      "Commands" },
            a        = { "<cmd>Telescope live_grep<cr>",                 "Find text" },
            b        = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
            B        = { "<cmd>Telescope buffers<cr>",                   "Open buffers" },
            c        = { "<cmd>Telescope git_commits<cr>",               "Commits" },
            d        = {
                name = "+DAP",
                c    = { "<cmd>Telescope dap commands<cr>",         "Commands" },
                C    = { "<cmd>Telescope dap configurations<cr>",   "Configurations" },
                b    = { "<cmd>Telescope dap list_breakpoints<cr>", "Breakpoints" },
                v    = { "<cmd>Telescope dap variables<cr>",        "Variables" },
                f    = { "<cmd>Telescope dap frames<cr>",           "Frames" },
            },
            f        = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>" , "Files" },
            g        = {
                name = "+git",
                c    = { "<cmd>Telescope git_commits<cr>",  "Commits" },
                C    = { "<cmd>Telescope git_bcommits<cr>", "Buffer commits" },
                b    = { "<cmd>Telescope git_branches<cr>", "Commits" },
                s    = { "<cmd>Telescope git_status<cr>",   "Status" },
                S    = { "<cmd>Telescope git_stash<cr>",    "Stash" },
            },
            h        = { "<cmd>Telescope help_tags<cr>", "Help tags" } ,
            l        = {
                name = "+LSP",
                a    = { "<cmd>Telescope lsp_code_actions<cr>",          "Actions" },
                r    = { "<cmd>Telescope lsp_references<cr>",            "References" },
                s    = { "<cmd>Telescope lsp_document_symbols<cr>",      "Buf symbols" },
                S    = { "<cmd>Telescope lsp_workspace_symbols<cr>",     "Proj symbols" },
                d    = { "<cmd>Telescope lsp_document_diagnostics<cr>",  "Buf diagnostics" },
                D    = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Proj diagnostics" },
            },
            k        = { "<cmd>Telescope keymaps<cr>",             "Keymaps" },
            m        = { "<cmd>Telescope marks<cr>",               "Marks" } ,
            M        = { "<cmd>Telescope man_pages<cr>",           "Man pages" } ,
            p        = { "<cmd>Telescope tags<cr>",                "Project tags" },
            q        = { "<cmd>Telescope quickfix<cr>",            "Project tags" },
            r        = { "<cmd>Telescope registers<cr>",           "Registers" },
            s        = { "<cmd>Telescope ultisnips<cr>",           "Snippets" },
            S        = { "<cmd>Telescope colorscheme<cr>",         "Color schemes" },
            t        = { "<cmd>Telescope spell_suggest<cr>",       "Spell suggestions" },
            T        = { "<cmd>Telescope cuffent_buffer_tags<cr>", "Buffer tags" },
            z        = { "<cmd>Telescope<cr>",                     "Telescope" },
        },
        t            = {
            name     = "+terminal",
            l        = { "<C-w>l",                                           "Move l" },
            [";"]    = { "<cmd>FloatermNew --wintype=normal --height=6<cr>", 'terminal' },
            f        = { "<cmd>FloatermNew fzf<cr>",                         "fzf" },
            g        = { "<cmd>FloatermNew lazygit<cr>",                     "git" },
            d        = { "<cmd>FloatermNew lazydocker<cr>",                  "docker" },
            p        = { "<cmd>FloatermNew python<cr>",                      "python" },
            i        = { "<cmd>FloatermNew ipython<cr>",                     "ipython" },
            r        = { "<cmd>FloatermNew ranger<cr>",                      "ranger" },
            e        = { "<cmd>FloatermNew vifm<cr>",                        "vifm" },
            t        = { "<cmd>FloatermToggle<cr>",                          "toggle" },
            y        = { "<cmd>FloatermNew ytop<cr>",                        "ytop" },
            s        = { "<cmd>FloatermNew ncdu<cr>",                        "ncdu" },
        },
        w            = {
            name     = "+window",
            s        = { "<C-w>s",       "HSplit hor" },
            S        = { "<C-w>s<C-w>l", "HSplit & focus" },
            v        = { "<C-w>v",       "VSplit vert" },
            V        = { "<C-w>v<C-w>j", "VSplit & focus" },
            q        = { "<C-w>q",       "Quit current" },
            Q        = { "<C-w>o",       "Keep current" },
            o        = { "<C-w>o",       "Keep current" },
            w        = { "<C-w>w",       "Move to last" },
            j        = { "<C-w>j",       "Move j" },
            h        = { "<C-w>h",       "Move h" },
            k        = { "<C-w>k",       "Move k" },
            l        = { "<C-w>l",       "Move l" },
        }
    },
})
