function TodoCheck ()

    vim.cmd[[syntax match my_todo '\v(\s+)?-\s\[\s\]'hs=e-4 conceal cchar=]]
    vim.cmd[[syntax match my_todo_done '\v(\s+)?-\s\[X\]'hs=e-4 conceal cchar=]]

    vim.cmd[[hi Conceal guibg=NONE guifg=white]]

    vim.opt_local.cole = 1
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"text", "latex", "markdown", "vimwiki"},
    callback = TodoCheck
})

vim.cmd[[colorscheme tokyonight]]
