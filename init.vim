set nocompatible

" {-----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugins')

" Functionality
Plug '/usr/local/opt/fzf'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-surround'

" Language support
" Plug 'l04m33/vlime', {'rtp': 'vim/'}
" Plug 'leafgarland/typescript-vim'
" Plug 'tpope/vim-liquid'
Plug 'andymass/vim-matchup'
Plug 'sheerun/vim-polyglot'

" Interface
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'mhinz/vim-startify'

call plug#end() " -------------------------------------------------------------}

filetype plugin indent on
let mapleader = "\<Space>"

set termguicolors
let ayucolor="mirage"
set background=dark
colorscheme ayu
let g:vim_jsx_pretty_colorful_config=1

augroup custom_filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.prisma set filetype=graphql
augroup END

let &showbreak = '>>> '

set backupdir=~/.config/nvim/.backup     " store backup files
set directory=~/.config/nvim/.backup     " store swap files
set undodir=~/.config/nvim/.undofiles    " store undo files

set autoread                             " read changes to unmodified buffers
set backspace=indent,eol,start           " make backspace work in insert mode
set cursorline                           " highlight column with curosr in it
set eadirection=hor
set expandtab                            " tab -> spaces
set hidden                               " keep buffers around when closed
set hlsearch                             " highlight search matches
set ignorecase                           " ignore case in search
set incsearch                            " show search matches while typing
set linebreak                            " wrap at words
set nobackup
set noequalalways                        " don't resize windows when I open a new one
set number                               " show line numbers
set pumheight=8
set scrolloff=3
set shiftwidth=4
set showcmd                              " show commands in progress
set signcolumn=yes
set smartcase                            " don't ignore case when we include an upper-case letter
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set undofile
set wildmenu                             " use menu for tab completion
set wildmode=longest,full                " don't use menu for first completion
set writebackup

let g:netrw_banner = 0
let g:netrw_browse_split = 4

let g:startify_customm_header = []
let g:startify_bookmarks = [
      \ {',': '~/.dotfiles/init.vim'},
      \ {'d': '~/.dotfiles/'},
      \ '~/.config/kitty/kitty.conf',
      \ '~/.dotfiles/zshrc/init.zsh',
      \ '~/.dotfiles/freshrc']
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }]
let g:startify_session_dir = '~/.config/nvim/sessions'

let g:fzf_layout = { 'up': '~25%' }
let g:fzf_buffers_jump = 1

let g:fireplace_cljs_repl_type = 'figwheel-sidecar'

if g:fireplace_cljs_repl_type ==? "nashorn"
  let g:fireplace_cljs_repl = '(cider.piggieback/cljs-repl (cljs.repl.nashorn/repl-env))'
elseif g:fireplace_cljs_repl_type ==? "figwheel-sidecar"
  let g:fireplace_cljs_repl = '(cider.piggieback/cljs-repl (figwheel-sidecar.repl-api/repl-env))'
endif

" windows
nnoremap <c-x> :wincmd c<cr>
tnoremap <c-x> <c-\><c-n>:wincmd c<cr>

" <c-hjkl> for window movement
nnoremap <c-h> <c-w>h
inoremap <c-h> <esc><c-w>h
tnoremap <c-h> <c-\><c-n><c-w>h

nnoremap <c-j> <c-w>j
inoremap <c-j> <esc><c-w>j
tnoremap <c-j> <c-\><c-n><c-w>j

nnoremap <c-k> <c-w>k
inoremap <c-k> <esc><c-w>k
tnoremap <c-k> <c-\><c-n><c-w>k

nnoremap <c-l> <c-w>l
inoremap <c-l> <esc><c-w>l
tnoremap <c-l> <c-\><c-n><c-w>l

augroup netrw_map
  autocmd!
  autocmd filetype netrw call NetrwMap()
augroup END

function! NetrwMap()
  nnoremap <buffer> <c-l> <c-w>l
endfunction

" FZF mappings
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>o :Buffers<cr>
nnoremap <silent> <leader>t :Rg<cr>
nnoremap <silent> <leader><s-t> :Commands<cr>
nnoremap <silent> <leader>/ :Lines<cr>
nnoremap <silent> <leader>? :BLines<cr>
nnoremap <silent> <leader>e :call OpenOrGoToExplorerWindow()<cr>

" Key mappings
inoremap jk <esc>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
nnoremap <tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>Q :wq<cr>
" yank to clipboard until next space
nnoremap <leader>y :normal "+yt <cr>
" edit (neo)vim settings
nnoremap <leader>, :e ~/.dotfiles/init.vim<cr>
nnoremap <plug>(slash-after) zz

if !exists("g:autocmds_loaded")
  augroup harry
    autocmd!
    let g:autocmds_loaded = 1

    autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc
    autocmd BufWritePost */.dotfiles/init.vim execute 'silent !fresh >/dev/null'
    autocmd TermOpen * set filetype=term
    autocmd WinEnter term://* call MaybeStartInsertInTerminal()
    autocmd FileType netrw call SetExplorerWindow()
  augroup END
endif

function! SetExplorerWindow()
  let t:explorer_window = win_getid()
endfunction

function! OpenOrGoToExplorerWindow()
  if exists('t:explorer_window')
    call win_gotoid(t:explorer_window)
  else
    execute 'Lexplore'
  endif
endfunction

function! MaybeStartInsertInTerminal()
  if !exists('g:dont_start_insert_in_terminal')
    startinsert
  endif
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

