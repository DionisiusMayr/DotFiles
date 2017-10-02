" ======================
" Author: Dionisius Mayr
" Version: 0.1
" ======================

" Vundle
" ======

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/seoul256.vim'
Plugin 'vimwiki/vimwiki'

" Learning how to use
" -------------------
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'brookhong/cscope.vim'
Plugin 'chazy/cscope_maps'  " Just manually set the maps

set csverb
" Check later
" -----------
" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tpope/vim-fugitive'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'edkolev/tmuxline.vim'

" Single time download
" --------------------
" Plugin 'powerline/fonts'

call vundle#end()            " required
filetype plugin indent on    " required

" General Settings
" ================

syntax enable			" Enable syntax highlighting (TODO on or enable?)

set mouse=a				" Enable mouse

set t_Co=256 			" Enable 256 colors

set showcmd 			" Show commands on the bottom right
set showmode 			" Show current mode on bottom left
set laststatus=2 		" Always display status line
set history=1000		" Store 1000 lines of command line history

set autoread			" Auto read when a file is changed form the outside

set noshowmatch			" Don't show the matching bracket after typing it

set wildmenu			" Command-line suggestions with tab
set wildignore=*~,*.o,*.obj,*.pyc		" Ignore compiled files
set wildignore+=*.gif,*.jpg,*.png		" Ignore images

set number				" Display the line number
" set relativenumber

set nowrap 				" Disable line wrapping
set backspace=indent,eol,start " Enable correct backspace in insert mode

set hlsearch			" Highlight matches found
set incsearch			" Highlight matches when typing

" Use smartcase on searches
set ignorecase
set smartcase

set complete-=i			" Do not search included files for completion

set formatoptions+=j	" Remove the comment character after a join

set startofline			" Go to the first character after moving

set nrformats-=octal	" Do not treat numbers starting with 0 to be octal

" colorscheme solarized 
" let g:solarized_termcolors=256
" colorscheme Monokai
colorscheme seoul256
let g:seoul256_background=236

set background=dark

set autoindent			" Auto-indent even when no filetype-specific indenting is enabled

set shiftwidth=4		" Tab width of 4 spaces
set tabstop=4			" Show existing tab 4 spaces long
"set noexpandtab			" Use hard tabs
set expandtab			" Use soft tabs

set scrolloff=5			" Stay 5 lines away from the top/bottom of screen
set sidescrolloff=7		" Stay 7 characters away from the left/right side of the screen
set sidescroll=1		" Move 1 character at a time when side scrolling
set display+=lastline	" Print as much as possible of the last line

set foldmethod=indent	" Folding method based on indentation level
set nofoldenable		" Do not fold at start

set title               " Do not change the window title

" Hide the buffer when it is abandoned
" Buffers can exist in the background without being in a window
set hidden

" set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces
" From https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set dictionary=/usr/share/dict/american-english " Enable completion engine using dictionary (CTRL-X CTRL-K)

" Disable beep and flash
set noerrorbells
set visualbell
set t_vb=

" Do not time out while typing commands
" set notimeout
" set nottimeout
" TODO check this
set ttimeout
set ttimeoutlen=100

" Keep undo history across sessions, by storing in file 
" From https://github.com/skwp/dotfiles/blob/master/vimrc
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" Mappings
" ========

" ENTER clear the current highlight
nnoremap <cr> :noh<CR><CR>:<backspace>

" Enter paste mode
noremap <F8> :set paste<CR>i
au InsertLeave * set nopaste " Leave paste mode on exit

" Opens NERDTree
noremap <F9> :NERDTreeToggle<CR>

" Spelling
" LEADER ss toggles the spell checker (from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim)
noremap <leader>ss :setlocal spell!<cr>		
" Go to the next wrong word
noremap <leader>sn ]s
" Go to the previous wrong word
noremap <leader>sp [s
" Add new word to the dictionary
noremap <leader>sa zg
" Correct the word
noremap <leader>s? z=

" Copying/pasting from/to clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
" noremap <Leader>Y "*y
" noremap <Leader>P "*p

" Editing .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disabling arrow keys
imap <Up>    <nop>
imap <Down>  <nop>
imap <Left>  <nop>
imap <Right> <nop>
map  <Up>    <nop>
map  <Down>  <nop>
map  <Left>  <nop>
map  <Right> <nop>


" Plugins
" =======

" Airline
" -------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'base16_ashes'

" Workspace/Experiments
" =====================
