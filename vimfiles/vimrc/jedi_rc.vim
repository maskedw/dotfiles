"============================================================
" @jedi
" python入力補完
"============================================================
let g:jedi#popup_select_first = 0
let g:jedi#force_py_version = 3
let g:jedi#auto_vim_configuration = 0
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 0
augroup Python_jedi
    autocmd!
    autocmd FileType python let b:did_ftplugin = 1
augroup END
