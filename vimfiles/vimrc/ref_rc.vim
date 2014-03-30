"============================================================
" @ref
" vim内でドキュメントの閲覧
"============================================================
nnoremap         [ref]  <nop>
nmap     <Space>re [ref]
"nnoremap [ref]m :<C-u>call ref#jump('normal', 'man')<CR>
"vnoremap [ref]m :<C-u>call ref#jump('visual', 'man')<CR>
nnoremap [ref]m yiw:Ref man <C-R>0 <C-Left><Left><Space>
vnoremap [ref]m yiw:Ref man <C-R>0 <C-Left><Left><Space>
nnoremap [ref]w :<C-u>call ref#jump('normal', 'webdict')<CR>
vnoremap [ref]w :<C-u>call ref#jump('visual', 'webdict')<CR>
let g:ref_source_webdict_sites = {
\   'wiktionary': {
\     'url': 'http://ja.wiktionary.org/wiki/%s',
\     'cache': 1,
\   }
\ }
let g:ref_source_webdict_sites = {
\   'weblio': {
\     'url': 'http://ejje.weblio.jp/content/%s',
\     'cache': 1,
\     'line':75,
\   }
\ }
let g:ref_source_webdict_sites.default = 'weblio'
