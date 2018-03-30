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
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'

" Colorschemes
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sjl/badwolf'
Plugin 'nanotech/jellybeans.vim'

" Learning how to use
" -------------------
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'brookhong/cscope.vim'
Plugin 'chazy/cscope_maps'  " Just manually set the maps
Plugin 'Shougo/vimproc'
Plugin 'vim-scripts/Align'
Plugin 'simnalamburt/vim-mundo'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'jparise/hive.vim'
Plugin 'plasticboy/vim-markdown'

" Haskell
" -------
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
"Plugin 'Twinside/vim-hoogle'
"Plugin 'mpickering/hlint-refactor-vim'

" Python
" ------
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'

set csverb
" Check later
" -----------
" Plugin 'vim-syntastic/syntastic'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'edkolev/tmuxline.vim'

" Single download only
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

set colorcolumn=80

set autoread			" Auto read when a file is changed form the outside

set noshowmatch			" Don't show the matching bracket after typing it

set wildmenu			" Command-line suggestions with tab
set wildmode=list:longest,full          " TODO check it Longest unambiguous prefix
set wildignore=*~,*.o,*.obj,*.pyc		" Ignore compiled files
set wildignore+=*.gif,*.jpg,*.png		" Ignore images

set cursorline          " Highlight the current line
set number				" Display the line number
" set relativenumber

set nowrap 				" Disable line wrapping
set backspace=indent,eol,start " Enable correct backspace in insert mode
" set whichwrap+=<,>,h,l

set hlsearch			" Highlight matches found
set incsearch			" Highlight matches when typing

" Use smartcase on searches
" set ignorecase
" set smartcase

" set complete-=i			" Do not search included files for completion
set completeopt+=longest " TODO check it

set formatoptions+=j	" Remove the comment character after a join

set startofline			" Go to the first character after moving

set nrformats-=octal	" Do not treat numbers starting with 0 to be octal

try
    " colorscheme solarized 
    " let g:solarized_termcolors=256
    " colorscheme Monokai
    " colorscheme seoul256
    " let g:seoul256_background=236
    colorscheme gruvbox
catch
endtry

set background=dark

set autoindent			" Auto-indent even when no filetype-specific indenting is enabled
set smartindent         " Indent after special character like { or before }

set shiftwidth=4		" Tab width of 4 spaces
set softtabstop=4       " TODO check it
set tabstop=4			" Show existing tab 4 spaces long
"set noexpandtab			" Use hard tabs
set expandtab			" Use soft tabs

set scrolloff=2			" Stay 2 lines away from the top/bottom of screen
set sidescrolloff=4		" Stay 4 characters away from the left/right side of the screen
set sidescroll=1		" Move 1 character at a time when side scrolling
set display+=lastline	" Print as much as possible of the last line

" set splitbelow
set splitright

" set foldmethod=indent	" Folding method based on indentation level
set foldmethod=manual
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
set timeout
set ttimeoutlen=100
set timeoutlen=2000

set encoding=utf8       " TODO check it

augroup filetypedetect
    au BufRead,BufNewFile .bash_secret setfiletype sh
augroup END

" Keep undo history across sessions, by storing in file 
" From https://github.com/skwp/dotfiles/blob/master/vimrc
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" Don't redraw while executing macros (good performance config) (from HVN)
" set lazyredraw " (Note: doesn't work with all Airline themes at startup.)

" Mappings
" ========

" Intended movement in wrapped lines
nnoremap j gj
nnoremap k gk

" Disable Ex mode
nnoremap Q <nop>

" Force redraw (from HVN)
map <silent> <leader>r :redraw!<CR>

" ENTER clear the current highlight
nnoremap <cr> :noh<CR><CR>:<backspace>

" Enter paste mode
noremap <F8> :set paste<CR>i
autocmd InsertLeave * set nopaste " Leave paste mode on exit


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
" Note: + affects the register, while * doesn't.
noremap <Leader>y "+y
noremap <Leader>p "+p

" Editing .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Window management
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Open window splits in various places (from HVN)
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Buffer management (from HVN)
" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o
" delete buffer without closing pane
noremap <leader>bd :bd<cr>
" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" (From https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work#7078429)
cmap w!! w !sudo tee > /dev/null %


" Plugins
" =======

" NERDTree
" --------
" From HVN
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
    if IsNERDTreeOpen()
        exec ':NERDTreeToggle'
    else
        exec ':NERDTreeFind'
    endif
endfunction

noremap <F9> :call ToggleFindNerd()<CR>

" Airline
" -------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'base16_ashes'

" Vim-Mundo
" ---------
" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

" Open file prompt with current path (from HVN)
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" CtrlP (TODO check it) (from HVN)
" -----
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

" Align (from HVN)
" -----
" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

" Tagbar (from HVN)
" ------
map <leader>tt :TagbarToggle<CR>
map <F10> :TagbarToggle<CR>

set tags=tags;/
set cst
set csverb

" Git plugins (from HVN)
" -----------
let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list)
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

" Python
" ======
let python_highlight_all = 1

" From https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set wrap


" vim-flake8
" ==========

autocmd BufNewFile,BufRead *.py
    \ noremap <F5> :call Flake8()<CR>
" autocmd BufWritePost *.py call Flake8()
" let g:flake8_show_in_gutter = 1

" jedi-vim
" ========
let g:jedi#completions_command = "<C-X>"


" Workspace/Experiments
" =====================

" neco-ghc
" --------
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

" haskellmode-vim
" ---------------
" let g:haddock_browser="/usr/bin/firefox"
" autocmd BufEnter *.hs compiler ghc

" YouCompleteMe
" -------------
" let g:ycm_filetype_blacklist = {'python': 1}
" let g:ycm_specific_completion_to_disable = {'python': 1}
" let g:ycm_python_binary_path = '/usr/bin/python'
" let g:ycm_autoclose_preview_window_after_completion = 1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"TODO: put this on the right place
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"highlight YcmErrorLine guibg=#3f0000
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
" Tmux Navigator
" --------------
"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> <C-h>  :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-j>  :TmuxNavigateDown<cr>
"nnoremap <silent> <C-k>  :TmuxNavigateUp<cr>
"nnoremap <silent> <C-l>  :TmuxNavigateRight<cr>
"nnoremap <silent> <C-w><C-\>   :TmuxNavigatePrevious<cr>

" Syntastic
" ---------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_python_checkers=['flake8']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

