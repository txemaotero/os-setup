local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

require("options")

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    print("Cloning packer ..")
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

    -- install plugins + compile their configs
    vim.cmd("packadd packer.nvim")
    require("custom_plugins/init")
    vim.cmd("PackerSync")
else
    require("custom_plugins/init")
end

