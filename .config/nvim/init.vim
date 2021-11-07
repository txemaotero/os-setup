set clipboard+=unnamedplus

if exists('g:vscode')
    " VSCode extension
    for f in split(glob('~/.config/nvim/config/vscode/*.vim'), '\n')
            exe 'source' f
    endfor
else
    for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
            exe 'source' f
    endfor

    for f in split(glob('~/.config/nvim/config/*.lua'), '\n')
            exe 'luafile' f
    endfor
endif
