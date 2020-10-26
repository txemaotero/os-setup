" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Leader maps
nmap <Leader>fs :w!<cr>
nmap <Leader>ff :e
nmap <Leader>bd :bd<cr>
nmap <Leader>bn :bn<cr>
nmap <Leader>bp :bp<cr>
nmap <Leader><Tab> :b#<cr>
nmap <Leader>fed :e ~/.vimrc<cr>

" Map fd as esc
imap fd <Esc>

" Fix block paste (associated to miniyank pluggin)
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

nmap D d$
nmap Y y$

" Insert new line in comand mode
nmap <CR> o<Esc>
nmap <C-j> i<CR><Esc>
