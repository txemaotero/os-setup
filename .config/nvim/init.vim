set clipboard+=unnamedplus

if exists('g:vscode')
    " VSCode extension
    exe 'source' './config/vscode/init.vim'
else
    exe 'source' './config/plugins.vim'
    exe 'source' './config/init.vim'
    exe 'luafile' './config/init.lua'
    exe 'source' './config/keybinds.vim'
endif
