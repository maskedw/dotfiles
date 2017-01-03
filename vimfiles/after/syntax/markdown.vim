" アンダースコアで変な色になるのを抑止する。
" http://stackoverflow.com/questions/19137601/turn-off-highlighting-a-certain-pattern-in-vim
hi! link markdownError Normal

" アスタリスクでイタリックになるのを抑止する。
" http://qiita.com/rbtnn/items/58a68e4981c52b1872ad
hi! def link markdownItalic Normal

" vim-markdownで定義されるmkdLinkeBreakをもうちょい目立たせる
hi! link mkdLineBreak NONE
hi! mkdLineBreak NONE
hi! mkdLineBreak cterm=bold ctermfg=red guifg=#FF0000
