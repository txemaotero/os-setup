local M = {}

local function pyflyby_add_imports()
    os.execute("tidy-imports --black --quiet --replace-star-imports --action REPLACE " .. vim.fn.expand("%"))
    vim.cmd("e")
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.opt_local.tw = 80
    end,
})

M.special_help = {
    mappings = {
        ["<CR>"] = {"<C-]>",              "Follow link"},
        ["<BS>"] = {"<C-T>",              "Go back"},
        o        = {"/'\\l\\{2,\\}'<CR>", "Next option"},
        O        = {"?'\\l\\{2,\\}'<CR>", "Prev. option"},
        s        = {"/|.\\{-}|<CR>",      "Next subject"},
        S        = {"?|.\\{-}|<CR>",      "Prev. subject"},
    }
}

-- Special yang
vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Harpoon
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "+", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-ñ>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


M.general = {
    mappings = {
        ["<CR>"]  = {"o<Esc>",                     "New line"},
        ["<C-.>"] = {"<cmd>CodeActionMenu<cr>",    "Code Action"},
        ["<F5>"]  = {
            function()
                require("dap").continue()
            end,
            "Start Debug",
        },
        ["<C-j>"] = { "<C-w>j", "WMove j" },
        ["<C-h>"] = { "<C-w>h", "WMove h" },
        ["<C-l>"] = { "<C-w>l", "WMove l" },
        ["<C-k>"] = { "<C-w>k", "WMove k" },
        D         = {"d$",      "Delete until end"},
        g = {
            a = {"<Plug>(EasyAlign)", "EasyAlign"},
        },
        Y = {"y$",                       "Yank until end"},
    },
}

M.general_aux = {
    mappings = {
        g = {
            a = {"<Plug>(EasyAlign)", "EasyAlign", mode = "x"},
        }
    },
}

M.terminal = {
    mappings = {
        ["<C-A>"] = {"<Home>",      "Home"},
        ["<C-B>"] = {"<Left>",      "Left"},
        ["<C-D>"] = {"<Del>",       "Delete"},
        ["<C-E>"] = {"<End>",       "End"},
        ["<C-F>"] = {"<Right>",     "Right"},
        ["<C-N>"] = {"<Down>",      "Down"},
        ["<C-P>"] = {"<Up>",        "Up"},
        ["<Esc>"] = {"<C-\\><C-n>", "Esc"},
    },
    opts = {mode = "t"}
}

M.leader_root = {
    mappings = {
        ["/"] = { "<cmd>Telescope live_grep<cr>", "Find text" },
        ["<Tab>"] = { "<cmd>b#<cr>",              "Alternate buffer" },
        ["."] = { "<cmd>e $MYVIMRC<cr>",          "Open config" },
        [";"] = { "<cmd>Telescope commands<cr>",  "Commands" },
        e = { "<cmd>Oil<cr>",                     "Explorer" },
        H = { "<C-W>s",                           "Split below" },
        m = { require("harpoon.mark").add_file,   "Add file to harpoon" },
        N = { "<cmd>let @/ = ''<cr>",             "No highlight" },
        v = "Inc. selection",
        V = { "<C-W>v",                           "Split right" },
    },
    opts = {prefix = "<leader>"}
}

