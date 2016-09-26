syntax on
set background=dark
set number
colorscheme apprentice


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-b> <C-W><C-J>
nnoremap <C-h> <C-W><C-K>
nnoremap <C-r> <C-W><C-L>
nnoremap <C-l> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

Plugin 'vim-scripts/indentpython.vim'

set encoding=utf-8
