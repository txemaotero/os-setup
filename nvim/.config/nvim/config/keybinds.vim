" Define keybindings most of them using which-key plugin

" Window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Map fd as esc
imap fd <Esc>

" Cycle through yanked text
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-p> <Plug>(miniyank-cycle)
map <C-n> <Plug>(miniyank-cycleback)

" Delete and yank to end of line
nmap D d$
nmap Y y$

" Insert new line in comand mode
nmap <CR> o<Esc>


" check which-key.nvim to change to lua
" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=300

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/']      = [ ':Telescope live_grep'        , 'find text']
let g:which_key_map['<Tab>']  = [ ':b#'                         , 'alternate buffer']
let g:which_key_map['.']      = [ ':e $MYVIMRC'                 , 'open config' ]
let g:which_key_map[';']      = [ ':Telescope commands'         , 'commands' ]
let g:which_key_map['=']      = 'format selected'
let g:which_key_map['d']      = [ ':bdelete'                    , 'delete buffer']
let g:which_key_map['e']      = [ ':NvimTreeToggle'             , 'explorer' ]
let g:which_key_map['n']      = [ ':let @/ = ""'                , 'no highlight' ]
let g:which_key_map['q']      = [ 'q'                           , 'quit' ]
let g:which_key_map['m']      = [ ':Vifm'                       , 'vifm' ]
let g:which_key_map['u']      = [ ':UndotreeToggle'             , 'undo tree']
let g:which_key_map['H']      = [ '<C-W>s'                      , 'split below']
let g:which_key_map['V']      = [ '<C-W>v'                      , 'split right']
let g:which_key_map['v']      = 'init selection'

" b is for buffer (most from barbar)
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '>' : [':BufferMoveNext'        , 'move next'],
      \ '<' : [':BufferMovePrevious'    , 'move prev'],
      \ '1' : [':BufferGoto 1'          , 'buffer 1'],
      \ '2' : [':BufferGoto 2'          , 'buffer 2'],
      \ '3' : [':BufferGoto 3'          , 'buffer 3'],
      \ '4' : [':BufferGoto 4'          , 'buffer 4'],
      \ '5' : [':BufferGoto 5'          , 'buffer 5'],
      \ '6' : [':BufferGoto 6'          , 'buffer 6'],
      \ '7' : [':BufferGoto 7'          , 'buffer 7'],
      \ '8' : [':BufferGoto 8'          , 'buffer 8'],
      \ '9' : [':BufferGoto 9'          , 'buffer 9'],
      \ '0' : [':BufferGoto 0'          , 'buffer 0'],
      \ 'b' : ['BufferPick'             , 'pick buffer'],
      \ 'd' : [':bd'                    , 'delete-buffer'],
      \ 'f' : ['bfirst'                 , 'first-buffer'],
      \ 'l' : ['blast'                  , 'last buffer'],
      \ 'n' : ['bnext'                  , 'next-buffer'],
      \ 'p' : ['bprevious'              , 'previous-buffer'],
      \ '?' : [':Telescope buffers'     , 'find-buffer'],
      \ }

" f is for files
let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 's' : ['w'                                                               , 'write'],
      \ 'f' : [':Telescope find_files find_command=rg,--ignore,--hidden,--files' , 'files'],
      \ }

" p is for project
let g:which_key_map.p = {
      \ 'name' : '+project' ,
      \ 'r' : 'rename variable',
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':Telescope commands_history'                                     , 'history'],
      \ ';' : [':Telescope commands'                                             , 'commands'],
      \ 'a' : [':Telescope live_grep'                                            , 'find text'],
      \ 'b' : [':Telescope current_buffer_fuzzy_find'                            , 'current buffer'],
      \ 'B' : [':Telescope buffers'                                              , 'open buffers'],
      \ 'f' : [':Telescope find_files find_command=rg,--ignore,--hidden,--files' , 'files'],
      \ 'c' : [':Telescope git_commits'                                          , 'commits'],
      \ 'g' : [':Telescope git_files'                                            , 'git files'],
      \ 'm' : [':Telescope marks'                                                , 'marks'] ,
      \ 'p' : [':Telescope help_tags'                                            , 'help tags'] ,
      \ 'P' : [':Telescope tags'                                                 , 'project tags'],
      \ 's' : [':Telescope ultisnips'                                            , 'snippets'],
      \ 'S' : [':Telescope colorscheme'                                          , 'color schemes'],
      \ 't' : [':Telescope live_grep'                                            , 'text Rg'],
      \ 'T' : [':Telescope cuffent_buffer_tags'                                  , 'buffer tags'],
      \ 'z' : [':Telescope'                                                      , 'Telescope'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'S' : [':Git status'                       , 'status'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'r' : ['<Space>pr'                           , 'rename variable'],
      \ '=' : ['<Space>='                            , 'format selection'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'i' : [':FloatermNew ipython'                           , 'ipython'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'e' : [':FloatermNew vifm'                              , 'vifm'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" w is for window
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 's' : ['<C-w>s'                              , 'split hor'],
      \ 'v' : ['<C-w>v'                              , 'split ver'],
      \ 'q' : ['<C-w>q'                              , 'quit current'],
      \ 'w' : ['<C-w>w'                              , 'move last'],
      \ 'j' : ['<C-w>j'                              , 'move j'],
      \ 'i' : ['<C-w>i'                              , 'move i'],
      \ 'k' : ['<C-w>k'                              , 'move k'],
      \ 'l' : ['<C-w>l'                              , 'move l'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
