if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


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


nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

" Comment commands
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

set undofile undodir=~/.nvim/undodir_vscode

""" Common configuration for nvim and vscode
set backspace=indent,eol,start                                                  " Fixes backspace over
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
