"============================================================
" @jpformat
" 日本語入力支援
"============================================================
" 文字数指定を半角/全角単位にする
" 1:半角
" 2:全角
let JpFormatCountMode = 2
"" 原稿(折り返し)全角文字数
"let JpCountChars = 40
"" 原稿行数
""let JpCountLines = 17
"" 禁則処理の最大ぶら下がり字数
"let JpCountOverChars = 1
"" 半角一文字分オーバーしても折り返し処理をする/しない
let JpFormatHankakuOver = 1
" 折り返し文字数(原稿用紙文字数)は textwidthから設定する
let JpCountChars_Use_textwidth = 1
" 挿入モードで一文字入力する度に自動整形を行う/行わない
let JpFormatCursorMovedI = 1
" 整形対象外行の正規表現
let JpFormatExclude = '^$'
" 原稿用紙換算計算時に削除するルビ等の正規表現
let JpCountDeleteReg = '\[.\{-}\]\|<.\{-}>\|《.\{-}》\|［.\{-}］\|'
" 整形コマンドを使用したら自動整形もON
let JpAutoFormat = 0
" 連結マーカー
let JpFormatMarker = "\t"
" 基本的な処理方法
" 1. まず指定文字数に行を分割
" 2. 次行の行頭禁則文字(JpKinsoku)を現在行へ移動
" 3. 現在行の行末禁則文字(JpKinsokuE)を次行へ移動
" 4. ぶら下がり文字数を超えてぶら下がっていたら追い出し(JpKinsokuO)
"    (JpKinsokuOが未設定の場合はJpKinsokuで代用されます)
" 行頭禁則
let JpKinsoku = '[-!?}>－ｰ～！？゛゜ゝゞ）］｡｣､･ﾞﾟヽヾー々‐・:;.°′″、。，．,)\]｝〕〉》」』】〟’”≫‥―…]'
" 行末禁則
let JpKinsokuE = '[0-9a-zA-Z([{<（｛〔〈《「『【〝‘“≪]'
" 句点と閉じ括弧
let JpKutenParen = '[、。，．,)\]｝〕〉》」』】〟’”≫]'
" 句点と閉じ括弧で分離不可文字追い出し用
" 分離不可文字を追い出す時JpNoDivNがあったら、そこから追い出し。
" ですか？――<分割> があったら ？は残して――のみを追い出すための指定。
let JpNoDivN = '[、。，．,)\]｝〕〉》」』】〟’”≫!?！？]'
" 分離不可
let JpNoDiv = '[―…‥]'
" 連結マーカー非使用時のTOLキャラクター
let JpJoinTOL = '[\s　「・＊]'
" 連結マーカー非使用時のEOLキャラクター
let JpJoinEOL = '[。」！？］]'
" 挿入モードへ移行したら自動連結
" 0 : なにもしない
" 1 : カーソル位置以降を自動連結
" 2 : パラグラフを自動連結
let JpAutoJoin = 0
" gqを使用して整形を行う
let JpFormatGqMode = 1
" gqを使用して整形する場合の整形コマンド
" 空文字列なら現在formatexprに設定しているコマンドが使用される
let JpFormat_formatexpr = ''
set formatexpr=jpfmt#formatexpr()
" 入力モードで自動的に日本語入力をOFF、検索で自動的に日本語入力OFF
set iminsert=0 imsearch=0
"set iminsert=2
" insertモードを抜けるとIMEオフ
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
" IME ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
highlight CursorIM guibg=Purple guifg=NONE
endif

" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1

" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
"set timeout timeoutlen=3000 ttimeoutlen=50
set timeout ttimeoutlen=50

