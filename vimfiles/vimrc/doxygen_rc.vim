"============================================================
" @doxygen-toolkit
" @doxygen-support
" Doxygenコメント入力支援
"============================================================
nnoremap           [doxygen]  <nop>
nmap     <Space>do [doxygen]
nnoremap [doxygen]x :<C-u>Dox<CR>
nnoremap [doxygen]f :<C-u>DoxyFILEHeader<CR>
nnoremap [doxygen]s :<C-u>DoxyCppBlockShort<CR>
nnoremap [doxygen]l :<C-u>DoxyBlockLong<CR>
nnoremap [doxygen]c :<C-u>DoxyClass<CR>
"let g:DoxygenToolkit_briefTag_post = "<++>"
let g:DoxygenToolkit_briefTag_className = "yes"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_namespaceName = "yes"
let g:DoxygenToolkit_briefTag_enumName = "yes"
let g:DoxygenToolkit_briefTag_structName= "yes"
" help doxygen.vim
let g:doxygen_cnhanced_color=1
let g:load_doxygen_syntax=1
let g:doxygen_cnhanced_color=1
let g:doxygen_my_rendering=1
let g:doxygen_javadoc_autobrief=1
let g:doxygen_end_punctuation='[.]'
