"============================================================
" @pyclewn
" pythonとc/c++のデバッグ
"============================================================

cnoremap <silent><expr> <SID>lineno line(".")
nnoremap <silent><A-n>         :<C-u>Cnext<CR>
nnoremap <silent><A-s>         :<C-u>Cstep<CR>
nnoremap <silent><script><A-b> :<C-u>Cbreak <C-r><C-%>: <SID>lineno<CR>
nnoremap <silent><script><A-S-b> :<C-u>Cbacktrace<CR>
nnoremap <silent><script><A-S-c> :<C-u>Cclear <C-r><C-%>: <SID>lineno<CR>
nnoremap <silent><A-f>         :<C-u>Cfinish<CR>
nnoremap <silent><script><A-u> :<C-u>Cuntil <SID>lineno<CR>
nnoremap <silent><A-c>         :<C-u>Ccontinue<CR>
nnoremap <silent><A-S-u>       :<C-u>Cup<CR>
nnoremap <silent><A-S-d>       :<C-u>Cdown<CR>
nnoremap <silent><A-p>         :<C-u>Cprint <C-r><C-w><CR>
nnoremap <silent><A-S-p>       :<C-u>Cprint *<C-r><C-w><CR>
nnoremap <silent><A-w>         :<C-u>Cdbgvar <C-r><C-w><CR>
"Cfoldvar == 構造体の展開とか
nnoremap <silent><script><A-z> :<C-u>Cfoldvar <SID>lineno<CR>
nnoremap <silent><A-d>         :<C-u>Cdelvar <C-r><C-w><CR>
nnoremap <silent><A-a>         :<C-u>Cinfo args<CR>
nnoremap <silent><A-l>         :<C-u>Cinfo locals<CR>
nnoremap <silent><A-i>         :<C-u>Csource .gdbinit<CR>
nnoremap <silent><A-r>         :<C-u>C restart<CR>

