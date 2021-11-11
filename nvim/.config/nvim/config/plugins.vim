" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.config/nvim/autoload/plugged')

    " Cycle through yanked text
    Plug 'bfredl/nvim-miniyank'

    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'

    " File explorer
    Plug 'kyazdani42/nvim-tree.lua'

    " Telescope (for finding)
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " harpoon
    Plug 'ThePrimeagen/harpoon'

    " To change the working directory when new file is open
    Plug 'airblade/vim-rooter'

    " Comments
    Plug 'tpope/vim-commentary'

    " Change surraund
    Plug 'tpope/vim-surround'

    " Color line
    Plug 'nvim-lualine/lualine.nvim'

    " Color themes
    Plug 'tanvirtin/monokai.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'
    Plug 'marko-cerovac/material.nvim'

    " Git
    Plug 'tpope/vim-fugitive'
    " Git commit browser (:GV)
    Plug 'junegunn/gv.vim'
    " Git diff simbols on number column 
    Plug 'mhinz/vim-signify'
    " Shows git commits under the cursor (leader gm)
    Plug 'rhysd/git-messenger.vim'

    " Vifm
    Plug 'vifm/vifm.vim'

    " Better repeat
    Plug 'tpope/vim-repeat'

    " Which key
    Plug 'liuchengxu/vim-which-key'

    " Autoclose parenth
    Plug 'steelsojka/pears.nvim'

    " Float terminal
    Plug 'voldikss/vim-floaterm'

    " Undo tree
    Plug 'mbbill/undotree'

    " Black formatter python
    Plug 'psf/black'

    " View and search LSP symbols, tags
    Plug 'liuchengxu/vista.vim'

    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'

    " See the colors hex
    Plug 'norcalli/nvim-colorizer.lua'

    " Replace with register
    Plug 'vim-scripts/ReplaceWithRegister'

    " Smooth scroll
    Plug 'psliwka/vim-smoothie'

    " More text objects
    Plug 'wellle/targets.vim'
    " Revisar: Igual que targets pero con treesitter
    " Plug 'nvim-treesitter/nvim-treesitter-textobjects

    " Fish indent and stuffs
    Plug 'dag/vim-fish'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Align text ej: ":Tabularize /,"
    Plug 'godlygeek/tabular'

    " Top tabline
    Plug 'romgrk/barbar.nvim'

    " Better syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter'
    " Color parenthesis (treesitter module)
    Plug 'p00f/nvim-ts-rainbow'
    " Indent guides
    Plug 'lukas-reineke/indent-blankline.nvim'

    " LSP and auto-completion (cmp)
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'ray-x/lsp_signature.nvim'

    " For vsnip user.
    Plug 'hrsh7th/cmp-vsnip'

    " Copilot
    Plug 'github/copilot.vim'

    " Debug addapter protocol
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'

call plug#end()

