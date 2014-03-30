"============================================================
" @git @fugitive
" git支援。
"============================================================
nnoremap           [git]  <nop>
nmap     <Space>gi [git]
nnoremap [git]v :<C-u>Gitv <cr>
nnoremap [git]V :<C-u>Gitv!<cr>
"nnoremap [git]d :<C-u>GitDiff --cached<Enter>
nnoremap [git]d :<C-u>Gdiff
"nnoremap [git]D :<C-u>GitDiff
nnoremap [git]s :<C-u>Gstatus<Enter>
nnoremap [git]l :<C-u>GitLog<Enter>
nnoremap [git]L :<C-u>GitLog -u \| head -10000<Enter>
nnoremap [git]a :<C-u>GitAdd<Enter>
nnoremap [git]A :<C-u>GitAdd <cfile><Enter>
nnoremap [git]c :<C-u>GitCommit<Enter>
nnoremap [git]C :<C-u>GitCommit --amend<Enter>
nnoremap [git]p :<C-u>Git push
let g:git_no_map_default = 1
"let g:git_command_edit = 'rightbelow vnew'
augroup Git
    autocmd!
    autocmd FileType git :setlocal foldlevel=99
augroup END
let g:Gitv_OpenHorizontal = 0
let g:Gitv_GitExecutable = 'git'
