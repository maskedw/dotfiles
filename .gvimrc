syntax enable
colorscheme hybrid
"colorscheme desert
"colorscheme DarkDefault
"colorscheme wombat
"set background=dark
"hi Visual gui=none guifg=khaki guibg=olivedrab

"set background=light
"colorscheme solarized
if has('win32') || has('win64')
    "set guifont=MeiryoKe_Console:h10.5:cSHIFTJIS
    "set guifontwide=MeiryoKe_Console:h10.5:cSHIFTJIS
    set guifont=Consolas:h11:cSHIFTJIS
    set guifontwide=Consolas:h11:cSHIFTJIS

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

"コマンドラインの高さ
set cmdheight=2

set textwidth=70
autocmd BufRead *vimrc setlocal textwidth=0
"highlight colorcolumn guifg=NONE guibg=gray24

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

let g:Powerline_symbols = 'compatible'


" ピンク
hi VimwikiHeader1 guifg=Violet gui=bold
" オレンジ
hi VimwikiHeader2 guifg=#EF7585 gui=bold
" 薄い青
hi VimwikiHeader3 guifg=#00FFFF gui=bold
" 黄色
hi VimwikiHeader4 guifg=#FFFF00 gui=bold
" 薄いピンク
hi VimwikiHeader5 guifg=#EFC1C4 gui=bold
" 緑
hi VimwikiHeader6 guifg=#00FF00 gui=bold

hi VimwikiItalicBold guifg=Orange gui=bold
hi VimwikiBoldItalic guifg=Orange gui=bold
hi VimwikiBold guifg=LightGreen gui=bold
