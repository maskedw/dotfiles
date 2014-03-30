" clang_complete 側の設定
" clang_complete の自動呼び出しは必ず切っておいて下さい
" clang_complete_auto = 0を設定しておかなければ補完がおかしくなります
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

if has('win32') || has('win64')
    let g:clang_library_path = "C:/Program\ Files\ (x86)/LLVM/bin"
else
    let g:clang_library_path = '/usr/lib'
endif

let g:clang_user_options      = '-std=c++11'
let g:clang_auto_user_options ='path, .clang_complete'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_trailing_placeholder = 1
let g:clang_use_snipmate = 0
let g:clang_hl_errors = 1
let g:clang_jumpto_declaration_key = ""
let g:clang_complete_copen=1
