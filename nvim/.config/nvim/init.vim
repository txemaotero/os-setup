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
        " Plug 'asvetliakov/vim-easymotion'
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
    " List of pluggins
    call plug#begin('~/.config/nvim/autoload/plugged')
        " Easy motion
        Plug 'phaazon/hop.nvim'

        " Trouble (nice error, warnings and notes)
        Plug 'folke/trouble.nvim'

        " Add diagnostics and formaters to lsp
        Plug 'jose-elias-alvarez/null-ls.nvim'

        """"""" Must be pluggins
        " sort with gs
        Plug 'ralismark/opsort.vim'
        " Align text
        Plug 'junegunn/vim-easy-align'
        " Change surround
        Plug 'kylechui/nvim-surround'
        " Comments
        Plug 'numToStr/Comment.nvim'
        " Better repeat
        Plug 'tpope/vim-repeat'
        " Autoclose parenth
        Plug 'steelsojka/pears.nvim'
        " Replace with register
        Plug 'vim-scripts/ReplaceWithRegister'
        " Smooth scroll
        Plug 'psliwka/vim-smoothie'
        " More text objects based on treesitter objects
        Plug 'nvim-treesitter/nvim-treesitter-textobjects'

        " Vim wiki
        Plug 'vimwiki/vimwiki'
        Plug 'ElPiloto/telescope-vimwiki.nvim'

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

        " To change the working directory when new file is open
        Plug 'airblade/vim-rooter'

        """"""""""""""" Appearence """"""""""""""
        " Color line
        Plug 'nvim-lualine/lualine.nvim'
        " Themes
        Plug 'tanvirtin/monokai.nvim'
        Plug 'sainnhe/gruvbox-material'
        Plug 'sainnhe/sonokai'
        Plug 'marko-cerovac/material.nvim'
        Plug 'Mofiqul/dracula.nvim'
        " Fancy notifications
        Plug 'rcarriga/nvim-notify'
        " Nice input pop ups
        Plug 'stevearc/dressing.nvim'
        " See the colors hex
        Plug 'norcalli/nvim-colorizer.lua'
        " Top tabline
        Plug 'akinsho/bufferline.nvim'
        " Color parenthesis (treesitter module)
        Plug 'p00f/nvim-ts-rainbow'
        " Indent guides
        Plug 'lukas-reineke/indent-blankline.nvim'
        " Treesitter Better syntax highlight
        Plug 'nvim-treesitter/nvim-treesitter'
        " TS playground
        Plug 'nvim-treesitter/playground'

        " Git
        Plug 'tpope/vim-fugitive'
        " Git commit browser (:GV)
        Plug 'junegunn/gv.vim'
        " Git diff simbols on number column 
        Plug 'lewis6991/gitsigns.nvim'
        " Shows git commits under the cursor (leader gm)
        Plug 'rhysd/git-messenger.vim'

        " Vifm
        Plug 'vifm/vifm.vim'

        " Which key
        Plug 'folke/which-key.nvim'

        " Float terminal
        Plug 'voldikss/vim-floaterm'

        " Snippets
        Plug 'L3MON4D3/LuaSnip'
        Plug 'saadparwaiz1/cmp_luasnip'
        Plug 'rafamadriz/friendly-snippets'

        " Markdown
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
        " Jupyter form nvim. Needs additional installation:
        " $ pip install jupyter_ascending
        " $ jupyter nbextension install --py --sys-prefix jupyter_ascending
        " $ jupyter nbextension     enable jupyter_ascending --sys-prefix --py
        " $ jupyter serverextension enable jupyter_ascending --sys-prefix --py
        " And remember to crate the pairs before edditing
        " $ python -m jupyter_ascending.scripts.make_pair --base example
        Plug 'untitled-ai/jupyter_ascending.vim'

        " LSP and auto-completion (cmp)
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/cmp-nvim-lua'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'ray-x/lsp_signature.nvim'
        " View and search LSP symbols, tags
        Plug 'simrat39/symbols-outline.nvim'
        " Symbols
        Plug 'onsails/lspkind.nvim'

        " Debug addapter protocol (DAP)
        Plug 'mfussenegger/nvim-dap'
        Plug 'rcarriga/nvim-dap-ui'

        " Tests
        Plug 'antoinemadec/FixCursorHold.nvim'
        Plug 'nvim-neotest/neotest'
        Plug 'nvim-neotest/neotest-python'
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
    " let g:sonokai_transparent_background = 1
    " Permanent undo history
    set undofile undodir=~/.nvim/undodir
    " Spell
    set spelllang=en,es spellsuggest=best,9
    autocmd FileType text,latex,markdown,vimwiki setlocal spell

    " Change wiki prefix
    let g:vimwiki_map_prefix = '<Leader>W'
    let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
    let g:vimwiki_global_ext = 0
    let g:vimwiki_hl_headers = 1

endif

""" Common configuration for nvim and vscode
syntax on                                                                       " Enable syntax highlighting
set backspace=indent,eol,start                                                  " Fixes backspace over
set ruler cursorline                                                            " Enable line/column info at bottom
set linebreak                                                                   " Not breaking the lines in words
autocmd BufRead,BufNewFile *.md,*.txt set tw=80                                 " Wrap on txt and md
set scrolloff=10                                                                " Number of lines bellow

set smartindent autoindent                                                      " Autoindentation
set expandtab tabstop=4 shiftwidth=4 softtabstop=4                              " Tab = 4 spaces
autocmd FileType html,vue,json,js setlocal tabstop=2 shiftwidth=2 softtabstop=2 " Exceptions

" File type detection for indent and plugin
filetype on
filetype indent on
filetype plugin on

set incsearch ignorecase smartcase inccommand=nosplit " Nice search and replace

" leader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Use ripgrep instead of grep if possible
if executable('rg')
    set grepprg=rg\ --vimgrep
endif

""""""""""""""""""""""""" Mappings """"""""""""""""""
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

" For Emacs-style editing on the command-line: 
:cnoremap <C-A> <Home>
:cnoremap <C-B> <Left>
:cnoremap <C-D> <Del>
:cnoremap <C-E> <End>
:cnoremap <C-F> <Right>
:cnoremap <C-N> <Down>
:cnoremap <C-P> <Up>
