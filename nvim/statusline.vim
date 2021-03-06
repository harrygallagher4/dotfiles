set laststatus=2
set noshowmode

hi StatusNormal guifg=LightGrey
hi StatusInsert guibg=Yellow guifg=Black
hi StatusVisual guibg=DarkYellow guifg=Black
hi StatusReplace guibg=DarkMagenta guifg=Black

function! StatusLineJob()
    if exists('b:terminal_job_id')
        return ' ['.b:terminal_job_id.']'
    else
        return ''
    endif
endfunction

set statusline=
set statusline+=%#StatusNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#StatusNormal#%{(mode()=='t')?'\ \ TERM\ ':''}
set statusline+=%#StatusInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#StatusReplace#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#ModeMsg#      " color 
set statusline+=\ %t            " short file name
set statusline+=%#SpecialChar#%{StatusLineJob()}
set statusline+=%(\ %m%r%h%)    " flags
set statusline+=%(\ %w%)        " preview flag
set statusline+=%(\ %q%)        " list flag
set statusline+=%=              " right align
set statusline+=%#LineNr#       " color
set statusline+=%(\ %y%)        " file type
set statusline+=%#TermCursorNC# " color
set statusline+=\ %3p%%         " percentage
set statusline+=%#Type#         " color
set statusline+=\ %3l:%-2c\     " line:column

