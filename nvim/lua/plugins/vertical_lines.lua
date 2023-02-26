-- Vertical line
return {
    "lukas-reineke/virt-column.nvim",
    config = function ()
        require("virt-column").setup { char = "│", virtcolumn = "80,120" }
        vim.cmd[[highlight VirtColumn guifg=#444444]]
    end
}

