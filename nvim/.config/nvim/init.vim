if $SSH_CLIENT == "" && $SSH_TTY == ""
    set clipboard+=unnamedplus
endif

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

if exists('g:vscode')
    " VSCode extension
    call plug#begin('~/.config/nvim/autoload/plugged')
        Plug 'tpope/vim-repeat'
        Plug 'vim-scripts/ReplaceWithRegister'
        Plug 'tpope/vim-surround'
        " Cycle through yanked text
        Plug 'bfredl/nvim-miniyank'
        " Align
        Plug 'junegunn/vim-easy-align'
    call plug#end()

    """"""" Vscode configuration
    " Which key
    nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
    xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>
    " Comment commands
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    "Undo
    set undofile undodir=~/.nvim/undodir_vscode
else
    " Add runtime to load content in config folder
    set runtimepath+=~/.config/nvim/config
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
        " Plug 'liuchengxu/vim-which-key'
        Plug 'folke/which-key.nvim'
        " Autoclose parenth
        Plug 'steelsojka/pears.nvim'
        " Float terminal
        Plug 'voldikss/vim-floaterm'
        " Undo tree
        Plug 'mbbill/undotree'
        " Black formatter python
        Plug 'psf/black'
        " View and search LSP symbols, tags
        Plug 'simrat39/symbols-outline.nvim'
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
        " Fish indent and stuffs
        Plug 'dag/vim-fish'
        " Markdown
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
        " Align text
        Plug 'junegunn/vim-easy-align'
        " Top tabline
        Plug 'akinsho/bufferline.nvim'
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
        " Fancy notifications
        Plug 'rcarriga/nvim-notify'
    call plug#end()
    """ Configuration
    set mouse=a mousemodel=popup " enable mouse support
    " relative line numbers except in insert mode
    set number relativenumber
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber 
    " use ripgreg instead of grep if present
    " Color scheme
    set termguicolors
    let g:sonokai_transparent_background = 1
    colorscheme sonokai
    " Permanent undo history
    set undofile undodir=~/.nvim/undodir
    " Spell
    set spelllang=en,es spellsuggest=best,9
endif

""" Common configuration for nvim and vscode
syntax on " Enable syntax highlighting
set backspace=indent,eol,start " Fixes backspace over
set ruler cursorline " Enable line/column info at bottom
set linebreak " Not breaking the lines in words
autocmd BufRead,BufNewFile *.md,*.txt set tw=80 " Wrap on txt and md
set scrolloff=10 " Number of lines bellow
set smartindent autoindent " Autoindentation
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " Tab = 4 spaces
autocmd FileType html,vue,json,js setlocal tabstop=2 shiftwidth=2 softtabstop=2 " Exceptions
" File type detection for indent and plugin
filetype on
filetype indent on
filetype plugin on
set incsearch ignorecase smartcase inccommand=nosplit " Nice search and replace
" leader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
if executable('rg')
    set grepprg=rg\ --vimgrep
endif

" Map fd as esc
imap fd <Esc>
" Delete and yank to end of line
nmap D d$
nmap Y y$
" Insert new line in comand mode
nmap <CR> o<Esc>

" Cycle through yanked text
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-p> <Plug>(miniyank-cycle)
map <C-n> <Plug>(miniyank-cycleback)

" Interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
