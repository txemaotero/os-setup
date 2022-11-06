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

vim.g.tokyonight_transparent = vim.g.transparent_enabled
vim.cmd[[colorscheme tokyonight]]

vim.cmd[[hi! NormalFloat ctermbg=NONE guibg=NONE blend=0]]
vim.cmd[[hi! Whitespace guifg=#db4b4b]]
