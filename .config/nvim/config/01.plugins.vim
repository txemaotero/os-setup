" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" List coc extensions
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-python'
\ ]

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'bfredl/nvim-miniyank'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/gv.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'tpope/vim-repeat'
    Plug 'liuchengxu/vim-which-key'

call plug#end()
