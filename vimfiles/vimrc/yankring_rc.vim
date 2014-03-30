"============================================================
" @yankring
" yank履歴を自動保存する
"============================================================
"yankring
nnoremap <Space>yrs :YRShow<CR>
"yankring.vimの設定
"yankring.vimの履歴ファイルの保存場所
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 10 " 記録する履歴を10件に制限する
let g:yankring_window_height = 13 " 履歴全件を見通せるように適当に調整
