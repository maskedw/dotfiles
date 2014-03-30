"=== @color
" 256色モード
set t_Co=256

" 常にカーソル行が画面中央にくるようにする。
set scrolloff=1000
"
" 構文ハイライト有効化
syntax enable
if has('vim_starting')
    filetype off
    filetype plugin indent off
    set runtimepath+=~/bundle/neobundle.vim/,~/.vim/after
    call neobundle#rc(expand('~/bundle/'))
    filetype on
    filetype plugin indent on
endif


"============================================================
"@vimmain プラグインに依存しない設定
"============================================================
"" ファイル名の展開に'/'を使用する
"" これを設定するとwindows7環境でsyntasticが動作しなくなったのでコメントアウト
"" しておく。
"set shellslash
" CUIvimでもマウス操作を有効にする
set mouse=a
" helpの優先順位
set helplang=ja,en
" スプラッシュ画面を表示しない
set shortmess& shortmess+=I
" 他でファイルが書き換えられたら自動で読み直す
set autoread
" キーマップリーダーをデフォルトの'\'から変更
"let mapleader = ","
"入力途中のコマンドを右下に表示する
set showcmd
"バッファを閉じるときに隠し状態にする
"set hidden
if has('win32') || has('win64')
"gitvやらプラグインがファイルを開けません的なエラーを吐くようになったので、コメント化しとく。
    "set shell=nyaos.exe
    "set shellcmdflag=-e
    ""set shellpipe=\|&\ tee
    "set shellpipe=
    "set shellredir=>%s\ 2>&1
    "set shellxquote=\"
    let $CYGWIN = 'nodosfilewarning'
endif
set updatetime=500
" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast
"=== @path
" ファイルの探索パス
set path&
if has('win32') || has('win64')
    set path+=c:/MinGW/include,c:/MinGW/lib/gcc/mingw32/4.8.1/include/c++
    set path+=c:/MinGW/lib/gcc/mingw32/4.8.1/include
    set path+=c:/home/src/boost_1_54_0
else
    set path+=~/local/boost/include
    set path+=/usr/lib/gcc/i686-linux-gnu/4.7/include
    set path+=/usr/local/include
    set path+=/usr/lib/gcc/i686-linux-gnu/4.7/include-fixed
    set path+=/usr/include/i386-linux-gnu
    set path+=/usr/include
    set path+=/usr/include/c++/4.7
    set path+=~/work/yslab_signageDevice/
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/Qt
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtGui
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtCore
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtDeclarative
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtMultimedia
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtOpenGL
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtScriptTools
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtSvg
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtUiTools
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtXml
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/phonon
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtDBus
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtDesigner
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtHelp
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtNetwork
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtScript
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtSql
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtTest
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtWebKit
    "set path+=/opt/QtSDK/Desktop/Qt/4.8.1/gcc/include/QtXmlPatterns
endif
let g:default_path = &path

function! VimPath2CincludePath(path)
    let CincludePath = a:path
    let CincludePath = substitute(CincludePath, ",", " -I ", "g")
    let CincludePath = substitute(CincludePath, "\\", "", "g")
    let CincludePath = substitute(CincludePath, "^.", "", "")
    return CincludePath
endfunction

"=== @tags
" なんかここを有効にしていると、:ltag hogeとかするとタグファイルがソートされて
" いませんとかエラーがでるのでコメントアウト。それでもタグジャンプとかは普通に
" できる。
"set tags&
"if has('path_extra')
"    set tags+=tags;
"endif
"=== @complete
"コマンド補完に関する設定
set wildmode=longest:full,full
set completeopt=menuone
"=== @coding
" タブ設定
set showtabline=0
"良い感じのCインデント
set smartindent
" タブ文字と、行末空白を可視化
set list

"@@@"""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:>-,trail:-",eol:$
set tabstop=4
set softtabstop=0
"vimが挿入するインデント幅は見た目上何文字分か
set shiftwidth=4
"TAB - SPACE 変換
set expandtab
"新しい行のインデントを現在行と同じにする
set autoindent
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"バックスペースで特殊な文字を消せるようにする
set backspace=indent,eol,start
"テキスト整形の設定。フラグの意味は:help formatoptions
"及び:help fo-tableを参照せよ
set formatoptions& formatoptions+=tcroqnmMj
" 自動整形の対象となるテキスト幅。ここでは0を指定しておき、ファイルタイプ別
" プラグインで個別に指定する。
set textwidth=0
"
"=== @copy&paste
" 矩形選択で自由に移動する
set virtualedit& virtualedit+=block
" 文字がない場所でのペースト時に空白を詰める
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif
"クリップボードをOSと共用にする
if (has('unix'))
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" 外部からペーストする時だけset pasteとしておくと綺麗に貼りやすいらしい。
set nopaste
"=== @configfile
"バックアップファイルを使用する
set backup
"スワップファイルを使用しない
set noswapfile
set viewdir=~/.vimview
set backupdir=~/vim_backup
set directory=~/vim_swap

