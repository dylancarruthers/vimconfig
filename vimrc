set nocompatible   " Disable vi-compatibility

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'majutsushi/tagbar.git'
Bundle 'sjl/badwolf.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'lucapette/codepath.vim.git'
Bundle 'godlygeek/tabular.git'
Bundle 'walm/jshint.vim.git'
Bundle 'mhinz/vim-startify.git'

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

""This unsets the "last search pattern" register by hitting return
nnoremap\ :noh<CR>

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
set showmatch                   " highlights all the matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set mousefocus                  " Allow the mouse to control focus in MacVIM

set wmh=0                       " Stop showing a single line when window is minimized

set hidden                      " Don't prompt to write

set history=1000

runtime macros/matchit.vim      " Better switching

set wildmenu                    " pressing tab doesn't loop around but gives an idea of how many

set title                       " For ssh-windows

set scrolloff=3                 " Buffer when scrolling

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

set tags=./tags

nmap <silent> <leader>n :silent :nohlsearch<CR> " Take away the highlights on searches

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType python setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

set shortmess=atI               " shortens command line prompts

nmap <silent> <leader>s :set nolist!<CR>

let g:Powerline_symbols = 'fancy'

if has('gui_running')
  set background=light
else 
  set background=dark
endif
"" colorscheme wombat256mod 
colorscheme synic 

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"" Save files with sudo rights if you forgot
:command! W w !sudo tee % > /dev/null

"" Check the current php file for syntax errors
map <C-P> :!php -l %<CR>
nmap <F8> :TagbarToggle<CR> 
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
map - <C-W>- 
map + <C-W>+
