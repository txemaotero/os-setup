-- Mouse control
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
    end,
})

-- Term colors
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- Spell
vim.opt.spelllang = {"en", "es"}
vim.opt.spellsuggest = {"best", 9}
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"text", "latex", "markdown", "vimwiki"},
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- Highlight current line
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.linebreak = true

-- Text width to 80 in textfiles
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"text", "latex", "markdown", "vimwiki"},
    callback = function()
        vim.opt_local.tw = 80
    end,
})

-- Number of lines bellow
vim.opt.scrolloff = 10

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "vue", "json", "js"},
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})
vim.opt.list = true
vim.opt.listchars = "tab:->,trail:·"


-- Best search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"

-- Ripgrep if available
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep"
end
