if has("gui_gtk2")
    " This is from the bad old days before we had decent font handling.
    "set guifont="-*-luxi mono-*-r-*-*-*-*-*-*-*-*-microsoft-*"

    " Various fonts I've tried
    "set guifont=Lucida\ Console\ 9
    "set guifont=Consolas\ Bold\ 10
    "set guifont=Consolas\ 10
    "set guifont=Liberation\ Mono\ 10
    set guifont=Inconsolata\ 10
elseif has("win32")
    set guifont=Consolas:h10:b
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    " The defaults for Windows are kind of ridiculous.  If I wanted notepad, I'd run
    " notepad.  I thought this would work, but it doesn't seem to...
    "let g:skip_loading_mswin = 1
    " I ended up just commenting out the 'source $VIMRUNTIME/mswin.vim' in the
    " default config.
endif

" Turn on line numbers.
set number

" Big enough for 80 columns plus line numbers.  See
"   http://groups.google.com/group/vim-geeks/browse_thread/thread/d4791e42e08c2965
" for more background information.
set columns=90

" This seems to scale down appropriately on smaller displays.  Yay!
set lines=60

" This option hides the cursor when you start typing.
" I hate when the cursor gets in the way.
set mousehide

" I'm still not sure about this color scheme...
"colorscheme vo_dark
"highlight Normal guibg=black
"highlight Normal guifg=white
colorscheme koehler
