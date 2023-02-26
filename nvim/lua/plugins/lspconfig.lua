return {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP
        local nvim_lsp = require('lspconfig')
        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
            -- Enable completion triggered by <c-x><c-o>
            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
            -- Mappings.
            local opts = { noremap=true, silent=true }
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            buf_set_keymap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
            buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
            buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
            buf_set_keymap('n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
            buf_set_keymap('n', '<space>l=', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
        end

        -- Setup lspconfig in cmp.
        require "lsp_signature".setup({
            toggle_key = '<C-e>',
        })

        -- Setup lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local nvim_lsp = require('lspconfig')

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        local servers = { 'pyright', 'tsserver' }
        for _, lsp in ipairs(servers) do
            nvim_lsp[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150,
                }
            }
        end
        nvim_lsp.rust_analyzer.setup{
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            settings = {
                ["rust-analyzer"] = {}
            }
        }

        require'lspconfig'.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end
}