" 何故かこのオプションを有効にすると、neocomplcacheが異常に重くなる。
"@@@set viminfo=%,'50,/50,:50,<50,@50,h,f1,n~/.viminfo

set sessionoptions=curdir,resize,tabpages,winpos,winsize,unix,slash
"バッファのオプションはセーブしない
set viewoptions=cursor,folds,slash,unix
"コマンド履歴保存数
set history=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"=== @window
"コマンドラインの高さ(gVim用も別に用意する)
set cmdheight=2
"プレビューウインドウの高さ
set previewheight=10

"=== @search
"検索や置換時に大文字、小文字を区別する。区別しないようにしたいときは
"パターンのどこかに\cをふくめればよい。
set noignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"インクリメンタルサーチ有効
set incsearch
"検索結果をハイライト
set hlsearch
" 検索がファイル末尾まで進んだらファイル先頭から再び検索する。
set wrapscan
"=== @encoding
if !has('gui_running')
  if &term == 'win32' || &term == 'win64'
    " Setting when use the non-GUI Japanese console.
    " Garbled unless set this.
    set termencoding=cp932
    " Japanese input changes itself unless set this.
    " Be careful because the automatic recognition of the character code is not possible!
    set encoding=japan
  else
      set termencoding=  " same as 'encoding'
  endif
endif

if has('win32') || has('win64')
    set fileformats=dos,unix,mac
else
    set fileformats=unix,dos,mac
endif

set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set ambiwidth=double

"=== @view
"ステータスバーを常に表示
set laststatus=2
"行番号非表示
"set nonumber
"行番号表示
set number
"ステータスラインに行、列表示
set ruler
"全角スペースを可視化
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/
"ツールバーを非表示にする
set guioptions-=T
"メニューバーを非表示にする
set guioptions-=m
"右スクロールバー非表示
set guioptions-=r
set guioptions-=R
"左スクロールバー非表示
set guioptions-=l
set guioptions-=L
"下スクロールバー非表示
set guioptions-=b
set matchpairs+=<:>

"=== @autocmd-generic
augroup MyGeneric
    autocmd!
    " 前回終了したカーソル行に移動
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
    " 折りたたみの時のmkview loadviewを自動化する
    autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
    autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
    " 保存時に行末の空白を除去する
    autocmd BufWritePre * :%s/\s\+$//ge
    autocmd CmdwinEnter * map <buffer> <S-CR> <CR>q:
    autocmd BufRead *mkd   highlight link ZenkakuSpace NONE
augroup END

"=== @keymap-generic
" CUI Vimでも<Alt->のキーマップを可能にする。シフトも組み合わせて
" <A-S-n>とかもOK
" [参考]
" http://blog.remora.cx/2012/07/using-alt-as-meta-in-vim.html
let c = 'a'
while c <= 'z'
    execute "set <M-" . c . ">=\e" . c
    execute "imap \e" . c . " <M-" . c . ">"
    execute "set <M-S-" . c . ">=\e" . toupper(c)
    execute "imap \e" . toupper(c) . " <M-" . c . ">"
    let c = nr2char(1+char2nr(c))
endw
" 上記Altキーの設定によりコマンドモードでESCを２回押さないとノーマルモードに戻
" れなくなるので、ESC２連続をマップしておく。
cnoremap <C-[> <ESC><ESC>
" CTRL-hjklでウィンドウ移動
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l
nnoremap <C-H> <C-w>h

nnoremap <A-J> 5j
nnoremap <A-K> 5k
nnoremap <A-L> 5l
nnoremap <A-H> 5h

" Shift-hjklでウィンドウサイズ調整
nnoremap <S-J> <C-w>4-
nnoremap <S-K> <C-w>4+
nnoremap <S-L> <C-w>4>
nnoremap <S-H> <C-w>4<
" Visualモードで選んだ範囲を'> | <'でインデント調整
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" 検索ハイライト消去
nmap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>
" Tab操作
nnoremap          [TABCMD]  <nop>
nmap     <Space>t [TABCMD]
nnoremap <silent> [TABCMD]l :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]h :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
nnoremap <silent> <Space>qc :<C-u>cclose<CR>
nnoremap <silent> <Space>qo :<C-u>botright cwindow 5<CR>
" tagをプレビューで開く
nnoremap <silent><Space>s  <C-w>}
" プレビューウインドウを閉じる
nnoremap <silent><Space>q  <C-w><C-z>
"カレントバッファのディレクトリへ移動
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"フルスクリーンモード
nnoremap <silent> <F11> :call ToggleFullScreen()<CR>
nnoremap <silent> <C-c><C-d> :call CdRootDir()<CR>
"直前のコマンドを再実行。@:がビルトインの方法だが、@がYankRingにmapされているの
"で以下で代用する。
"nnoremap c. q:<ESC>k<CR>
nnoremap <C-@> q:<ESC>k<CR>


