return {
    'nvim-telescope/telescope.nvim',
    build = ':TSUpdate',
    dependencies = {
        'ElPiloto/telescope-vimwiki.nvim',
        'nvim-lua/popup.nvim',
        'ThePrimeagen/git-worktree.nvim',
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    config = function()
        require("telescope").load_extension("git_worktree")
    end
}
