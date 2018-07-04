if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
"  set termguicolors
"endif

" Nah, I can manage this myself
" Set up onedark theme
"let g:onedark_termcolors=256
syntax on
set background=dark
colorscheme onedark

"onedark.vim override: Don't set a background color when running in a terminal;
"just use the terminal's background color
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7"}
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) "No `bg` setting
  augroup END
endif

" Fix background rendering in wrong color
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" File indenting defaults
set expandtab           " enter spaces when tab is pressed
"set textwidth=120       " break lines when line length increases
"au FileType python set textwidth=79
"au BufNewFile,BufRead *.module set filetype=php
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set nosmartindent
set ruler
set bs=2

set nowrap          " Don't wrap lines
set showcmd         " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set splitbelow
set splitright
set number          " Show numbers in gutter
set nocursorline    " Unset cursor line
set mouse=a         " Enable Mouse
set modeline
set ls=2
set cc=79           " Set column

" why isn't this the default?
noremap j gj
noremap k gk

" preserve folding
"set viewoptions-=options
"augroup vimrc
"    autocmd BufWritePost *
"    \   if expand('%') != '' && &buftype !~ 'nofile'
"    \|      mkview
"    \|  endif
"    autocmd BufRead *
"    \   if expand('%') != '' && &buftype !~ 'nofile'
"    \|      silent loadview
"    \|  endif
"augroup END

" Emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
"set scrolloff=8

" jump to buffers
noremap <f1> :bprev!<CR>
noremap <f2> :bnext!<CR>

" nice esc
imap <c-c> <c-[>
" more Visual Studio and eclipse like word completion
inoremap <c-@> <c-n>


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" XXX: This won't work with nvim for some reason
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Open man page in new window
:runtime! ftplugin/man.vim
nmap K \K

" Highlight extraneous whitespace in files
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

