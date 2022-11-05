return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    ----------------- Must be plugins ----------------------------
    -- Sort with gs
    use 'ralismark/opsort.vim'
    -- Align text with ga
    use 'junegunn/vim-easy-align'
    -- Change surround cs
    use {
        'kylechui/nvim-surround',
        config = function()
            require("nvim-surround").setup{}
        end
    }
    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    }
    -- Better repeat
    use 'tpope/vim-repeat'
    -- Autoclose parenth
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    -- Replace with register
    use 'vim-scripts/ReplaceWithRegister'

    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    -- Treesitter and more text objects based on treesitter objects
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all"
            }
        end,
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground',
            'p00f/nvim-ts-rainbow'
        }
    }

    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    use {
        "RRethy/vim-illuminate",
        config = function()
            require("custom_plugins.illuminate")

        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        run = ':TSUpdate',
        requires = {
            'ElPiloto/telescope-vimwiki.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            }
        }
    }

    -- Cycle through yanked text
    use 'bfredl/nvim-miniyank'

    -- Easy motion with SPC-h
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {}
        end
    }

    -- File explorer
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            pcall(require, "custom_plugins/nvim-tree")
        end
    }

    -- Org and wiki
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_map_prefix = '<Leader>W'
            vim.g.vimwiki_list = {path = '~/Documents/vimwiki/', syntax = 'markdown', ext = '.md'}
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_hl_headers = 1
        end,
        opt = true,
        filetype = "vimwiki"
    }

    use {
        "nvim-neorg/neorg",
        ft = "norg",
        after = "nvim-treesitter",
        config = function()
            pcall(require, "custom_plugins/neorg")
        end
    }

    -- To change the working directory when new file is open
    use 'airblade/vim-rooter'

    ----------------- Appearence --------------------
    -- Nice error, warnings and notes list with SPC-i
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    -- Icons
    use 'ryanoasis/vim-devicons'

    -- Bottom power line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            pcall(require, "custom_plugins/lualine")
        end
    }

    -- Dracula theme
    use {
        'Mofiqul/dracula.nvim',
        config = function()
            require("custom_plugins/dracula")
        end
    }

    use 'folke/tokyonight.nvim'


    -- Fancy notifications
    use {
        'rcarriga/nvim-notify',
        config = function()
            pcall(require, "custom_plugins/notify")
        end
    }

    -- Fancy input boxes
    use {
        'stevearc/dressing.nvim',
    }

    -- See colors hex
    use 'norcalli/nvim-colorizer.lua'

    -- Top line with tabs
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            pcall(require, "custom_plugins/bufferline")
        end,
        -- after = "nvim-transparent"
    }

    use {
        'xiyaowong/nvim-transparent',
        config = function()
            pcall(require, "custom_plugins/transparent")
        end,
        after = {"bufferline.nvim", "dressing.nvim"}
    }

    -- Indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append "eol:↴"

            require("indent_blankline").setup {
                buftype_exclude = {"terminal"},
                show_current_context = true,
                show_current_context_start = true,
            }

        end
    }

    ----------------- Git ------------------------------------
    -- Git commands
    use 'tpope/vim-fugitive'
    -- Git commit browser (:GV)
    use 'junegunn/gv.vim'
    -- Git diff simbols on number column
    use 'lewis6991/gitsigns.nvim'
    -- Shows git commits under the cursor (leader gm)
    use 'rhysd/git-messenger.vim'


    --------------- Key maps--------------------------------
    use {
        'folke/which-key.nvim',
        config = function()
            pcall(require, "custom_plugins/which-key")
        end
    }

    ----------- Float terminal -----------
    use {
        'voldikss/vim-floaterm',
        config = function()
            -- globals commands
            vim.g.floaterm_keymap_toggle = '<F1>'
            vim.g.floaterm_keymap_next   = '<F2>'
            vim.g.floaterm_keymap_prev   = '<F3>'
            vim.g.floaterm_keymap_new    = '<F4>'
            -- global settings
            vim.g.floaterm_gitcommit='floaterm'
            vim.g.floaterm_autoinsert=1
            vim.g.floaterm_width=0.8
            vim.g.floaterm_height=0.8
            vim.g.floaterm_wintitle=0
            vim.g.floaterm_autoclose=1
        end
    }

    ----------- Markdown preview ------------
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    }

    -------------- Jupyter ascending -----------
    -- Jupyter form nvim. Needs additional installation:
    -- $ pip install jupyter_ascending
    -- $ jupyter nbextension install --py --sys-prefix jupyter_ascending
    -- $ jupyter nbextension     enable jupyter_ascending --sys-prefix --py
    -- $ jupyter serverextension enable jupyter_ascending --sys-prefix --py
    -- And remember to crate the pairs before edditing
    -- $ python -m jupyter_ascending.scripts.make_pair --base example
    use {
        'untitled-ai/jupyter_ascending.vim',
        opt = true,
        cmd = {'JupyterExecute', 'JupyterExecuteAll'}
    }

    ------------- Symbols in split view --------------
    --use {
    --   'simrat39/symbols-outline.nvim',
    --  config = function()
    --     require("symbols-outline").setup()
    -- end
    -- }

    ----------------- LSP and autocompletion -------------------
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            {
                "neovim/nvim-lspconfig",
                config = function()
                    pcall(require, "custom_plugins/lspconfig")
                end
            },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "ray-x/lsp_signature.nvim",
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    pcall(require, "custom_plugins/luasnip")
                end
            },
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim"
        },
        config = function()
            pcall(require, "custom_plugins/cmp")
        end
    }

    -- Add diagnostics and formaters to lsp
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.black,
                    require("null-ls").builtins.formatting.yapf,
                    require("null-ls").builtins.diagnostics.mypy,
                    -- require("null-ls").builtins.completion.spell,
                },
            })
        end
    }

    ------------------ Debug adapter protocol (DAP) ------
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
        },
        config = function()
            require('dap')
            require('dapui').setup()
            vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
            vim.fn.sign_define('DapBreakpointCondition', {text='🟠', texthl='', linehl='', numhl=''})
            vim.fn.sign_define('DapLogPoint', {text='🟢', texthl='', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='➡️ ', texthl='', linehl='', numhl=''})
        end
    }

    ------------------ Test --------------
    use {
        "nvim-neotest/neotest",
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        args = { "--log-level", "DEBUG" },
                        runner = "pytest",
                    })
                }
            })
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "antoinemadec/FixCursorHold.nvim"
        }
    }
end
)
