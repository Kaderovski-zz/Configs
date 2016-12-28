autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set runtimepath+=~/.vim_runtime
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew term://zsh<CR>i
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
nnoremap <C-tab>   <Esc>:tabNext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set clipboard+=unnamedplus
tnoremap <A-b> <C-\><C-n>
inoremap <C-x> <C-w>

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry


"au VimEnter *  NERDTree
"let g:NERDTreeWinPos = "left"
"autocmd BufNew * wincmd l


" Start NERDTree
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

cmap q qa

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on

set number
set autoread
