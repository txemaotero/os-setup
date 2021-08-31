" init.vim contains all of the initialization plugins for vim
" note that this has to be sourced second since dein needs to
" run its scripts first. This contains misc startup settings
" for vim

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable syntax highlighting
syntax on

" Fixes backspace over indentation end of line and line start
set backspace=indent,eol,start

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line

" Not breaking the lines in words
set linebreak

" Number of lines bellow cursor before scroll
set scrolloff=10

" Autoindentation
set smartindent
set autoindent

" File type detection
filetype on
" Loads the corresponding indent file for the filetype
filetype indent on
" Loads the corresponding pluggins for the filetype
filetype plugin on

" Tab = 4 spaces
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html,vue,json,js setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Wrap
autocmd BufRead,BufNewFile *.md set tw=80

" enable mouse support
set mouse=a mousemodel=popup

" Changes words with symbols
set conceallevel=0

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
set number
set relativenumber

" Search {{{
set incsearch       " search as characters are entered
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
                    " case-sensitive otherwise

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Live search and replace
set inccommand=nosplit

" use ripgreg instead of grep
set grepprg=rg\ --vimgrep

" Hide files in the background instead of closing them
set hidden

" Color scheme
set termguicolors
colorscheme sonokai

let g:transparent_enabled = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

set undofile
set undodir=~/.nvim/undodir
