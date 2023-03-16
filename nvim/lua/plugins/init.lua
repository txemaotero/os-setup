return {
    ---- Must be pluggins--------
    'ralismark/opsort.vim',                             -- Allows sorting by values of lines
    'junegunn/vim-easy-align',                          -- Align text with ga
    {'kylechui/nvim-surround', config = true},          -- Change surround cs
    {'numToStr/Comment.nvim', config = true},           -- Comments
    'tpope/vim-repeat',                                 -- Better repeat
    {"windwp/nvim-autopairs", config = true},           -- Autoclose parenth
    'vim-scripts/ReplaceWithRegister',                  -- Replace with register
    {'phaazon/hop.nvim', branch = 'v2', config = true}, -- Easy motion with SPC-h
    'airblade/vim-rooter',                              -- Change the working directory when new file is open
    {'gbprod/yanky.nvim', config = true},

    {'stevearc/oil.nvim', config = true},               -- File explorer

    'github/copilot.vim',

    --- More text objects
    {
        "chrisgrieser/nvim-various-textobjs",
        config = function ()
            require("various-textobjs").setup({ useDefaultKeymaps = true })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
    },

    -- Add colors to funciton agruments
    {
        'm-demare/hlargs.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },

    ----------------- Appearence --------------------
    -- Nice error, warnings and notes list with SPC-i
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function ()
            local signs = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " ",
                Ok = "﫠"
            }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
            end
            require("trouble").setup{
                icons = true,
                signs = {
                    error = signs.Error,
                    warning = signs.Warn,
                    hint = signs.Hint,
                    information = signs.Info,
                    other = signs.Ok
                },
            }
        end
    },
    'ryanoasis/vim-devicons', -- Icons
    'stevearc/dressing.nvim', -- Fancy input boxes
    {'norcalli/nvim-colorizer.lua', config = true}, -- See colors hex

    ----------- Markdown preview ------------
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },

    -------------- Jupyter ascending -----------
    -- Jupyter form nvim. Needs additional installation:
    -- $ pip install jupyter_ascending
    -- $ jupyter nbextension install --py --sys-prefix jupyter_ascending
    -- $ jupyter nbextension     enable jupyter_ascending --sys-prefix --py
    -- $ jupyter serverextension enable jupyter_ascending --sys-prefix --py
    -- And remember to crate the pairs before edditing
    -- $ python -m jupyter_ascending.scripts.make_pair --base example
    {
        'untitled-ai/jupyter_ascending.vim',
        cmd = {'JupyterExecute', 'JupyterExecuteAll'}
    },

    {
        "williamboman/mason.nvim",
        config = true,
    },

}
