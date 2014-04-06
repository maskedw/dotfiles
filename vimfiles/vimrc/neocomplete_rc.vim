" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

noremap <Space>nt :<C-u>NeoCompleteToggle<CR>
"前回行われた補完をキャンセルする
inoremap <expr><C-g>     neocomplete#undo_completion()
"補完候補のなかから、共通する部分を補完する
inoremap <expr><C-l>     neocomplete#complete_common_string()
"ポップアップを確実に削除する
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"現在選択している候補を確定する
inoremap <expr><C-y>  neocomplete#close_popup()
"現在選択している候補をキャンセルし、ポップアップを閉じる
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2


let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_refresh_always = 1

" neocompleteを自動的にロックするバッファ名のパターンを指定する。
" ku.vimやfuzzyfinder等のneocompleteと相性の悪いプログインを入れてい
" る時は指定しておくとよい。
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" キーワードパターンを設定する。日本語は収集しないうように設定してある
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:neocomplete#sources#include#patterns = {
    \ 'cpp' : '^\s*#\s*include',
    \ 'c' : '^\s*#\s*include',
    \ }

let s:c_include_path = VimPath2CincludePath(&path)
let s:neocominclude = s:c_include_path
let g:default_neocominclude = s:neocominclude
let g:neocomplete#sources#include#paths = {
        \ 'cpp' :   s:neocominclude,
        \ 'c'   :   s:neocominclude,
        \ }
let g:neocomplete#filename_include#exts = {}
let g:neocomplete#filename_include#exts.cpp = ['', 'h', 'hpp', 'hxx']
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


call neocomplete#custom#source('file', 'rank', 10)
" 使用する補完の種類を減らす
" 現在のSourceの取得は `:echo keys(neocomplete#variables#get_sources())`
" デフォルト: ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
let g:neocomplete#sources = {
  \ '_' : ['file', 'neosnippet', 'syntax', 'member', 'omni', 'include', 'vim', 'buffer', 'file/include']
  \ }
