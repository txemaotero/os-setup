" Enable syntax highlighting
syntax on

" Fixes backspace over indentation end of line and line start
set backspace=indent,eol,start

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line

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
let mapleader = " "
let g:mapleader = " "

" nnoremap <Space> <Nop>

" Live search and replace
set inccommand=nosplit

" use ripgreg instead of grep
set grepprg=rg\ --vimgrep

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

nmap <CR> o<Esc>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

set undofile
set undodir=~/.nvim/undodir_vscode
