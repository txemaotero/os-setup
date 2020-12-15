if exists('g:vscode')
    " VSCode extension
    for f in split(glob('~/.config/nvim/config/vscode/*.vim'), '\n')
            exe 'source' f
    endfor
else
    " ordinary neovim
    let g:nvim_version = api_info().version

    for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
            exe 'source' f
    endfor

    if g:nvim_version.minor == 5
            for f in split(glob('~/.config/nvim/config/nightly/*.vim'), '\n')
                    exe 'source' f
            endfor
            for f in split(glob('~/.config/nvim/config/nightly/*.lua'), '\n')
                    exe 'luafile' f
            endfor
    endif
endif
