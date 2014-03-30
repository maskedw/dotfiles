"============================================================
" @qfixgrep
" プレビュー&絞り込み機能付きgrep
"============================================================
"grep使用時に |cw を対象があるときのみ自動的に実行する
augroup QuckfixCmd
    autocmd!
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,cscope if len(getqflist()) != 0 | botright cw 5 | endif
augroup END
"autocmd QuickfixCmdPost cscope if len(getqflist()) != 0 | botright copen 5 | endif

" Grepコマンドのキーマップ
let g:MyGrep_Key  = 'g'
" Grepコマンドの2ストローク目キーマップ
let g:MyGrep_KeyB = ','
" grep対象にしたくないファイル名の正規表現
let g:MyGrep_ExcludeReg = '[~#]$\|\.dll$\|\.exe$\|\.lnk$\|\.o$\|\.obj$\|\.pdf$\|\.xls$|' .
                         \'\.a$\|\.so$\|\.d$\|\.bak$\|[/\\]tags$\|^tags$'
" ユーザ定義可能な追加オプション
"let g:MyGrepcmd_useropt = " -i -n -I -D skip " .
"                        \ " --exclude-dir=.git --exclude-dir=doxygen --exclude-dir=bin" .
"                        \ " --exclude-dir=html"
let s:ignore = expand('$HOME/.grepignore') " 直接MyGrepcmd_useroptに展開すると失敗するので・・・
let s:ignore = substitute(s:ignore, "\\", "/", "g")
let g:MyGrepcmd_useropt = " -i -n -I -D skip " .
                        \ " --exclude-dir=.git --exclude-dir=doxygen --exclude-dir=bin" .
                        \ " --exclude-dir=html --exclude-from=" . s:ignore

" Windowsでcygwin1.7以降のgrep.exeを使用する場合のみ 1 に設定
let g:MyGrep_cygwin17 = 1
" 使用するgrep
let g:mygrepprg = 'grep'
" 日本語が含まれる場合のgrep指定
let g:myjpgrepprg = ''
" 外部grep(shell)でエンコーディング変換が行われる場合のエンコーディング指定
" (通常はMyGrep_ShellEncodingと同一のため設定しないでください)
let g:MyGrep_FileEncoding = ''
" 「だめ文字」対策を有効/無効
let g:MyGrep_Damemoji = 2
" 「だめ文字」を置き換える正規表現
let g:MyGrep_DamemojiReplaceReg = '(..)'
" 「だめ文字」を自分で追加指定したい場合は正規表現で指定する
let g:MyGrep_DamemojiReplace = '[]'
" QFixGrepの検索時にカーソル位置の単語を拾う
let g:MyGrep_DefaultSearchWord = 1
" grep実行時にエラーメッセージが出たら表示
let g:MyGrep_error = 1
" QuickFixウィンドウでカーソルラインを表示
let g:QFix_CorsorLine = 1
let g:QFix_PreviewEnable = 1
" Quickfixウィンドウを下側に表示
let g:QFix_CopenCmd = 'botright'
" プレビューウインドウを右側に表示
"let g:QFix_PreviewOpenCmd = 'vertical botright'
let g:QFix_PreviewOpenCmd = 'topleft'
" QuickFixウィンドウの <S-CR> は分割ではなくタブで開くには 'tab'に設定する
let g:QFix_Edit = 'tab'
" Quickfixウィンドウの横幅指定
"let QFix_Width         = 60
let g:QFix_Height = 10
let g:QFix_UseModifiedWindow = 0
" プレビューウィンドウの横幅指定
let QFix_PreviewWidth  = 70
let QFix_PreviewHeight = 15

let g:QFix_HighSpeedPreview = 1
let g:QFix_UseLocationList = 1
