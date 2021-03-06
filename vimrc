if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

call plug#begin('~/.vim/plugins')

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Language support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-liquid'
Plug 'leafgarland/typescript-vim'
Plug 'asciidoc/vim-asciidoc'

" Interface
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
" Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-dim'
" Plug 'romainl/flattened'
" Plug 'harrygallagher4/lightline-terminal.vim'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"

syntax on
colorscheme default 
set termguicolors
set background=dark
highlight LineNr ctermfg=8
let g:jsx_ext_required=0    " use jsx syntax for .js files

set laststatus=2            " always show status line
"set noshowmode              " don't show "INSERT"/etc. Disable if not using a statusline plugin 

set autoread                " read changes to unmodified buffers
set directory=~/.vim/backup " store swap files in ~/.vim/backup
set backupdir=~/.vim/backup " store backup files in ~/.vim/backup
set hidden                  " keep buffers around when closed

set linebreak               " wrap at words
set number                  " show line numbers
set numberwidth=4           " reserve 4 columns for line numbers
set showcmd                 " show commands in progress

set backspace=2             " make backspace work in insert mode
set splitbelow              " horizontal-split windows below current
set splitright              " vertical-split windows right of current

set hlsearch                " highlight search matches
set ignorecase              " ignore case in search
set incsearch               " show search matches while typing
set smartcase               " don't ignore case when we include an upper-case letter

set expandtab               " tab -> spaces
set shiftwidth=2            " fix tab width for >> and <<
set softtabstop=2           " represent tabs as two spaces
set tabstop=2               " tab width
set smarttab                " tab uses tabstop, shiftwidth, and softtabstop

set wildmenu                " use menu for tab completion
set wildmode=longest,full   " don't use menu for first completion

" Netrw config
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize= -35

" CtrlP config
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_working_path_mode='ra'

" vim-instant-markdown config
let g:instant_markdown_autostart=0

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" windows
nnoremap <c-w>\| :vnew<cr>
nnoremap <c-w>\ :vnew<cr>
nnoremap <c-w>- :new<cr>
nnoremap <c-w>_ :new<cr>
nnoremap <c-x> :wincmd c<cr>
let g:tmux_navigator_disabled_when_zoomed = 1

" Key mappings
inoremap jk <esc>
nnoremap <tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap j gj
nnoremap k gk

autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc

set laststatus=2
set statusline=
set statusline+=%#function#\ %l
"set statusline+=\ %*
set statusline+=%#TabLineSel#\ ‹‹
set statusline+=\ %f
set statusline+=\ ››
set statusline+=\ %m
set statusline+=%#keyword#\ %F
set statusline+=%=
"set statusline+=\ %{LinterStatus()}
set statusline+=\ ‹‹
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

function! Icolorify(color)
  normal `>a[0m
  execute "normal `<i\<C-V>\<C-[>[" . a:color . "m"
endfunction

" Foreground
command! -range CBlack   call Icolorify(30)
command! -range CRed     call Icolorify(31)
command! -range CGreen   call Icolorify(32)
command! -range CYellow  call Icolorify(33)
command! -range CBlue    call Icolorify(34)
command! -range CMagenta call Icolorify(35)
command! -range CCyan    call Icolorify(36)
command! -range CWhite   call Icolorify(37)

" Background
command! -range CBlackBg   call Icolorify(40)
command! -range CRedBg     call Icolorify(41)
command! -range CGreenBg   call Icolorify(42)
command! -range CYellowBg  call Icolorify(43)
command! -range CBlueBg    call Icolorify(44)
command! -range CMagentaBg call Icolorify(45)
command! -range CCyanBg    call Icolorify(46)
command! -range CWhiteBg   call Icolorify(47)
