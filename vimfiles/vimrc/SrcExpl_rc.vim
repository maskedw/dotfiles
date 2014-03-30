"============================================================
" @srcEploler
" 自動でカーソル位置のタグをプレビュー表示する。
" 常時使用すると非常にうざいので、必要なときだけ使用する。
"============================================================
nnoremap <Space>set :<C-u>SrcExplToggle<CR>
"Set the height of Source Explorer window
let g:SrcExpl_winHeight = 15
"Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
"Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
"Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<C-b>"
"In order to Avoid conflicts, the Source Explorer should know what plugins
"are using buffers. And you need add their bufname into the list below
"according to the command ":buffers!"
let g:SrcExpl_pluginList = [
         \ "__Tag_List__",
         \ "_NERD_tree_",
         \ "Source_Explorer",
         \ "*unite*"
     \ ]
"Enable/Disable the local definition searching, and note that this is not
"guaranteed to work, the Source Explorer doesn't check the syntax for now.
"It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
"Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
"Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"
