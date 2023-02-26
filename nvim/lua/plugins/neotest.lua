return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "antoinemadec/FixCursorHold.nvim"
    },
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
}
