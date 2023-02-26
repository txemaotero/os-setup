-- Indent guides
return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        vim.opt.list = true

        require("indent_blankline").setup {
            buftype_exclude = {"terminal"},
            show_current_context = true,
            show_current_context_start = true,
        }

    end
}
