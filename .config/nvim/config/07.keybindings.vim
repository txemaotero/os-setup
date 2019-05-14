" split pane navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Delete trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" keybindings for language client
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ALE
nmap <F8> <Plug>(ale_fix)

" fzy
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-s> :FuzzyGrep<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neovim visor
let g:neovim_visor_key = '<C-a>'

" change working directory to where the file in the buffer is located
" if user types `,cd`
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" <ESC> exits in terminal mode
tnoremap <ESC> <C-\><C-n><C-w><C-p>

" Easy most-recent-buffer switching
nnoremap <Tab> :buffers<CR>:buffer<Space>


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Leader maps
nmap <Leader>fs :w!<cr>
nmap <Leader>ff :e
nmap <Leader>bd :bd<cr>
nmap <Leader>qq ZZ
nmap <Leader><Tab> :bNext<cr>
nmap <Leader>fed :e ~/.vimrc<cr>

nmap <Leader>w <C-w>

" Map fd as esc
imap fd <Esc>

" Insert new line in comand mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
