imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory='~/Dropbox/dotfiles/vim_snippets'
let g:neocomplete#snippets_dir='~/Dropbox/dotfiles/vim_snippets'
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=snippet

" Works like g:neocomplete#snippets_disable_runtime_snippets
" which disables all runtime snippets
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

"		let g:neosnippet#disable_runtime_snippets = {
"		\   'c' : 1, 'cpp' : 1,
"		\ }


