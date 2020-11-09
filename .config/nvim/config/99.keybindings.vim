" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Map fd as esc
imap fd <Esc>

" Fix block paste (associated to miniyank pluggin)
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

nmap D d$
nmap Y y$

" Insert new line in comand mode
nmap <CR> o<Esc>

xnoremap = :call CocAction('formatSelected', visualmode())<CR>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
