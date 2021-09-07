"ut auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" List coc extensions
let g:coc_global_extensions = [
\ 'coc-actions',
\ 'coc-explorer',
\ 'coc-floaterm',
\ 'coc-json',
\ 'coc-marketplace',
\ 'coc-pairs',
\ 'coc-prettier',
\ 'coc-python',
\ 'coc-sh',
\ 'coc-snippets',
\ 'coc-vimlsp',
\ 'coc-vetur',
\ 'coc-html',
\ 'coc-emmet',
\ 'coc-tsserver',
\ 'coc-html-css-support',
\ 'coc-yank'
\ ]

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'bfredl/nvim-miniyank'

    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    
    " File explorer
    " Plug 'kyazdani42/nvim-tree.lua'

    " Telescope (for finding)
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'fhill2/telescope-ultisnips.nvim'

    " To change the working directory when new file is open
    Plug 'airblade/vim-rooter'

    " Comments
    Plug 'tpope/vim-commentary'

    " Change surraund
    Plug 'tpope/vim-surround'

    " Git
    Plug 'tpope/vim-fugitive'

    " Color line bottom
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Color themes
    Plug 'xiyaowong/nvim-transparent'
    Plug 'tanvirtin/monokai.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'
    Plug 'marko-cerovac/material.nvim'

    " Git commit browser
    Plug 'junegunn/gv.vim'

    " Vifm
    Plug 'vifm/vifm.vim'
    
    " Better repeat
    Plug 'tpope/vim-repeat'

    " Which key
    Plug 'liuchengxu/vim-which-key'

    " Color parenthesis
    Plug 'luochen1990/rainbow'
    " Autoclose parenth
    " Plug 'cohama/lexima.vim'
    " Plug 'jiangmiao/auto-pairs'
    " Plug 'windwp/nvim-autopairs'

    " Float terminal
    Plug 'voldikss/vim-floaterm'

    " Undo tree
    Plug 'mbbill/undotree'

    " Find and replace
    Plug 'brooth/far.vim'

    " Git diff simbols on number column 
    Plug 'airblade/vim-gitgutter'

    " Shows git commits under the cursor
    Plug 'rhysd/git-messenger.vim'

    " View and search LSP symbols, tags
    Plug 'liuchengxu/vista.vim'

    " Snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
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
    
    " Fish
    Plug 'dag/vim-fish'
    
    " Toml (starship)
    Plug 'cespare/vim-toml'
    
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    
    " Align text
    Plug 'godlygeek/tabular'

    " Top tabline
    Plug 'romgrk/barbar.nvim'

    " Better syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter'

    " LSP
    " Plug 'neovim/nvim-lspconfig'

    " Autocompletion
    " Plug 'hrsh7th/nvim-compe'

    " HTML tags
    " Plug 'alvan/vim-closetag'
    
    " COC
     Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
