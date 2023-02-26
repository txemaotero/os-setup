
-- Add diagnostics and formaters to lsp
return {
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
