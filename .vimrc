" This all duplicates stuff in the stock Fedora/RHEL vimrc that I got used to
" without even realizing it.
set nocompatible        " Use Vim defaults (much better!)
set backspace=indent,eol,start         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
syntax on
set hlsearch

" I'm old-school like that.
set exrc

" This breaks horribly on Windows for me.
if !has("win32")
    set secure
endif

" I *always* use a light-on-dark terminal.
set background=dark

" Status bar stuff.
set showcmd

" Make tab completion work more like it does in bash.
set wildmode=longest,list

" FIXME - Something I tried.  It didn't work.  The right answer is here:
" http://stackoverflow.com/questions/469564/vim-would-like-it-to-turn-settings-on-only-for-certain-file-types
" if &filetype != 'make'
    set shiftwidth=4
    set shiftround
    set expandtab
    set smarttab
" endif

" Better searching.
set incsearch
set ignorecase
set smartcase

" http://cslife.wordpress.com/2008/12/01/save-vim-syntax-highlighting-to-html/
" Export to XHTML Customizations
let html_number_lines = 0
let use_xhtml = 1
let html_use_css = 1

" I typo this way too often when I'm signing off on email.
iabbrev STeve Steve

" Map F11 and F12 to toggle autowrap and spell check off and on.
" (This is mostly for email, but I find I use it a lot elsewhere.)
nmap <F12> :set formatoptions+=a spell spelllang=en_us<CR>
nmap <F11> :set formatoptions-=a nospell<CR>
imap <F12> <C-O>:set formatoptions+=a spell spelllang=en_us<CR>
imap <F11> <C-O>:set formatoptions-=a nospell<CR>

" Map ^L to do what it does, but also clear search highlighting.
nnoremap <C-L> :nohlsearch<CR><C-L>

" FIXME - Testing a map that let me quickly make a backup of the current file.
" The behavior was a litle odd.  I need to revisit this.
"cnoremap w~ !cp -aiv % %~
"cnoremap dist !cp -aiv % %.dist
"cnoremap orig !cp -aiv % %.orig
