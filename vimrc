set nocompatible   " Disable vi-compatibility

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'sjl/badwolf.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline.git'
Plugin 'walm/jshint.vim.git'
Plugin 'mhinz/vim-startify.git'
Plugin 'pearofducks/ansible-vim'
call vundle#end()

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
syntax enable
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
"            \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ 
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ 
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=4
    autocmd BufEnter *.sh setlocal shiftwidth=4
    autocmd BufEnter *.sh setlocal softtabstop=4
augroup END

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

""This unsets the "last search pattern" register by hitting return
nnoremap\ :noh<CR>

set ruler                       " Add location status bar
set nonumber                      " Add line numbers
set t_Co=256                    " Set the number of colours to 256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"" Whitespace
set wrapscan                    " Wrap lines on whole words
set tabstop=4 shiftwidth=4      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set cursorline

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set showmatch                   " highlights all the matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set cursorline                  " highlight current line

set wmh=0                       " Stop showing a single line when window is minimized

set hidden                      " Don't prompt to write

set history=1000

runtime macros/matchit.vim      " Better switching

set wildmenu                    " pressing tab doesn't loop around but gives an idea of how many

set lazyredraw          " redraw only when we need to.

set title                       " For ssh-windows

set scrolloff=3                 " Buffer when scrolling

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

nmap <silent> <leader>n :silent :nohlsearch<CR> " Take away the highlights on searches

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

let python_highlight_all=1

set shortmess=atI               " shortens command line prompts

nmap <silent> <leader>s :set nolist!<CR>

let g:Powerline_symbols='fancy'

if has('gui_running')
  set background=light
else 
  set background=dark
endif
"" colorscheme wombat256mod 
"" colorscheme synic
colorscheme badwolf
"" let g:sierra_Twilight = 1
"" colorscheme solarized
"" let g:nofrils_strbackgrounds=1
"" colorscheme nofrils-dark

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"" Save files with sudo rights if you forgot
:command! W w !sudo tee % > /dev/null

"" Check the current php file for syntax errors
map <C-P> :!php -l %<CR>
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
map - <C-W>- 
map + <C-W>+
let mapleader = "\<Space>"

set mouse=
set nonumber                      " Add line numbers

