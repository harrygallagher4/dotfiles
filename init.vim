set nocompatible

call plug#begin('~/.config/nvim/plugins')

" Functionality
Plug '/usr/local/opt/fzf'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'tpope/vim-surround'

" Language support
" Plug 'l04m33/vlime', {'rtp': 'vim/'}
" Plug 'leafgarland/typescript-vim'
" Plug 'tpope/vim-liquid'
Plug 'sheerun/vim-polyglot'

" Interface
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'mhinz/vim-startify'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"

"syntax on
set termguicolors
let ayucolor="mirage"
set background=dark
colorscheme ayu

" highlight LineNr ctermfg=8
let g:jsx_ext_required=0                 " use jsx syntax for .js files

set autoread                             " read changes to unmodified buffers
set nobackup
set writebackup
set directory=~/.config/nvim/.backup     " store swap files in ~/.vim/backup
set backupdir=~/.config/nvim/.backup     " store backup files in ~/.vim/backup
set hidden                               " keep buffers around when closed
set linebreak                            " wrap at words
set number                               " show line numbers
set numberwidth=4                        " reserve 4 columns for line numbers
set cursorline                           " highlight column with curosr in it
set noshowcmd                            " show commands in progress
set backspace=indent,eol,start           " make backspace work in insert mode
set hlsearch                             " highlight search matches
set ignorecase                           " ignore case in search
set incsearch                            " show search matches while typing
set smartcase                            " don't ignore case when we include an upper-case letter
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                            " tab -> spaces
set wildmenu                             " use menu for tab completion
set wildmode=longest,full                " don't use menu for first completion
set pumheight=8
set splitbelow
set splitright
set undofile
set undodir=~/.config/nvim/.undofiles

let g:startify_customm_header = []
let g:startify_bookmarks = [{',': '~/.dotfiles/init.vim'}]
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }]

let g:fzf_layout = { 'up': '~25%' }
let g:fzf_buffers_jump = 1

" windows
nnoremap <c-`> :10new<cr>:term<cr>A
nnoremap \ :vnew<cr>
" my brain likes to use shift+\ instead of \ but I still think the
" binding makes sense. maybe one day my muscle memory will change
nnoremap \| :vnew<cr>
nnoremap - :new<cr>

nnoremap <c-x> :wincmd c<cr>
tnoremap <c-x> <c-\><c-n>:wincmd c<cr>

" <c-hjkl> for window movement
nnoremap <c-h> <c-w>h
tnoremap <c-h> <c-\><c-n><c-w>h

nnoremap <c-j> <c-w>j
tnoremap <c-j> <c-\><c-n><c-w>j

nnoremap <c-k> <c-w>k
tnoremap <c-k> <c-\><c-n><c-w>k

nnoremap <c-l> <c-w>l
tnoremap <c-l> <c-\><c-n><c-w>l

" tabs
nnoremap <silent> <leader><c-l> :+tabnext<cr>
nnoremap <silent> <leader><c-h> :-tabnext<cr>

" FZF mappings
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader><s-p> :Commands<cr>

" Key mappings
inoremap jk <esc>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
nnoremap <tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap j gj
nnoremap k gk

" edit (neo)vim settings
nnoremap <leader>, :e ~/.dotfiles/init.vim<cr>

if !exists("g:autocmds_loaded")
    augroup harry
    autocmd!
    let g:autocmds_loaded = 1

    autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc
    autocmd BufWritePost */.dotfiles/init.vim execute 'silent !fresh >/dev/null'
    autocmd TermOpen * set filetype=term
    autocmd WinEnter term://* call MaybeStartInsertInTerminal()
    augroup END
endif

function! MaybeStartInsertInTerminal()
    if !exists('g:dont_start_insert_in_terminal')
        startinsert
    endif
endfunction

function! ResetCustomAutocmds()
    augroup harry
        autocmd!
    augroup END
    unlet g:autocmds_loaded 
endfunction

function! FindActiveTerminal()
    let g:dont_start_insert_in_terminal=1
    let g:last_window=bufwinid("%")
    let g:active_terminal=0
    windo call SetActiveTerminal()
    call win_gotoid(g:last_window)
    unlet g:dont_start_insert_in_terminal
endfunction

function! SetActiveTerminal()
    if exists('b:terminal_job_id')
        let g:active_terminal = b:terminal_job_id
    endif
    return 0
endfunction

" reset cursor on leave
au VimLeave * set guicursor=a:hor8-blinkon1

