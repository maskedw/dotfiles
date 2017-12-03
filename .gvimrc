syntax enable

set background=dark
colorscheme hybrid
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

if has('win32') || has('win64')
    "set guifont=MeiryoKe_Console:h10.5:cSHIFTJIS
    "set guifontwide=MeiryoKe_Console:h10.5:cSHIFTJIS
    set guifont=Consolas:h11.8:cSHIFTJIS
    set guifontwide=Consolas:h11.8:cSHIFTJIS
    " set guifont=Source_Code_Pro:h11.5:cANSI:qDRAFT
    " set guifontwide=MeiryoKe_Console:h11.5:cSHIFTJIS

"起動時に最大化
    au GUIEnter * simalt ~x
    set colorcolumn=0
else
    "set guifont=RictyDiscord\ 12
    "set guifontwide=RictyDiscord\ 12
    "set guifont=MonoSpace\ 12
    "set guifontwide=MonoSpace\ 12
    set guifont=UbuntuMono\ 13
    set guifontwide=UbuntuMono\ 13
    set colorcolumn=0
endif

set cmdheight=2

set wrap           " the longer line is wrapped
set linebreak      " wrap at 'breakat'
"set breakat=\      " break point for linebreak (default " ^I!@*-+;:,./?")
set showbreak=+\   " set showbreak
"コマンドラインの高さ
if (v:version == 704 && has("patch338")) || v:version >= 705
  set breakindent    " indent even for wrapped lines
endif

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

" ピンク
hi htmlH1 guifg=#F2D8DF gui=bold
" オレンジ
hi htmlH2 guifg=#EF7585 gui=bold
" 薄いピンク
hi htmlH3 guifg=#EFC1C4 gui=bold
" 黄色
hi htmlH4 guifg=#FFFF00 gui=bold
" 薄い青
hi htmlH5 guifg=#00FF00  gui=bold
" 緑
hi htmlH6 guifg=#00FF00 gui=bold
