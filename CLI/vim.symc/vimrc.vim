" ------------------------------------------------------------------------------------
" Set Paths and Needed Variables
" ------------------------------------------------------------------------------------
" Enable New VIM Syntax/Settings
set nocompatible

" Set Lunix Paths
if has('unix')
	set runtimepath^=~/.config/vim
	set packpath^=~/.config/vim
endif

" Create Variable For Vim Config Directory 
let $VIMFILES=split(&rtp,",")[0]

" ------------------------------------------------------------------------------------
" Source Additional Config Files 
" ------------------------------------------------------------------------------------
runtime plugins.vim

" ------------------------------------------------------------------------------------
" Default Vim Settings 
" ------------------------------------------------------------------------------------
set background=dark
silent! colorscheme PaperColor

" Enable syntax highlighting
syntax on

" Disable audio bell / beebing tone
set belloff=all

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Keymap for OS clipboard
vnoremap <C-c> "+y
map <C-v> "+P

" Keymap for Primary Selection Clipboard (Linux)
vnoremap <C-C> "*y :let @+=@*<CR>

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
"set esckeys

" Remap Escape Key Functionality
inoremap jk <Esc>

" Line Navigation
nnoremap <S-h> <Home>
nnoremap <S-l> <End>

" Tab Navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" Run Line In Bash
nmap <F8> :exec '!'.getline('.')

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
"set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles, viminfo, and undo history
set backupdir=$VIMFILES/backups
set directory=$VIMFILES/swaps
if exists("&undodir")
	set undodir=$VIMFILES/undo
endif
if !has('nvim')
    set viminfo+=n$VIMFILES/backups/viminfo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Highlight current line
"set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
	
