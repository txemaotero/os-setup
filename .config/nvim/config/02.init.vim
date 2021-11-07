" general settings for vim and some of the plugins.
"
" Enable syntax highlighting
syntax on

" Fixes backspace over indentation end of line and line start
set backspace=indent,eol,start

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line

" Not breaking the lines in words
set linebreak
" Wrap
autocmd BufRead,BufNewFile *.md,*.txt set tw=80

" Number of lines bellow cursor before scroll
set scrolloff=10

" Autoindentation
set smartindent
set autoindent
" Tab = 4 spaces
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html,vue,json,js setlocal tabstop=2 shiftwidth=2 softtabstop=2

" File type detection
filetype on
" Loads the corresponding indent file for the filetype
filetype indent on
" Loads the corresponding pluggins for the filetype
filetype plugin on

" enable mouse support
set mouse=a mousemodel=popup

" relative line numbers except in insert mode
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

" Nice search and replace
set incsearch          " search as characters are entered
set ignorecase         " ignore case when searching
set smartcase          " case sens if mayus
set inccommand=nosplit " Live search and replace

" leader to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" use ripgreg instead of grep if present
if executable('rg') 
    set grepprg=rg\ --vimgrep
endif

" Hide files in the background instead of closing them
set hidden

" Color scheme
set termguicolors
let g:sonokai_transparent_background = 1
colorscheme sonokai

" Permanent undo history
set undofile
set undodir=~/.nvim/undodir

" Spell
set spelllang=en,es
set spellsuggest=best,9

"""""""""""""""" Floaterm options
" globals commands
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
" global settings
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1


""""""""""""""" Vista options
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Wnable fzf's preview window 
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" Some custom icons
let g:vista#renderer#icons = {
\    'func': "",
\    'function': "",
\    'functions': "",
\    'constructor': "",
\    'operator': "",
\    'var': "𝓧",
\    'variable': "𝓧",
\    'variables': "𝓧",
\    'const': "",
\    'constant': "",
\    'method': "",
\    'package': "\ue612",
\    'packages': "\ue612",
\    'enum': "\uf702",
\    'enumerator': "\uf702",
\    'module': "\uf136",
\    'modules': "\uf136",
\    'type': "\uf7fd",
\    'typedef': "\uf7fd",
\    'types': "\uf7fd",
\    'field': "\uf30b",
\    'fields': "\uf30b",
\    'macro': "\uf8a3",
\    'macros': "\uf8a3",
\    'map': "\ufb44",
\    'class': "",
\    'augroup': "\ufb44",
\    'struct': "\uf318",
\    'union': "\ufacd",
\    'member': "\uf02b",
\    'target': "\uf893",
\    'property': "\ufab6",
\    'interface': "\uf7fe",
\    'namespace': "\uf475",
\    'subroutine': "\uf9af",
\    'implementation': "\uf776",
\    'typeParameter': "\uf278",
\    'default': "\uf29c"
\  }


"""""""""""""""""" Barbar
let bufferline = {}
let bufferline.shadow = v:true " shadow over the editor
let bufferline.icons = v:true
let bufferline.clickable = v:true
let bufferline.semantic_letters = v:true " Pick buffer with letters
let bufferline.letters =
  \ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP' 
let bg_current = get(nvim_get_hl_by_name('Normal',     1), 'background', '#000000')
let bg_visible = get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#000000')
let bg_inactive = get(nvim_get_hl_by_name('TabLine',   1), 'background', '#000000')
" For the current active buffer
hi default link BufferCurrent      Normal
" For the current active buffer when modified
hi default link BufferCurrentMod   Normal
" For the current active buffer icon
hi default link BufferCurrentSign  Normal
" For the current active buffer target when buffer-picking
exe 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=' . bg_current
" For buffers visible but not the current one
hi default link BufferVisible      TabLineSel
hi default link BufferVisibleMod   TabLineSel
hi default link BufferVisibleSign  TabLineSel
exe 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=' . bg_visible
" For buffers invisible buffers
hi default link BufferInactive     TabLine
hi default link BufferInactiveMod  TabLine
hi default link BufferInactiveSign TabLine
exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive
" For the shadow in buffer-picking mode
hi default BufferShadow guifg=#000000 guibg=#000000
" Icons
let icons = extend({
\ 'bufferline_default_file': '',
\ 'bufferline_separator_active':   '▎',
\ 'bufferline_separator_inactive': '▎',
\ 'bufferline_close_tab': '',
\ 'bufferline_close_tab_modified': '●',
\}, get(g:, 'icons', {})) " 


"""""""""""""""""" Nvim tree
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

