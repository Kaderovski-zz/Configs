set runtimepath+=~/.vim_runtime
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew term://zsh<CR>i
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
nnoremap <C-tab>   <Esc>:tabNext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set clipboard+=unnamedplus
tnoremap <A-a> <C-\><C-n>

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

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


set ssop+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages
let g:screen_size_restore_pos = 1
let g:screen_size_by_vim_instance = 1
