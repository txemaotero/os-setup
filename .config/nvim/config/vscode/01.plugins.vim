" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'vim-scripts/ReplaceWithRegister'
    " Change surraund
    Plug 'tpope/vim-surround'

call plug#end()
