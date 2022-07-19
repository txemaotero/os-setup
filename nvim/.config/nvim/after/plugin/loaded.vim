function TodoCheck()

    syntax match my_todo '\v(\s+)?-\s\[\s\]'hs=e-4 conceal cchar=
    syntax match my_todo_done '\v(\s+)?-\s\[X\]'hs=e-4 conceal cchar=

    hi Conceal guibg=NONE guifg=white

    setlocal cole=1
endfunction

autocmd FileType text,markdown,vimwiki call TodoCheck()
