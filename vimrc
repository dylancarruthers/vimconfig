call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
syntax enable
set encoding=utf-8
scriptencoding=latin1
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set ruler                       " Add location status bar
set number                      " Add line numbers
set t_Co=256                    " Set the number of colours to 256

"" Whitespace
set wrapscan                    " Wrap lines on whole words
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set mousefocus                  " Allow the mouse to control focus in MacVIM

set wmh=0                       " Stop showing a single line when window is minimized

let g:Powerline_symbols = 'fancy'

colorscheme synic

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"" Save files with sudo rights if you forgot
:command! W w !sudo tee % > /dev/null

"" Check the current php file for syntax errors
map <C-B> :!php -l %<CR>
nmap <F8> :TagbarToggle<CR> 
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
map - <C-W>- 
map + <C-W>+