M.leader_buffer = {
    mappings = {
        name = "+Buffer",
        d = { "<cmd>bd<cr>",                  "Delete" },
        f = { "<cmd>bfirst<cr>",              "First" },
        l = { "<cmd>blast<cr>",               "Last" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        p = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        b = { "<cmd>BufferLinePick<cr>",      "Pick" },
        B = { "<cmd>Telescope buffers<cr>",   "Telescope find" },
    },
    opts = {prefix = "<leader>b"}
}

M.leader_debug_visual = {
    mappings = {
        name = "+Debug",
        i = {
            function()
                require("dapui").eval()
            end,
            "Info"
        }
    },
    opts = {prefix = "<leader>d", mode="v"}
}

M.leader_debug = {
    mappings = {
        name = "+Debug",
        b = {
            function()
                require("dap").toggle_breakpoint()
            end,
            "Breakpoint",
        },
        c = {
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            "Cond. break",
        },
        d = {
            function()
                require("dap").continue()
            end,
            "Debug",
        },
        i = {
            function()
                require("dapui").eval()
            end,
            "Info"
        },
        j = {
            function()
                require("dap").step_over()
            end,
            "Step over",
        },
        k = {
            function()
                require("dap").step_out()
            end,
            "Step out",
        },
        l = {
            function()
                require("dap").step_into()
            end,
            "Step into",
        },
        L = {
            function()
                require("dap").run_last()
            end,
            "Run last",
        },
        m = {
            function()
                require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end,
            "Log message",
        },
        r = {
            function()
                require("dap").repl.open()
            end,
            "Repl open",
        },
        t = {
            function()
                require("dapui").toggle({})
            end,
            "Toggle UI",
        },
    },
    opts = {prefix = "<leader>d"}
}


M.leader_file = {
    mappings = {
        name = "+File",
        f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        s = { "<cmd>w<cr>", "Save" },
    },
    opts = {prefix = "<leader>f"}
}


M.leader_git = {
    mappings = {
        name = "+Git",
        B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame all" },
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
        s = { "<cmd>Git status<cr>", "Status" },
        t = { "<cmd>FloatermNew lazygit<cr>", "Lazygit" },
        m = "Messenger",
        v = { "<cmd>GV<cr>", "View log" },
        w = { function ()
            require('telescope').extensions.git_worktree.git_worktrees()
        end , "Worktrees"},
        W = { function ()
            require('telescope').extensions.git_worktree.create_git_worktree()
        end , "New worktrees"}
    },
    opts = {prefix = "<leader>g"}
}


M.leader_info = {
    mappings = {
        name = "+Info",
        D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Project diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "File diagnostics" },
        i = { "<cmd>TroubleToggle <cr>", "Trouble" },
        l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
        r = { "<cmd>TroubleToggle lsp_references<cr>", "Symbol references" },
    },
    opts = {prefix = "<leader>i"}
}


M.leader_jupyter = {
    mappings = {
        name = "+Jupyter",
        j = { "<Plug>JupyterExecute", "Run current cell" },
        J = { "<Plug>JupyterExecuteAll", "Run all cells" },
    },
    opts = {prefix = "<leader>j"}
}

M.leader_lsp = {
    mappings = {
        name = "+LSP",
        ["?"] = { "<cmd>SymbolsOutline<cr>", "List variables" },
        ["="] = "Format range",
        f = "Format file",
        r = "Rename",
        a = "Action",
        i = { pyflyby_add_imports, "Add imports (py)" },
        D = "Diagnostics",
        d = {
            name = "+Document",
            f = "Function",
            c = "Class",
        }
    },
    opts = {prefix = "<leader>l"}
}


M.leader_neorg = {
    mappings = {
        name = "+Neorg",
        t = {
            name = "+Tasks",
            c = {"<cmd>Neorg gtd capture<cr>", "Capture"},
            e = {"<cmd>Neorg gtd edit<cr>", "Edit"},
            v = {"<cmd>Neorg gtd views<cr>", "Views"},
            s = { "<cmd>Telescope neorg find_project_tasks<cr>", "Find tasks"},
            t = {"<cmd>Neorg workspace gtd<cr>", "Tasks"},
        },
        p = {"<cmd>Neorg workspace personal<cr>", "Personal"},
        l = { "<cmd>Telescope neorg insert_link<cr>", "New link"},
        s = { "<cmd>Telescope neorg find_linkable<cr>", "Find link"},
        f = { "<cmd>Telescope neorg insert_file_link<cr>", "File link"},
        h = { "<cmd>Telescope neorg search_headings<cr>", "Find headdings"},
    },
    opts = {prefix = "<leader>n"}
}

