let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +47 term://.//760:/usr/bin/zsh
badd +1028 term://.//22683:bash
badd +1 term://.//759:top
badd +2 test
badd +1 terminal
badd +0 term://.//28586:nvim
argglobal
silent! argdel *
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 11 + 30) / 61)
exe 'vert 1resize ' . ((&columns * 165 + 95) / 191)
exe '2resize ' . ((&lines * 45 + 30) / 61)
exe 'vert 2resize ' . ((&columns * 23 + 95) / 191)
exe '3resize ' . ((&lines * 45 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 141 + 95) / 191)
exe 'vert 4resize ' . ((&columns * 25 + 95) / 191)
argglobal
edit term://.//759:top
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 62 - ((10 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
62
normal! 02|
wincmd w
argglobal
edit term://.//28586:nvim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 45 - ((44 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
45
normal! 0
wincmd w
argglobal
edit term://.//760:/usr/bin/zsh
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 45 - ((44 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
45
normal! 0
wincmd w
argglobal
enew
file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 11 + 30) / 61)
exe 'vert 1resize ' . ((&columns * 165 + 95) / 191)
exe '2resize ' . ((&lines * 45 + 30) / 61)
exe 'vert 2resize ' . ((&columns * 23 + 95) / 191)
exe '3resize ' . ((&lines * 45 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 141 + 95) / 191)
exe 'vert 4resize ' . ((&columns * 25 + 95) / 191)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
