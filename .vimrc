execute pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=700

" Tiempo de espera etre comandos.
set timeoutlen=2000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Change cursor in insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Show line numbers
set nu

" Insert new line in comand mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Linebreak
set linebreak
set nolist
set tw=80

" Color
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Leader maps
nmap <Leader>fs :w!<cr>
nmap <Leader>ff :e
nmap <Leader>bd :bd<cr>
nmap <Leader>qq ZZ
nmap <Leader><Tab> :bNext<cr>
nmap <Leader>fed :e ~/.vimrc<cr>

nmap <Leader>w <C-w>

" Tabs to spaces
set tabstop=4 shiftwidth=4 expandtab
set background=dark
syntax on

" Powerline
set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Undo history
set directory=~/.vim/tmps
if exists("&undodir")
    set undodir=~/.vim/undo
endif
set undofile

" Map fd as esc
imap fd <Esc>

autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType plaintex setlocal commentstring=%\ %s