M.leader_telescope = {
    mappings = {
        name = "+Telescope",
        ["/"] = { "<cmd>Telescope commands_history<cr>", "History" },
        [";"] = { "<cmd>Telescope commands<cr>", "Commands" },
        a = { "<cmd>Telescope live_grep<cr>", "Find text" },
        b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
        B = { "<cmd>Telescope buffers<cr>", "Open buffers" },
        c = { "<cmd>Telescope git_commits<cr>", "Commits" },
        d = {
            name = "+DAP",
            c = { "<cmd>Telescope dap commands<cr>", "Commands" },
            C = { "<cmd>Telescope dap configurations<cr>", "Configurations" },
            b = { "<cmd>Telescope dap list_breakpoints<cr>", "Breakpoints" },
            v = { "<cmd>Telescope dap variables<cr>", "Variables" },
            f = { "<cmd>Telescope dap frames<cr>", "Frames" },
        },
        f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", "Files" },
        g = {
            name = "+git",
            c = { "<cmd>Telescope git_commits<cr>", "Commits" },
            C = { "<cmd>Telescope git_bcommits<cr>", "Buffer commits" },
            b = { "<cmd>Telescope git_branches<cr>", "Commits" },
            s = { "<cmd>Telescope git_status<cr>", "Status" },
            S = { "<cmd>Telescope git_stash<cr>", "Stash" },
        },
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
        H = { "<cmd>Telescope highlights<cr>", "Highlights" },
        l = {
            name = "+LSP",
            a = { "<cmd>Telescope lsp_code_actions<cr>", "Actions" },
            r = { "<cmd>Telescope lsp_references<cr>", "References" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Buf symbols" },
            S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Proj symbols" },
            d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Buf diagnostics" },
            D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Proj diagnostics" },
        },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
        p = { "<cmd>Telescope tags<cr>", "Project tags" },
        q = { "<cmd>Telescope quickfix<cr>", "Qhickfix list" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>Telescope ultisnips<cr>", "Snippets" },
        S = { "<cmd>Telescope colorscheme<cr>", "Color schemes" },
        t = { "<cmd>Telescope spell_suggest<cr>", "Spell suggestions" },
        T = { "<cmd>Telescope cuffent_buffer_tags<cr>", "Buffer tags" },
        w = {
            name = "+Wiki",
            w = { "<cmd>Telescope vimwiki<cr>", "Pages" },
            g = { "<cmd>Telescope vimwiki live_grep<cr>", "Grep" },
            l = { "<cmd>Telescope vimwiki link<cr>", "Links" },
        },
        y = { "<cmd>Telescope yank_history<cr>", "Yank hist." },
        z = { "<cmd>Telescope<cr>", "Telescope" },
    },
    opts = {prefix = "<leader>s"}
}

M.packer = {
    mappings = {
        name = "+packer",
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        C = {"<cmd>PackerClean<cr>", "Clean"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        S = {"<cmd>PackerStatus<cr>", "Status"},
        u = {"<cmd>PackerUpdate<cr>", "Install"},
    },
    opts = {prefix = "<leader>p"}
}

M.leader_test = {
    mappings = {
        name = "+test",
        t = {
            function()
                require("neotest").run.run()
            end,
            "Closest",
        },
        T = {
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            "File",
        },
        l = {
            function()
                require("neotest").run.run_last()
            end,
            "Last",
        },
        a = {
            function()
                require("neotest").run.attach()
            end,
            "Attach",
        },
        s = {
            function()
                require("neotest").summary.toggle()
            end,
            "Summary",
        },
        S = {
            function()
                require("neotest").run.stop()
            end,
            "Stop",
        },
        o = {
            function()
                require("neotest").output.open()
            end,
            "Output",
        },
        d = {
            function()
                require("neotest").run.run({ strategy = "dap" })
            end,
            "Debug closest",
        },
        D = {
            function()
                require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
            end,
            "Debug File",
        },
    },
    opts = {prefix = "<leader>t"}
}

M.leader_terminal = {
    mappings = {
        name = "+terminal",
        l = { "<C-w>l", "Move l" },
        [";"] = { "<cmd>FloatermNew --wintype=normal --height=6<cr>", "terminal" },
        f = { "<cmd>FloatermNew fzf<cr>", "fzf" },
        g = { "<cmd>FloatermNew lazygit<cr>", "git" },
        d = { "<cmd>FloatermNew lazydocker<cr>", "docker" },
        p = { "<cmd>FloatermNew python<cr>", "python" },
        i = { "<cmd>FloatermNew ipython<cr>", "ipython" },
        r = { "<cmd>FloatermNew ranger<cr>", "ranger" },
        e = { "<cmd>FloatermNew vifm<cr>", "vifm" },
        t = { "<cmd>FloatermToggle<cr>", "toggle" },
        y = { "<cmd>FloatermNew ytop<cr>", "ytop" },
        s = { "<cmd>FloatermNew ncdu<cr>", "ncdu" },
    },
    opts = {prefix = "<leader>T"}
}

M.leader_window = {
    mappings = {
        name = "+window",
        s = { "<C-w>s", "HSplit hor" },
        S = { "<C-w>s<C-w>l", "HSplit & focus" },
        v = { "<C-w>v", "VSplit vert" },
        V = { "<C-w>v<C-w>j", "VSplit & focus" },
        q = { "<C-w>q", "Quit current" },
        Q = { "<C-w>o", "Keep current" },
        o = { "<C-w>o", "Keep current" },
        w = { "<C-w>w", "Move to last" },
        j = { "<C-w>j", "Move j" },
        h = { "<C-w>h", "Move h" },
        k = { "<C-w>k", "Move k" },
        l = { "<C-w>l", "Move l" },
        t = { "<C-w>T", "Move to tab" },
        f = { "<C-w>|", "Focus vsplit" },
        F = { "<C-w>_", "Focus hsplit" },
        ["="] = { "<C-w>=", "Restore" },
        m = {"<cmd>lua require('maximize').toggle()<cr>", "Maximize curr"},
    },
    opts = {prefix = "<leader>w"}
}
M.leader_wiki = {
    mappings = {
        name = "+Wiki",
        i = "Diary Index",
        w = "Index",
        s = "Select number",
        t = "Index new tab",
        ["<leader>"] = {
            name = "+Day",
            w = "Today",
            t = "Today new tab",
            y = "Yesterday",
            m = "Tomorrow",
            i = "Generate link",
        },
    },
    opts = {prefix = "<leader>w"}
}

M.leader_hop = {
    mappings = {
        name = "+hop",
        h = { "<cmd>HopWord<cr>", "Word" },
        w = { "<cmd>HopWord<cr>", "Word" },
        W = { "<cmd>HopWordMW<cr>", "Word MW" },
        a = { "<cmd>HopAnywhere<cr>", "Anywhere" },
        A = { "<cmd>HopAnywhereMW<cr>", "Anywhere MW" },
        l = { "<cmd>HopLine<cr>", "Line" },
        L = { "<cmd>HopLineMW<cr>", "Line MW" },
        c = { "<cmd>HopChar1<cr>", "1 char" },
        C = { "<cmd>HopChar1MW<cr>", "1 char MW" },
        t = { "<cmd>HopChar2<cr>", "2 chars" },
        T = { "<cmd>HopChar2MW<cr>", "2 chars MW" },
    },
    opts = {prefix = "<leader>h", mode = "n"}
}

M.leader_hop_visual = {
    mappings = {
        name = "+hop",
        h = { "<cmd>HopWord<cr>", "Word" },
        w = { "<cmd>HopWord<cr>", "Word" },
        W = { "<cmd>HopWordMW<cr>", "Word MW" },
        a = { "<cmd>HopAnywhere<cr>", "Anywhere" },
        A = { "<cmd>HopAnywhereMW<cr>", "Anywhere MW" },
        l = { "<cmd>HopLine<cr>", "Line" },
        L = { "<cmd>HopLineMW<cr>", "Line MW" },
        c = { "<cmd>HopChar1<cr>", "1 char" },
        C = { "<cmd>HopChar1MW<cr>", "1 char MW" },
        t = { "<cmd>HopChar2<cr>", "2 chars" },
        T = { "<cmd>HopChar2MW<cr>", "2 chars MW" },
    },
    opts = {prefix = "<leader>h", mode = "v"}
}

return M
