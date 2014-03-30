let g:CCTreeCscopeDb = "cscope.out"
"let g:CCTreeOrientation = "topleft"
let g:CCTreeOrientation = "above"
"if filereadable(".cctree.ref")
"    CCTreeLoadXRefDB .cctree.ref
"endif

" @echodoc
let g:echodoc_enable_at_startup = 1
" @fakeclip
let g:fakeclip_terminal_multiplexer_type="gnuscreen"
" @a.vim
nnoremap <Space>a :<C-u>A<CR>

"@vim-scratch
nnoremap <Space>sc :<C-u>Scratch<CR>

"@vinarise
let g:vinarise_enable_auto_detect = 1

"@vimshell
nnoremap <Space>vs :<C-u>VimShellBufferDir<CR>
let g:vimshell_interactive_update_time = 10

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let project1 = { 'path': '~/Dropbox/sphinx/docs/source',}
let g:riv_projects = [project1]
let g:riv_fuzzy_help = 1


