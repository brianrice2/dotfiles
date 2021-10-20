" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" Vim customizations -------------------------------------------------------
set number
set background=light
highlight NonText ctermfg=7
highlight LineNr ctermfg=7

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start
" Set your cursor to be wherever your mouse clicks
set mouse=a

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Vim plugins!!
call plug#begin()
  Plug 'sonph/onehalf', { 'rtp': 'vim' }  " one-half color theme
  Plug 'preservim/nerdtree'  " Nerd tree file explorer
call plug#end()

" Color schemes
syntax on
set t_Co=256
set cursorline
colorscheme onehalflight
let g:airline_theme='onehalflight'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

