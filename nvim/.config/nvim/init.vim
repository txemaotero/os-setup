set clipboard+=unnamedplus

if exists('g:vscode')
    " VSCode extension
    exe 'source' '~/.config/nvim/config/vscode/init.vim'
else
    exe 'source' '~/.config/nvim/config/plugins.vim'
    exe 'source' '~/.config/nvim/config/init.vim'
    exe 'source' '~/.config/nvim/config/init.lua'
    exe 'source' '~/.config/nvim/config/keybinds.vim'
endif
