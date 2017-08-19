" vimrc
"
" Inspired by Vim as an IDE
" Github: https://github.com/jez/vim-as-an-ide/

set nocompatible

" initialize vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/VundleVim.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" Cosmetics
syntax on
colorscheme wombat256mod
set background=dark
set hlsearch
set colorcolumn=80
highlight ColorColumn ctermbg=8

set mouse=a   " using the mouse is nice
set nowrap    " turn off line wrapping
set ruler     " ???
set number    " show line numbers
set showcmd   " show command bar
set incsearch " search bullshit
set backspace=indent,eol,start
set tabstop=4     " use 4 spaces to represent tab
set softtabstop=4 " seriously, only use 4 spaces.
set shiftwidth=4  " number of spaces to use for auto indent
"set autoindent    " copy indent from current line when starting a new line
set nosmartindent
set laststatus=2


" --- plugin settings ---

" vim-airline
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
