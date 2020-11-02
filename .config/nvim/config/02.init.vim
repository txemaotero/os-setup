" init.vim contains all of the initialization plugins for vim
" note that this has to be sourced second since dein needs to
" run its scripts first. This contains misc startup settings
" for vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
set autoindent
" File type detection
filetype on
" Loads the corresponding indent file for the filetype
filetype indent on
" Loads the corresponding pluggins for the filetype
filetype plugin on

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
" convert tabs in spaces
set expandtab
set sts=4 " softtabstop, makes spaces feel like tabs when deleting

" enable mouse support
set mouse=a mousemodel=popup

" Changes words with symbols
set conceallevel=2

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

" Default shell
set shell=/bin/zsh

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
colorscheme molokai
highlight LineNr guifg=#050505

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
