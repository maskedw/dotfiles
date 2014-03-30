"============================================================
" @unite
" 多機能過ぎてわけわからんが、とりあえずデフォルトで簡易ファイラー的に
" 使用できる。
"============================================================
nnoremap         [unite]  <nop>
nmap    <Space>u [unite]
noremap [unite]B :<C-u>Unite buffer<CR>
noremap [unite]f :<C-u>Unite file<CR>
noremap [unite]m :<C-u>Unite file_mru<CR>
noremap [unite]M :<C-u>Unite directory_mru<CR>
noremap [unite]r :<C-u>Unite file_rec<CR>
noremap [unite]b :<C-u>Unite bookmark<CR>
noremap [unite]h :<C-u>Unite help<CR>
noremap [unite]y :<C-u>Unite -buffer-name=register register<CR>

let g:unite_enable_start_insert=0
let g:unite_enable_split_vertically=1
let g:unit_file_mru_limit=200
let g:unite_kind_file_use_trashbox = 1

call unite#custom_default_action('find' , 'vimfiler')
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
call unite#custom_default_action('vimshell/history' , 'insert')
call unite#custom_default_action('vimshell/external_history' , 'insert')

augroup Unite
    autocmd!
    " エンターの代わりに以下のキーでウィンドウを水平分割して開く
    autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    autocmd FileType unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    " エンターの代わりに以下のキーでウィンドウを垂直分割して開く
    autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
    autocmd FileType unite inoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
augroup END
