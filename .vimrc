" This all duplicates stuff in the stock Fedora/RHEL vimrc that I got used to
" without even realizing it.
set nocompatible        " Use Vim defaults (much better!)
set backspace=indent,eol,start         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=5000        " keep 5000 lines of command line history
set ruler               " show the cursor position all the time
syntax on
set hlsearch

" This breaks horribly on Windows for me.
if !has("win32")
    set secure
endif

" I *always* use a light-on-dark terminal.
set background=dark

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

" Shortcut for :bnext and :bprevious.
nmap <A-Left> :bprevious<CR>
nmap <A-Right> :bnext<CR>

" Hide other buffers instead of abandoning them.
set hidden

" Makes visual block mode awesome.  (Thanks, Bill!)
set virtualedit=block

" Indent in visual and select mode automatically re-selects.
" (Also suggested by @wnodom.)
vnoremap > >gv
vnoremap < <gv

" Scroll when we get 1 line away from the edge of the window.
set scrolloff=1

" Keeps the cursor in the center of the window.
" @wnodom can tell you where this comes from.
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" In email, replace my .signature with the output of the 'sig' script.
nnoremap <F10> /^-- <CR>:noh<CR>jdG:r !sig<CR>``

" Makes . do the right thing in visual mode.
" From @nelstrom, via @wnodom and @CrypticSwarm.
vnoremap . :normal .<CR>

" Borrowed from the stock sample vimrc.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Enable the mouse.
" Shift+mouse in xterm reverts to normal xterm behavior.
set mouse+=a

" Status bar stuff.
set showcmd
set laststatus=2

" Default left statusline info
set statusline=%<%f\ %h%m%r

" Fugitive statusline
set statusline+=%{fugitive#statusline()}

" Default right statusline info
set statusline+=%=%-14.(%l,%c%V%)\ %P

" \f opens the filename under the current cursor in a
" vertical split window on the right of the current window
nnoremap <Leader>f :vertical wincmd f \| wincmd L<CR>
nnoremap <Leader>F :vertical wincmd F \| wincmd L<CR>

" Quiet SnipMate deprecation message
let g:snipMate = { 'snippet_version' : 1 }

" Ctrl+/ toggles comments
nnoremap <C-/> :Commentary<CR>
vnoremap <C-/> :Commentary<CR>
