-- Setup indentation guides
vim.opt.list = true

require("indent_blankline").setup {
    buftype_exclude = {"terminal"}
}
