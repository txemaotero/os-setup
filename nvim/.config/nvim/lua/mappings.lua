local M = {}

function pyflyby_add_imports()
	os.execute("tidy-imports --black --quiet --replace-star-imports --action REPLACE " .. vim.fn.expand("%"))
	vim.cmd("e")
end

M.general = {
    mappings = {
        ["<CR>"] = {"o<Esc>",                      "New line"},
        ["<C-p>"] = {"<Plug>(miniyank-cycle)",     "Put cycle"},
        ["<C-n>"] = {"<Plug>(miniyank-cycleback)", "Put cycle back"},
        ["<F5>"] = {
            function()
                require("dap").continue()
            end,
            "Start Debug",
        },
        ["<C-j>"] = { "<C-w>j", "WMove j" },
        ["<C-h>"] = { "<C-w>h", "WMove h" },
        ["<C-l>"] = { "<C-w>l", "WMove l" },
        ["<C-k>"] = { "<C-w>k", "WMove k" },
        D = {"d$",                                 "Delete until end"},
        g = {
            a = {"<Plug>(EasyAlign)", "EasyAlign"},
        },
        p = {"<Plug>(miniyank-autoput)",           "Miniyank put"},
        P = {"<Plug>(miniyank-autoPut)",           "Miniyank Put"},
        Y = {"y$",                                 "Yank until end"},
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
        ["<C-A>"] = {"<Home>",  "Home"},
        ["<C-B>"] = {"<Left>",  "Left"},
        ["<C-D>"] = {"<Del>",   "Delete"},
        ["<C-E>"] = {"<End>",   "End"},
        ["<C-F>"] = {"<Right>", "Right"},
        ["<C-N>"] = {"<Down>",  "Down"},
        ["<C-P>"] = {"<Up>",    "Up"},
    },
    opts = {mode = "t"}
}

M.leader_root = {
    mappings = {
		["/"] = { "<cmd>Telescope live_grep<cr>", "find text" },
		["<Tab>"] = { "<cmd>b#<cr>", "alternate buffer" },
		["."] = { "<cmd>e $MYVIMRC<cr>", "open config" },
		[";"] = { "<cmd>Telescope commands<cr>", "commands" },
		e = { "<cmd>NvimTreeToggle<cr>", "explorer" },
		H = { "<C-W>s", "split below" },
		m = { "<cmd>Vifm<cr>", "vifm" },
		n = { "<cmd>let @/ = ''<cr>", "no highlight" },
		u = { "<cmd>UndotreeToggle<cr>", "undo tree" },
		v = "Inc. selection",
		V = { "<C-W>v", "Split right" },
    },
    opts = {prefix = "<leader>"}
}

M.leader_buffer = {
    mappings = {
        name = "+Buffer",
        d = { "<cmd>bd<cr>", "Delete" },
        f = { "<cmd>bfirst<cr>", "First" },
        l = { "<cmd>blast<cr>", "Last" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        p = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        b = { "<cmd>BufferLinePick<cr>", "Pick" },
        B = { "<cmd>Telescope buffers<cr>", "Telescope find" },
    },
    opts = {prefix = "<leader>b"}
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
            require("dapui").toggle()
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
        m = "Messenger",
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
			d = "Diagnostics",
    },
    opts = {prefix = "<leader>l"}
}
M.leader_telescope = {
    mappings = {
			name = "+Telescope",
			["/"] = { "<cmd>Telescope commands_history<cr>", "History" },
			[";"] = { "<cmd>Telescope commands", "Commands" },
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
			z = { "<cmd>Telescope<cr>", "Telescope" },
    },
    opts = {prefix = "<leader>s"}
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