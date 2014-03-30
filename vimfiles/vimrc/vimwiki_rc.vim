"============================================================
" @vimwiki
"============================================================
nnoremap           [wiki]  <nop>
nmap     <Space>vv [wiki]
nnoremap [wiki]t :<C-u>VimwikiTable<Space>
nnoremap [wiki]b :<C-u>Vimwiki2HTMLBrowse<CR>
nnoremap [wiki]a :<C-u>VimwikiALL2HTML<CR>
let tlist_vimwiki_settings = 'wiki;h:Headers'
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path':'~/Dropbox/vimwiki/publicmemo/',
                     \ 'path_html':'~/Dropbox/vimwiki/publichtml/',
                     \ 'nested_syntaxes':
                     \ {'c++':'cpp', 'vim':'vim', 'sh':'sh', 'make':'make', 'git':'git',
                     \  'py':'python', 'c#':'cs'}},
                     \ {'path':'~/Dropbox/workvimwiki/lantronix_linuxsdk/',
                     \ 'path_html':'~/Dropbox/workvimwiki/lantronix_linuxsdkhtml/'}]
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

hi VimwikiItalicBold guifg=Violet gui=bold
hi VimwikiBoldItalic guifg=Violet gui=bold
hi VimwikiBold guifg=Violet gui=bold