"=== @function-generic

function! CdRootDir()
    if exists("g:project_root")
        execute "cd " . g:project_root
        echo getcwd()
    endif
endfunction

function! ToggleFullScreen()
  if &guioptions =~# 'C'
    set guioptions-=C
    if exists('s:go_temp')
      let mod = "remove"
      if s:go_temp =~# 'm'
        set guioptions+=m
      endif
      if s:go_temp =~# 'T'
        set guioptions+=T
      endif
    endif
    if has('win32') || has('win64')
        simalt ~r
    else
        call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
    endif
  else
    let mod = "add"
    let s:go_temp = &guioptions
    set guioptions+=C
    set guioptions-=m
    set guioptions-=T
    if has('win32') || has('win64')
        simalt ~x
    else
        call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
    endif
  endif
endfunction

"カレントディレクトリを現在開いているバッファのディレクトリにする
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

if has('win32') || has('win64')
	function! QfMakeConv()
	   let qflist = getqflist()
	   for i in qflist
	      let i.text = iconv(i.text, "sjis", "utf-8")
	   endfor
	   call setqflist(qflist)
	endfunction
	au QuickfixCmdPost make call QfMakeConv()
endif

nnoremap  <silent> <F1> :<C-u>ToggleNumber2<CR>
command! -nargs=0 ToggleNumber2 call ToggleNumberOption2()

function! ToggleNumberOption2()
if &number
    set nonumber
else
    set number
endif
endfunction

if version >= 703
  nnoremap  <silent> <F2> :<C-u>ToggleNumber<CR>
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &relativenumber
      set norelativenumber
    else
      set relativenumber
    endif
  endfunction
endif

augroup filetype
    au! BufRead,BufNewFile *.dis    set filetype=cmix
    au! Syntax mixed so ~/.vim/syntax/cmix.vim
augroup END

augroup Cusorl
    autocmd!
    autocmd WinEnter,BufRead * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

nnoremap           [my]  <nop>
nmap     <Space>my [my]
"nnoremap [my]b :<C-u>let @+ = expand("%") . " | " . line(".")<CR>
nnoremap [my]b :<C-u>call GetBookmark()<CR>

function! GetBookmark()
    let @+ = expand("%") . " | " . line(".")
endfunction

" http://gajumaru.ddo.jp/wordpress/?p=1024
cnoremap OD <Left>
cnoremap OB <Down>
cnoremap OA <Up>
cnoremap OC <Right>


nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
" nmap ;  <sid>(command-line-enter)
" xmap ;  <sid>(command-line-enter)

nmap <C-CR>  <sid>(command-line-enter)
set cmdwinheight=3
augroup CmdWin
    autocmd!
    autocmd CmdwinEnter * call s:init_cmdwin()
augroup END
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  "nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  setlocal nonumber
  startinsert!
endfunction

"set cscoperelative
"set csre
set csverb
set csto=1
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
" シンボルを検索
nnoremap _s :<C-u>cs find s <C-R>=expand("<cword>")<CR><CR>
" 定義を検索
nnoremap _g :<C-u>cs find g <C-R>+ <CR>
" この関数から呼ばれる関数を検索
nnoremap _d :<C-u>cs find d <C-R>=expand("<cword>")<CR><CR>
" この関数を読んでいる関数を検索
nnoremap _c :<C-u>cs find c <C-R>=expand("<cword>")<CR><CR>
" 文字列を検索
nnoremap _t :<C-u>cs find t <C-R>=expand("<cword>")<CR><CR>
" egrepパターンを検索
nnoremap _e :<C-u>cs find e <C-R>=expand("<cword>")<CR><CR>
" このファイルを検索
nnoremap _f :<C-u>cs find f <C-R>=expand("<cfile>")<CR><CR>
" このファイルをincludeしているファイルを検索
nnoremap _i :<C-u>cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

if filereadable(".local.vimrc")
    source .local.vimrc
endif
if filereadable("cscope.out")
    execute "cs add " . getcwd()."/cscope.out " . getcwd()
endif
