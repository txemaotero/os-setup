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

" Autocomplete with compe and lexima compatibility
" NOTE: Order is important. You can't lazy loading lexima.vim.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
