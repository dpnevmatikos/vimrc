" VIMRC for Windows

set nocompatible
" *** load vundle ***
filetype off                   " required!
set rtp+=~/vimfiles/bundle/vundle/
let path='~/vimfiles/bundle'
call vundle#rc(path)
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'The-NERD-Commenter'
Bundle 'mrtazz/molokai.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'flazz/vim-colorschemes'

let g:ctrlp_open_new_file = 't'
" open files in new tab
let g:ctrlp_prompt_mappings = {
 \ 'AcceptSelection("e")': [],
 \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
 \ }

" autoreload .vimrc
augroup myvimrc
   au!
   au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let history=1000
set hidden
set wildmenu
" case sensitive search
set ignorecase 
set smartcase
set title
set scrolloff=4
set wildignore+=temp,node_modules
set backspace=indent,eol,start
syntax on
filetype on
filetype plugin on
filetype indent on
set expandtab
set tabstop=4
" uses ctrl+> or ctrl+< to indent
set shiftwidth=4
set autoindent
set nofoldenable
set hlsearch
set incsearch
let t_Co=256

if has("gui_running")
   "set guifont=Source\ Sans\ Pro\ 22
   "colorscheme railcasts 
   colorscheme molokai
else
   "colorscheme molokai
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


let mapleader=","
" maps tabn->ctrl+L tabp->ctrl+H
noremap <C-L> <ESC>:tabn<CR>
noremap <C-H> <ESC>:tabp<CR>
" -----------------------------------
" Maps ctrl+space to ctrl+n (autocomplete)
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
