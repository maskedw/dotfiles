"============================================================
" @vimfiler
"============================================================
nnoremap            [filer] <nop>
nmap    <Space>vf   [filer]
nnoremap [filer]f   :<C-u>VimFiler<CR>
nnoremap [filer]b   :<C-u>VimFilerBufferDir<CR>
nnoremap [filer]d   :<C-u>VimFilerDouble<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_preview_action = "preview"
