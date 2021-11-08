set clipboard+=unnamedplus

let path = expand('%:p:h')

if exists('g:vscode')
    " VSCode extension
    exe 'source' path . './config/vscode/init.vim'
else
    exe 'source' path . '/config/plugins.vim'
    exe 'source' path . '/config/init.vim'
    exe 'luafile' path . '/config/init.lua'
    exe 'source' path . '/config/keybinds.vim'
endif
