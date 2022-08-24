" Installation instructions:
"
"   1. Install vim-plug: curl -fLo ~/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   2. :PlugInstall
"
scriptencoding utf-8
set encoding=utf-8


"----------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------
call plug#begin('~/nvim/plugged')
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()


"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------

set backspace=2           " Makes backspace not behave all stupid
set hidden                " Allow buffers to be backgrounded without being saved
set number
set relativenumber
set ruler                 " Show the line number and column in the status bar
set laststatus=2          " Always show the status bar
set t_Co=256              " Use 256 colors
set scrolloff=999         " Keep the cursor centered in the screen
set mouse=a               " Set your cursor to be wherever your mouse clicks
set showmatch             " Highlight matching braces
set showmode              " Show the current mode on the open buffer
set showcmd               " Mirror the command in the status bar
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set visualbell            " Use a visual bell to notify us

" Customize session options. Namely, I don't want to save hidden and
" unloaded buffers or empty windows.
set sessionoptions="curdir,folds,help,options,tabpages,winsize"

if !has("win32")
    set showbreak=↪       " The character to put to show a line has been wrapped
end

syntax on                 " Enable filetype detection by syntax

" Home path
if has("nvim")
    " Neovim
    let g:vim_home_path = "~/nvim"
else
    " We're on some POSIX system, hopefully
    let g:vim_home_path = "~/.vim"
endif

" Backup settings
execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir=" . g:vim_home_path . "/undo"
set backup
set undofile
set writebackup

" Search settings
set hlsearch      " Highlight results
set ignorecase    " Ignore casing of searches
set incsearch     " Start showing results as you type
set smartcase     " Be smart about case sensitivity when searching

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=4     " Tabs width in spaces
set softtabstop=4 " Soft tab width in spaces
set shiftwidth=4  " Amount of spaces when shifting

" Tab completion settings
set wildignore+=*.swp         " Ignore vim backups

" GUI settings
if has("gui_running") || has("nvim")
    colorscheme onehalfdark
    set background=dark
    highlight clear SignColumn
endif


"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------

" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" Make j/k visual down and up instead of whole lines. This makes word
" wrapping a lot more pleasent.
map j gj
map k gk


"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e


"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------

