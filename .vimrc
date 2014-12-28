" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nospell
scriptencoding utf-8
" set shellslash
" set shell=nyaos.exe
" set shellcmdflag=-e
" set shellpipe=\|&\ tee
" set shellredir=>%s\ 2>&1
function! s:get_SID()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeget_SID$')
endfunction
let s:SID = s:get_SID()
delfunction s:get_SID

augroup MyVimrc
    autocmd!
augroup END
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
" XXX
AutocmdFT vim highlight def link myVimAutocmd vimAutocmd
AutocmdFT vim match myVimAutocmd /\<\(Autocmd\|AutocmdFT\)\>/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUNDLE_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! isdirectory(expand('~/vim.d/bundle'))
    echon "Installing neobundle.vim..."
    silent call mkdir(expand('~/vid.d/bundle'), 'p')
    execute '!git clone https://github.com/Shougo/neobundle.vim ' . expand('~/vim.d/bundle/neobundle.vim')
    echo "done."
    if v:shell_error
        echoerr "neobundle.vim installation has failed!"
        finish
    endif
endif

" {{{ @neobundle
if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    set runtimepath+=~/vim.d/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/vim.d/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vinarise'

NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font.git'
NeoBundle 'tsukkee/unite-help.git'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'rhysd/quickrun-unite-quickfix-outputter'
NeoBundle 'rhysd/unite-locate'
NeoBundle 'sgur/unite-everything'

" C/C++
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'vim-scripts/Mixed-sourceassembly-syntax-objdump'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'https://bitbucket.org/kh3phr3n/vim-qt-syntax.git'
" NeoBundle 'vim-scripts/CCTree'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/doxygen-support.vim'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'rhysd/clang-extent-selector.vim'
NeoBundle 'rhysd/clang-type-inspector.vim'
NeoBundle 'rhysd/vim-clang-format'

" memo
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'Rykka/InstantRst'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle "godlygeek/tabular"
NeoBundle 'plasticboy/vim-markdown.git'
NeoBundle 'kannokanno/previm'
NeoBundle 'vim-voom/VOoM'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
NeoBundle 'junegunn/vim-easy-align'

" Powershell
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'cd01/poshcomplete-vim'

" utility
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
" GVimのカラースキームをCUI版でも使えるように変換する
NeoBundle 'godlygeek/csapprox'
NeoBundle 'thinca/vim-guicolorscheme'
" CUI版Vimでもクリップボードを使用できるようにする
NeoBundle 'kana/vim-fakeclip'
" ステータスラインをかっこよくする
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'liotaz/BlockDiff'
" スクラッチバッファ
NeoBundle 'duff/vim-scratch'
" 関連するファイルを開きやすくする。
NeoBundle 'kana/vim-altr'
" かっちょいいカラーテーマ
NeoBundle 'w0ng/vim-hybrid'


" NeoBundle 'vim-scripts/YankRing.vim'
" リファレンスの参照
NeoBundle 'thinca/vim-ref'
" .gitとかのディレクトリを認識して楽に移動できるようにする。
NeoBundle "airblade/vim-rooter"
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'sudo.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/webapi-vim'


" 非同期処理
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin'  : 'make -f make_cygwin.mak',
    \     'mac'     : 'make -f make_mac.mak',
    \     'unix'    : 'make -f make_unix.mak',
    \    },
    \ }

NeoBundleLazy 'Shougo/vimfiler.vim', {
    \ 'depends' : 'Shougo/unite.vim',
    \ 'autoload' : {
    \     'commands' : ['VimFiler', 'VimFilerCurrentDir',
    \                   'VimFilerBufferDir', 'VimFilerSplit',
    \                   'VimFilerExplorer', 'VimFilerDouble']
    \     }
    \ }

NeoBundleLazy 'Shougo/unite.vim', {
    \   'autoload' : {
    \     'commands' : [{'name': 'Unite', 'complete' : 'customlist,unite#complete_source'},
    \                   {'name': 'UniteWithBufferDir', 'complete' : 'customlist,unite#complete_source'},
    \                   {'name': 'UniteWithCursorWord', 'complete' : 'customlist,unite#complete_source'},
    \                   {'name': 'UniteWithWithInput', 'complete' : 'customlist,unite#complete_source'}]
    \   }
    \ }

NeoBundleLazy 'tyru/caw.vim', {
    \ 'autoload' : {
    \     'mappings' :
    \         ['<Plug>(caw', '<Plug>(operator-caw)']
    \     }
    \ }

NeoBundleLazy 'vim-scripts/ZoomWin', {
    \ 'autoload' : {
    \     'commands' : 'ZoomWin'
    \     }
    \ }

" NeoBundleLazy 'Shougo/vimshell', {
"     \ 'autoload' : {
"     \     'commands' : ['VimShell', 'VimShellSendString', 'VimShellCurrentDir', 'VimShellInteractive'],
"     \     }
"     \ }

NeoBundle 'tpope/vim-fugitive'
" NeoBundleLazy 'tpope/vim-fugitive', {
"     \ 'autoload' : {
"     \       'commands' : ['Gstatus', 'Gcommit', 'Gwrite', 'Gdiff', 'Gblame', 'Git', 'Ggrep']
"     \   }
"     \ }

NeoBundleLazy 'itchyny/calendar.vim', {
    \ 'autoload' : {
    \       'commands' : {'name' : 'Calendar', 'complete' : 'customlist,calendar#argument#complete'},
    \   }
    \ }

NeoBundleLazy 'rhysd/unite-codic.vim', {
    \ 'depends' : [
    \       'Shougo/unite.vim',
    \       'koron/codic-vim',
    \   ],
    \ 'autoload' : {
    \       'unite_sources' : 'codic',
    \   },
    \ }

NeoBundleLazy 'cohama/agit.vim', {
    \   'autoload' : {
    \     'commands' : 'Agit'
    \   }
    \ }
"
" " C++用のプラグイン
" どうも他のC/C++プラグインもLazyにしていると、clang_completeの補完が効かなくな
" る時がある。よくわからんが、他のはLazyをやめておく。
NeoBundleLazy 'Rip-Rip/clang_complete', {
    \ 'autoload' : {'filetypes' : ['c', 'cpp']}
    \ }
" NeoBundle 'Rip-Rip/clang_complete'

" Python
" NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'autoload' : {
    \     'filetypes' : 'python',
    \    },
    \  }

NeoBundleLazy 'hynek/vim-python-pep8-indent', {
    \ 'autoload' : {
    \     'filetypes' : 'python',
    \   }
    \ }

NeoBundleLazy 'digitaltoad/vim-jade', {
    \ 'autoload' : {
    \     'filetypes' : 'jade',
    \   }
    \ }

" JSON
" NeoBundleLazy 'elzr/vim-json', {
"     \ 'autoload' : {'filetypes' : ['json', 'markdown']}
"     \ }
"
" " Bash
" NeoBundleLazy 'vim-scripts/bash-support.vim', {
"     \ 'autoload' : {
"     \     'filetypes' : 'sh',
"     \   }
"     \ }
"
" " Go
" NeoBundleLazy 'Blackrush/vim-gocode', {
"     \ 'autoload' : {
"     \       'filetypes' : ['go', 'markdown'],
"     \       'commands' : 'Godoc',
"     \   }
"     \ }
"
NeoBundleLazy 'rhysd/unite-go-import.vim', {
    \ 'autoload' : {
    \     'depends' : ['Shougo/unite.vim', 'Blackrush/vim-gocode'],
    \     'unite_sources' : 'go/import',
    \   }
    \ }

NeoBundleLazy 'dgryski/vim-godef', {
    \ 'autoload' : {
    \     'filetypes' : 'go'
    \   }
    \ }

NeoBundleLazy 'rhysd/vim-go-impl', {
    \ 'autoload' : {
    \     'filetypes' : 'go'
    \   }
    \ }
call neobundle#end()

NeoBundleCheck

" Required:
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイルの探索パス
set path&
if has('win32') || has('win64')
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/include/c++
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/include/c++/mingw32
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/include/c++/backward
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/include
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/../../../../include
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/include-fixed
    set path+=c:/mingw/bin/../lib/gcc/mingw32/4.8.1/../../../../mingw32/include
else
    set path+=~/local/boost/include
    set path+=/usr/lib/gcc/i686-linux-gnu/4.8/include
    set path+=/usr/local/include
    set path+=/usr/lib/gcc/i686-linux-gnu/4.8/include-fixed
    set path+=/usr/include/i386-linux-gnu
    set path+=/usr/include
    set path+=/usr/include/c++/4.8
endif
let g:default_path = &path

" 新しい行のインデントを現在行と同じにする
set autoindent

" タブと対応する空白の数
set tabstop=4

" これは挙動がよくわからんので0(無効)とる。
set softtabstop=0

" vimが挿入する自動インデント幅は見た目上の空白何文字分か
set shiftwidth=4

" インデントをshiftwidthの倍数にまるめる。
set shiftround

" TAB - SPACE 変換
set expandtab

" ウインドウに収まらない行は折り返して表示する。
set wrap           " the longer line is wrapped
set linebreak      " wrap at 'breakat'
" set breakat=\      " break point for linebreak (default " ^I!@*-+;:,./?")
set breakat-=-
set breakat-=.
set showbreak=+\   " set showbreak
if (v:version == 704 && has("patch338")) || v:version >= 705
  set breakindent    " indent even for wrapped lines
  " breakindent option
  " autocmd is necessary when new file is opened in Vim
  " necessary even for default(min:20,shift:0)
  Autocmd BufEnter * set breakindentopt=min:20,shift:0
endif


" 検索がファイル末尾まで進んだらファイル先頭から再び検索する。
set wrapscan

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" ステータスラインに行、列表示
set ruler

" ステータスバーを常に表示する
set laststatus=2

" 常にカーソル行が画面中央にくるようにする。
set scrolloff=1000

" 改行時に良い括弧とかの文脈にそったいい感じの自動インデントを使用する。
set smartindent

"検索や置換時に大文字、小文字を区別する。区別しないようにしたいときは
"パターンのどこかに\cをふくめるか set ignorecaseとする。
set noignorecase

"検索時に大文字を含んでいたら大/小を区別する。
set smartcase

" ビジュアルベル無効
set novb t_vb=

" タブ文字と、行末空白を可視化
set list

" 特殊文字の見え方
set listchars=tab:>-,trail:-",eol:$

" スプラッシュ画面を表示しない
set shortmess& shortmess+=I

" IM(インプットメソッド)を使用する
set noimdisable

" タブページが2個以上あるときだけラベルを表示する。
set showtabline=1

"インクリメンタルサーチ有効
set incsearch

" 検索結果をハイライトする
set hlsearch

" コマンドラインモードでコマンドウインドウを出すキー
set cedit=<C-c>

" バックスペースで特殊な文字を消せるようにする
set backspace=indent,eol,start

" テキスト整形の設定。各フラグの意味は:help formatoptions及び:help fo-tableを参照
set formatoptions& formatoptions+=tcroqnmMj

" 8進数インクリメントをオフにする
set nrformats-=octal

" バッファを閉じるときに隠し状態にする
set hidden

" helpの優先順位
set helplang=ja,en

" クリップボードをOSと共用にする
if (has('unix'))
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" 矩形選択で自由に移動する
set virtualedit& virtualedit+=block

" 改行コードの自動認識
if has('win32') || has('win64')
    set fileformats=dos,unix,mac
else
    set fileformats=unix,dos,mac
endif

" 自動整形の対象となるテキスト幅。ここでは0を指定しておき、ファイルタイプ別
" プラグインで個別に指定することにする。
set textwidth=0

" コマンド実行中も再描画する。
set nolazyredraw

" 高速ターミナル接続を行う
set ttyfast

" 補完候補が一つだけでもポップアップを表示する。
set completeopt=menuone

" 折りたたみを有効にする。
set foldenable

" マルチマイト文字があってもカーソルがずれないようにする。
set ambiwidth=double

" 読み込んでいるファイルが外部のプログラムで変更されたら自動で読みなおす。
set autoread

" " h と l で行を跨げるようにする
" set whichwrap +=h
" set whichwrap +=l

" 256色モード
set t_Co=256

" 折り返しでインデントを保持
if exists('+breakindent')
    set breakindent
    set breakindentopt=shift:-4
    let &showbreak = '>>> '
endif

" CUIvimでもマウス操作を有効にする
set mouse=a

" 他のプログラムでファイルが書き換えられたら自動で読み直す
set autoread

" キーマップリーダーをデフォルトの'\'から変更
"let mapleader = ","

"入力途中のコマンドを右下に表示する
set showcmd

if has('win32') || has('win64')
" !!
" gitvやらプラグインがファイルを開けません的なエラーを吐くようになったので、コメント化しとく。
    "set shell=nyaos.exe
    "set shellcmdflag=-e
    ""set shellpipe=\|&\ tee
    "set shellpipe=
    "set shellredir=>%s\ 2>&1
    "set shellxquote=\"
    let $CYGWIN = 'nodosfilewarning'
endif

" CursolHoldイベント
set updatetime=500

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

"=== @tags
set tags&
if has('path_extra')
    set tags+=tags;
endif

"コマンド補完に関する設定
set wildmode=longest:full,full

set completeopt=menuone

" タブ設定
set showtabline=0


" 文字がない場所でのペースト時に空白を詰める
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" 外部からペーストする時だけset pasteとしておくと綺麗に貼りやすいらしい。
set nopaste

"バックアップファイルを使用する
set backup

"スワップファイルを使用しない
set noswapfile

set viewdir=~/vim.d/view
set backupdir=~/vim.d/backup
set directory=~/vim.d/swap
set undodir=~/vim.d/undo
set undofile

"!! 何故かこのオプションを有効にすると、neocomplcacheが異常に重くなる。
"set viminfo=%,'50,/50,:50,<50,@50,h,f1,n~/.viminfo

set sessionoptions=curdir,resize,tabpages,winpos,winsize,unix,slash
"バッファのオプションはセーブしない
set viewoptions=cursor,folds,slash,unix
"コマンド履歴保存数
set history=100

"コマンドラインの高さ(gVim用も別に用意する)
set cmdheight=2

"プレビューウインドウの高さ
set previewheight=10

set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set ambiwidth=double

"行番号非表示
"set nonumber

"行番号表示
set number

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

" "=== @keymap-generic
" " CUI Vimでも<Alt->のキーマップを可能にする。シフトも組み合わせて
" " <A-S-n>とかもOK
" " [参考]
" " http://blog.remora.cx/2012/07/using-alt-as-meta-in-vim.html
" let c = 'a'
" while c <= 'z'
"     execute "set <M-" . c . ">=\e" . c
"     execute "imap \e" . c . " <M-" . c . ">"
"     execute "set <M-S-" . c . ">=\e" . toupper(c)
"     execute "imap \e" . toupper(c) . " <M-" . c . ">"
"     let c = nr2char(1+char2nr(c))
" endw
" 上記Altキーの設定によりコマンドモードでESCを２回押さないとノーマルモードに戻
" れなくなるので、ESC２連続をマップしておく。
" cnoremap <C-[> <ESC><ESC>

set cmdwinheight=3
"set cscoperelative
"set csre
set csverb
set csto=1
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBIND:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 行番号表示設定トグルのショートカット
" nnoremap  <silent> <F1> :<C-u>call ToggleNumberOption2()<CR>
" " 相対行表示設定トグルのショートカット
" nnoremap  <silent> <F2> :<C-u>call ToggleNumberOption()<CR>
"フルスクリーンモード
nnoremap <silent> <F11> :call ToggleFullScreen()<CR>
" 検索ハイライト消去
nmap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>

" 縦方向は論理移動する
noremap j gj
noremap k gk

" Shift-hjklでウィンドウサイズ調整
nnoremap <S-j> <C-w>10-
nnoremap <S-k> <C-w>10+
nnoremap <S-l> <C-w>10>
nnoremap <S-h> <C-w>10<
" Shift + カーソルキーでのウィンドウサイズ変更
nnoremap <silent><S-Down>  <C-w>10-
nnoremap <silent><S-Up>    <C-w>10+
nnoremap <silent><S-Left>  <C-w>10<
nnoremap <silent><S-Right> <C-w>10>

" Visualモードで選んだ範囲を'> | <'でインデント調整
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" 現在のウィンドウのみを残す
nnoremap <C-w>O <C-w>o
" バッファ削除
nnoremap <C-w>d :<C-u>call <SID>delete_current_buf()<CR>
nnoremap <C-w>D :<C-u>bdelete<CR>
nnoremap <silent><Leader>h :<C-u>SmartHelp<Space><C-l>
" コマンドラインウィンドウ
" 検索後画面の中心に。
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz
"カレントバッファのディレクトリへ移動
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"直前のコマンドを再実行。@:がビルトインの方法だが、@がYankRingにmapされているの
"で以下で代用する。
nnoremap <C-@> q:<ESC>k<CR>
" " tagをプレビューで開く
" nnoremap <silent><Space>s  <C-w>}
" " プレビューウインドウを閉じる
" nnoremap <silent><Space>q  <C-w><C-z>
" nnoremap <silent> <C-c><C-d> :call CdRootDir()<CR>

" " http://gajumaru.ddo.jp/wordpress/?p=1024
" cnoremap OD <Left>
" cnoremap OB <Down>
" cnoremap OA <Up>
" cnoremap OC <Right>
"Emacsライクなバインディング．ポップアップが出ないように移動．
inoremap <C-e> <END>
vnoremap <C-e> <END>
cnoremap <C-e> <END>
inoremap <C-a> <HOME>
vnoremap <C-a> <HOME>
cnoremap <C-a> <HOME>
" inoremap <silent><expr><C-n> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
" inoremap <silent><expr><C-p> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
inoremap <silent><expr><C-b> pumvisible() ? "\<C-y>\<Left>" : "\<Left>"
inoremap <silent><expr><C-f> pumvisible() ? "\<C-y>\<Right>" : "\<Right>"
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
inoremap <C-d> <Del>
cnoremap <expr><C-d> len(getcmdline()) == getcmdpos()-1 ? "\<C-d>" : "\<Del>"
" Emacsライク<C-k> http//vim.g.hatena.ne.jp/tyru/20100116
inoremap <silent><expr><C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" クリップボードから貼り付け
cnoremap <C-y> <C-r>+
" キャンセル
cnoremap <C-g> <C-u><BS>
"バッファ切り替え
nnoremap <silent><C-n>   :<C-u>bnext<CR>
nnoremap <silent><C-p>   :<C-u>bprevious<CR>
"<BS>の挙動
nnoremap <BS> diw

nnoremap          [tab]  <nop>
nmap     <Space>t [tab]
nnoremap <silent> [tab]l    :<C-u>tabnext<CR>
nnoremap <silent> [tab]h    :<C-u>tabprevious<CR>
nnoremap <silent> [tab]e    :<C-u>tabedit<CR>
nnoremap <silent> [tab]c    :<C-u>tabclose<CR>
nnoremap <silent> [tab]o    :<C-u>tabonly<CR>
nnoremap <silent> [tab]s    :<C-u>tabs<CR>

nnoremap            [cscope] <nop>
nmap     <Space>cs  [cscope]
" シンボルを検索
nnoremap <silent>[cscope]s :<C-u>cs find s <C-R>=expand("<cword>")<CR><CR>
" 定義を検索
nnoremap <silent>[cscope]g :<C-u>cs find g <C-R>+ <CR>
" この関数から呼ばれる関数を検索
nnoremap <silent>[cscope]d :<C-u>cs find d <C-R>=expand("<cword>")<CR><CR>
" この関数を読んでいる関数を検索
nnoremap <silent>[cscope]c :<C-u>cs find c <C-R>=expand("<cword>")<CR><CR>
" 文字列を検索
nnoremap <silent>[cscope]t :<C-u>cs find t <C-R>=expand("<cword>")<CR><CR>
" egrepパターンを検索
nnoremap <silent>[cscope]e :<C-u>cs find e <C-R>=expand("<cword>")<CR><CR>
" このファイルを検索
nnoremap <silent>[cscope]f :<C-u>cs find f <C-R>=expand("<cfile>")<CR><CR>
" このファイルをincludeしているファイルを検索
nnoremap <silent>[cscope]i :<C-u>cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

if ! empty(neobundle#get('ctrlp.vim'))
    nnoremap              [ctrlp]  <nop>
    nmap     <Space><C-p> [ctrlp]
    nnoremap <silent> [ctrlp]<C-p>    :<C-u>CtrlP<CR>
    nnoremap <silent> [ctrlp]<C-b>    :<C-u>CtrlPBuffer<CR>
    nnoremap <silent> [ctrlp]<C-m>    :<C-u>CtrlPMRU<CR>
    nnoremap <silent> [ctrlp]<C-r>    :<C-u>CtrlPRoot<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SourceIfExist(path)
    " echo a:path
    if filereadable(a:path)
        execute 'source' a:path
    endif
endfunction

function! VimPath2CincludePath(path)
    let cpath = a:path
    let cpath = substitute(cpath, ",", " -I ", "g")
    let cpath = substitute(cpath, "\\", "", "g")
    let cpath = substitute(cpath, "^.", "", "")
    return cpath
endfunction

function! UpdatePath()
    let s:cpath = VimPath2CincludePath(&path)
    let s:copt = '-std=c99 ' . s:cpath
    let s:cppopt = '-std=c++11 ' . s:cpath
    let s:strict_copt = '-Wall -Wextra ' . s:copt
    let s:strict_cppopt = '-Wall -Wextra ' . s:cppopt

    if ! empty(neobundle#get('syntastic'))
        let g:syntastic_c_compiler_options   = s:strict_copt
        let g:syntastic_cpp_compiler_options = s:strict_cppopt
    endif

    if ! empty(neobundle#get('neocomplete.vim'))
        let g:neocomplete#sources#include#paths = {
                \ 'cpp' :   &path,
                \ 'c'   :   &path,
                \ }
    endif

    if ! empty(neobundle#get('clang_complete'))
        let g:clang_user_options = s:strict_cppopt
    endif

    if ! empty(neobundle#get('vim-quickrun'))
        let g:quickrun_config.c = {
                    \ 'command' : 'gcc',
                    \ 'cmdopt' : s:copt . ' -O2',
                    \ 'tempfile': '%{tempname()}.c',
                    \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
                    \ 'hook/quickrunex/enable' : 1,
                    \ 'hook/sweep/files': '%S:p:r',
                    \ 'hook/add_include_option/enable' : 1,
                    \ }
        let g:quickrun_config.cpp = {
                    \ 'command' : 'g++',
                    \ 'cmdopt' : s:cppopt . ' -O2',
                    \ 'tempfile': '%{tempname()}.cpp',
                    \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
                    \ 'hook/quickrunex/enable' : 1,
                    \ 'hook/sweep/files': '%S:p:r',
                    \ 'hook/add_include_option/enable' : 1,
                    \ }
    endif
endfunction

function! s:InitCmdWin()
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

if has('win32') || has('win64')
	function! QfMakeConv()
	   let qflist = getqflist()
	   for i in qflist
	      let i.text = iconv(i.text, "sjis", "utf-8")
	   endfor
	   call setqflist(qflist)
	endfunction
	Autocmd QuickfixCmdPost make call QfMakeConv()
endif

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

function! ToggleNumberOption2()
    if &number
        set nonumber
    else
        set number
    endif
endfunction

function! ToggleNumberOption()
    if version < 703
        echo 'relativenumber not supported'
        return
    else
        if &relativenumber
          set norelativenumber
        else
          set relativenumber
        endif
    endif
endfunction


function! s:is_git_dir()
    return system('git rev-parse --is-inside-work-tree') ==# "true\n"
endfunction

" git のルートディレクトリを返す
function! GitRootDir()
    if(<SID>is_git_dir())
        let gitdir = system('git rev-parse --show-toplevel')
        let l:gitdir= substitute(l:gitdir, '\r\n', '', 'g')
        let l:gitdir= substitute(l:gitdir, '\n', '', 'g')
        return l:gitdir
    else
        echoerr 'current directory is outside git working tree'
    endif
endfunction


" git のルートディレクトリを返す
" function! s:GitRootDir()
"     if(system('git rev-parse --is-inside-work-tree') ==# "true\n")
"         let gitdir = system('git rev-parse --show-toplevel')
"         let l:gitdir= substitute(l:gitdir, '\r\n', '', 'g')
"         let l:gitdir= substitute(l:gitdir, '\n', '', 'g')
"         return l:gitdir
"     else
"         echoerr 'current directory is outside git working tree'
"     endif
" endfunction

function! s:add_permission_x()
    let file = expand('%:p')
    if getline(1) =~# '^#!' && !executable(file)
        silent! call vimproc#system('chmod a+x ' . shellescape(file))
    endif
endfunction

function! s:copy_current_path()
    if has('win32') || has('win64')
        let c = substitute(expand('%:p'), '\\/', '\\', 'g')
    elseif has('unix')
        let c = expand('%:p')
    endif

    if &clipboard ==# 'plus$'
        let @+ = c
    else
        let @* = c
    endif
endfunction

function! s:smart_help(args)
    try
        if winwidth(0) > winheight(0) * 2
            " 縦分割
            execute 'vertical topleft help ' . a:args
        else
            execute 'aboveleft help ' . a:args
        endif
    catch /^Vim\%((\a\+)\)\=:E149/
        echohl ErrorMsg
        echomsg "E149: Sorry, no help for " . a:args
        echohl None
    endtry
    if &buftype ==# 'help'
        " 横幅を確保できないときはタブで開く
        if winwidth(0) < 80
            execute 'quit'
            execute 'tab help ' . a:args
        endif
        silent! AdjustWindowWidth --direction=shrink
    endif
endfunction

" バッファを削除
function! s:delete_current_buf()
    let bufnr = bufnr('%')
    bnext
    if bufnr == bufnr('%') | enew | endif
    silent! bdelete #
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
" カーソル下のハイライトグループを取得
command! -nargs=0 GetHighlightingGroup
            \ echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '>trans<'
            \ . synIDattr(synID(line('.'),col('.'),0),'name') . '>lo<'
            \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
command! Date :call setline('.', getline('.') . strftime('%Y/%m/%d (%a) %H:%M'))
command! CopyCurrentPath :call s:copy_current_path()
" 縦幅と横幅を見て help の開き方を決める
command! -nargs=* -complete=help SmartHelp call <SID>smart_help(<q-args>)
" 文字数カウント
command! -nargs=0 Wc %s/.//nge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO_COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc augroup
" *.md で読み込む filetype を変更（デフォルトは modula2）
function! s:markdown_settings()
    nnoremap <buffer><Space>tt :<C-u>VoomToggle markdown<CR>
    let g:voom_tree_placement = "top"
    let g:voom_tree_height = 10
    setlocal ft=markdown
endfunction
Autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd,*.txt call <SID>markdown_settings()
" Autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd,*.txt setlocal ft=markdown
" tmux
Autocmd BufRead,BufNew,BufNewFile *tmux.conf setlocal ft=tmux
" git config file
Autocmd BufRead,BufNew,BufNewFile gitconfig setlocal ft=gitconfig
" Gnuplot のファイルタイプを設定
Autocmd BufRead,BufNew,BufNewFile *.plt,*.plot,*.gnuplot setlocal ft=gnuplot
" Ruby の guard 用ファイル
Autocmd BufRead,BufNew,BufNewFile Guardfile setlocal ft=ruby
" JSON
Autocmd BufRead,BufNew,BufNewFile *.json,*.jsonp setlocal ft=json
" jade
Autocmd BufRead,BufNew,BufNewFile *.jade setlocal ft=jade
" Go
Autocmd BufRead,BufNew,BufNewFile *.go setlocal ft=go
" vimspec
Autocmd BufRead,BufNew,BufNewFile *.vimspec setlocal ft=vim.vimspec
" neosnippet
Autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=snippet
" 前回終了したカーソル行に移動
Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" 折りたたみの時のmkview loadviewを自動化する
Autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
Autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" 保存時に行末の空白を除去する
Autocmd BufWritePre * :%s/\s\+$//ge
Autocmd CmdwinEnter * map <buffer> <S-CR> <CR>q:
Autocmd BufRead,BufNewFile *.dis set filetype=cmix
Autocmd Syntax mixed so ~/.vim/syntax/cmix.vim
Autocmd WinEnter,BufRead * set cursorline
Autocmd WinLeave * set nocursorline
Autocmd CmdwinEnter * call s:InitCmdWin()
" git commit message のときは折りたたまない(diff で中途半端な折りたたみになりがち)
" git commit message のときはスペルをチェックする
AutocmdFT gitcommit setlocal nofoldenable spell | set fileencoding=utf-8
AutocmdFT diff setlocal nofoldenable
AutocmdFT c   setlocal omnifunc=ccomplete#Complete
AutocmdFT cpp setlocal omnifunc=ccomplete#Complete
AutocmdFT ps1 setlocal omnifunc=poshcomplete#CompleteCommand


" スクリプトに実行可能属性を自動で付ける
if executable('chmod')
    Autocmd BufWritePost * call s:add_permission_x()

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! empty(neobundle#get('unite.vim'))
    " uniteの説明については以下リンク先が詳しい。
    " http://komaken.me/blog/2014/05/07/%E3%81%84%E3%81%A4%E3%81%BE%E3%81%A7%E3%81%9F%E3%81%A3%E3%81%A6%E3%82%82unite-vim%E3%81%8C%E4%BD%BF%E3%81%84%E3%81%93%E3%81%AA%E3%81%9B%E3%81%AA%E3%81%84%E3%81%AE%E3%81%A7%E3%80%81%E3%81%95%E3%81%99/
    let g:unite_enable_start_insert=0
    let g:unite_enable_split_vertically=1
    let g:unit_file_mru_limit=1000
    let g:unite_kind_file_use_trashbox = 1

    call unite#custom_default_action('find' , 'vimfiler')
    call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
    call unite#custom_default_action('vimshell/history' , 'insert')
    call unite#custom_default_action('vimshell/external_history' , 'insert')

    nnoremap         [unite]  <nop>
    nmap    <Space>u [unite]

    " コマンドラインウィンドウで Unite コマンドを入力
    nnoremap [unite]u               :<C-u>Unite source<CR>
    " バッファを開いた時のパスを起点としたファイル検索
    nnoremap <silent>[unite]f       :<C-u>UniteWithBufferDir -buffer-name=files -vertical file directory file/new<CR>
    " 指定したディレクトリ以下を再帰的に開く
    nnoremap <silent>[unite]F       :<C-u>UniteWithBufferDir -no-start-insert file_rec/async -auto-resize<CR>
    " 最近使用したファイル
    nnoremap <silent>[unite]m       :<C-u>Unite file_mru directory_mru file/new<CR>
    " バッファ一覧
    nnoremap <silent>[unite]b       :<C-u>Unite -immediately -no-empty -auto-preview buffer<CR>
    " プログラミングにおけるアウトラインの表示
    " nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview -no-quit<CR>
    nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview<CR>
    " コマンドの出力
    nnoremap <silent>[unite]O       :<C-u>Unite output<CR>
    nnoremap <silent>[unite]c       :<C-u>Unite codic<CR>
    " grep検索．
    nnoremap <silent>[unite]g       :<C-u>Unite -no-start-insert grep -auto-preview<CR>
    " Git のルートディレクトリを開く
    nnoremap <silent><expr>[unite]G  ":\<C-u>Unite file -input=".fnamemodify(GitRootDir(),":p")
    " Uniteバッファの復元
    nnoremap <silent>[unite]r       :<C-u>UniteResume<CR>
    " Unite ソース一覧
    nnoremap <silent>[unite]s       :<C-u>Unite source -vertical<CR>
    " ブックマーク
    noremap <silent>[unite]B        :<C-u>Unite bookmark<CR>
    " レジスタ
    noremap <silent>[unite]R        :<C-u>Unite -buffer-name=register register<CR>
    " help(項目が多いので，検索語を入力してから絞り込む)
    nnoremap <silent>[unite]hh      :<C-u>UniteWithInput help -vertical<CR>
    " 履歴
    nnoremap <silent>[unite]hc      :<C-u>Unite -buffer-name=lines history/command -start-insert<CR>
    nnoremap <silent>[unite]hs      :<C-u>Unite -buffer-name=lines history/search<CR>
    nnoremap <silent>[unite]hy      :<C-u>Unite -buffer-name=lines history/yank<CR>


    " unite-lines ファイル内インクリメンタル検索
    nnoremap <silent><expr> [unite]L line('$') > 5000 ?
                \ ":\<C-u>Unite -no-split -start-insert -auto-preview line/fast\<CR>" :
                \ ":\<C-u>Unite -start-insert -auto-preview line:all\<CR>"
    " カラースキーム
    nnoremap [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
    " 検索
    nnoremap <silent>[unite]/ :<C-u>execute 'Unite grep:'.expand('%:p').' -input='.escape(substitute(@/, '^\\v', '', ''), ' \')<CR>

    " エンターの代わりに以下のキーでウィンドウを水平分割して開く
    AutocmdFT unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    AutocmdFT unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    " エンターの代わりに以下のキーでウィンドウを垂直分割して開く
    AutocmdFT unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
    AutocmdFT unite inoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
endif

"@============================================================
	" " Note: This option must set it in .vimrc(_vimrc).
	" " NOT IN .gvimrc(_gvimrc)!
	" " Disable AutoComplPop.
	" let g:acp_enableAtStartup = 0
	" " Use neocomplete.
	" let g:neocomplete#enable_at_startup = 1
	" " Use smartcase.
	" let g:neocomplete#enable_smart_case = 1
	" " Set minimum syntax keyword length.
	" let g:neocomplete#sources#syntax#min_keyword_length = 3
	" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" " Define dictionary.
	" let g:neocomplete#sources#dictionary#dictionaries = {
	"     \ 'default' : '',
	"     \ 'vimshell' : $HOME.'/.vimshell_hist',
	"     \ 'scheme' : $HOME.'/.gosh_completions'
	"     \ }

	" " Define keyword.
	" if !exists('g:neocomplete#keyword_patterns')
	"     let g:neocomplete#keyword_patterns = {}
	" endif
	" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" " Plugin key-mappings.
	" inoremap <expr><C-g>     neocomplete#undo_completion()
	" inoremap <expr><C-l>     neocomplete#complete_common_string()

	" " Recommended key-mappings.
	" " <CR>: close popup and save indent.
	" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	" function! s:my_cr_function()
	"   return neocomplete#close_popup() . "\<CR>"
	"   " For no inserting <CR> key.
	"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	" endfunction
	" " <TAB>: completion.
	" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" " <C-h>, <BS>: close popup and delete backword char.
	" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" inoremap <expr><C-y>  neocomplete#close_popup()
	" inoremap <expr><C-e>  neocomplete#cancel_popup()
	" " Close popup by <Space>.
	" "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" " For cursor moving in insert mode(Not recommended)
	" "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	" "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	" "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	" "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" " Or set this.
	" "let g:neocomplete#enable_cursor_hold_i = 1
	" " Or set this.
	" "let g:neocomplete#enable_insert_char_pre = 1

	" " AutoComplPop like behavior.
	" "let g:neocomplete#enable_auto_select = 1

	" " Shell like behavior(not recommended).
	" "set completeopt+=longest
	" "let g:neocomplete#enable_auto_select = 1
	" "let g:neocomplete#disable_auto_complete = 1
	" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
	" " \ neocomplete#start_manual_complete()

	" " Enable omni completion.
	" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" " Enable heavy omni completion.
	" if !exists('g:neocomplete#sources#omni#input_patterns')
	"   let g:neocomplete#sources#omni#input_patterns = {}
	" endif
	" if !exists('g:neocomplete#force_omni_input_patterns')
	"   let g:neocomplete#force_omni_input_patterns = {}
	" endif
	" "let g:neocomplete#sources#omni#input_patterns.php =
	" "\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
	" "let g:neocomplete#sources#omni#input_patterns.c =
	" "\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
	" "let g:neocomplete#sources#omni#input_patterns.cpp =
	" "\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" " For perlomni.vim setting.
	" " https://github.com/c9s/perlomni.vim
	" let g:neocomplete#sources#omni#input_patterns.perl =
	" \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" " For smart TAB completion.
	" "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	" "        \ <SID>check_back_space() ? "\<TAB>" :
	" "        \ neocomplete#start_manual_complete()
	" "  function! s:check_back_space() "{{{
	" "    let col = col('.') - 1
	" "    return !col || getline('.')[col - 1]  =~ '\s'
	" "  endfunction"}}}

	" " " Note: This option must set it in .vimrc(_vimrc).
	" " " NOT IN .gvimrc(_gvimrc)!
	" " " Disable AutoComplPop.
	" " let g:acp_enableAtStartup = 0
	" " " Use neocomplete.
	" " let g:neocomplete#enable_at_startup = 1
	" " " Use smartcase.
	" " let g:neocomplete#enable_smart_case = 1
	" " " Set minimum syntax keyword length.
	" " let g:neocomplete#sources#syntax#min_keyword_length = 3
	" " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" " " Define dictionary.
	" " let g:neocomplete#sources#dictionary#dictionaries = {
	" "     \ 'default' : '',
	" "     \ 'vimshell' : $HOME.'/.vimshell_hist',
	" "     \ 'scheme' : $HOME.'/.gosh_completions'
	" "     \ }

	" " " Define keyword.
	" " if !exists('g:neocomplete#keyword_patterns')
	" "     let g:neocomplete#keyword_patterns = {}
	" " endif
	" " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" " " Plugin key-mappings.
	" " inoremap <expr><C-g>     neocomplete#undo_completion()
	" " inoremap <expr><C-l>     neocomplete#complete_common_string()

	" " " Recommended key-mappings.
	" " " <CR>: close popup and save indent.
	" " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	" " function! s:my_cr_function()
	" "   return neocomplete#close_popup() . "\<CR>"
	" "   " For no inserting <CR> key.
	" "   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	" " endfunction
	" " " <TAB>: completion.
	" " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" " " <C-h>, <BS>: close popup and delete backword char.
	" " inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	" " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" " inoremap <expr><C-y>  neocomplete#close_popup()
	" " inoremap <expr><C-e>  neocomplete#cancel_popup()
	" " " Close popup by <Space>.
	" " "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" " " For cursor moving in insert mode(Not recommended)
	" " "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	" " "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	" " "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	" " "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" " " Or set this.
	" " "let g:neocomplete#enable_cursor_hold_i = 1
	" " " Or set this.
	" " "let g:neocomplete#enable_insert_char_pre = 1

	" " " AutoComplPop like behavior.
	" " "let g:neocomplete#enable_auto_select = 1

	" " " Shell like behavior(not recommended).
	" " "set completeopt+=longest
	" " "let g:neocomplete#enable_auto_select = 1
	" " "let g:neocomplete#disable_auto_complete = 1
	" " "inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
	" " " \ neocomplete#start_manual_complete()

	" " " Enable omni completion.
	" " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	" " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	" " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	" " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	" " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" " " Enable heavy omni completion.
	" " if !exists('g:neocomplete#sources#omni#input_patterns')
	" "   let g:neocomplete#sources#omni#input_patterns = {}
	" " endif
	" " if !exists('g:neocomplete#force_omni_input_patterns')
	" "   let g:neocomplete#force_omni_input_patterns = {}
	" " endif
	" " "let g:neocomplete#sources#omni#input_patterns.php =
	" " "\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
	" " "let g:neocomplete#sources#omni#input_patterns.c =
	" " "\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
	" " "let g:neocomplete#sources#omni#input_patterns.cpp =
	" " "\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" " " For perlomni.vim setting.
	" " " https://github.com/c9s/perlomni.vim
	" " let g:neocomplete#sources#omni#input_patterns.perl =
	" " \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" " " For smart TAB completion.
	" " "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	" " "        \ <SID>check_back_space() ? "\<TAB>" :
	" " "        \ neocomplete#start_manual_complete()
	" " "  function! s:check_back_space() "{{{
	" " "    let col = col('.') - 1
	" " "    return !col || getline('.')[col - 1]  =~ '\s'
	" " "  endfunction"}}}
"@============================================================
if ! empty(neobundle#get('neocomplete.vim'))

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    ""前回行われた補完をキャンセルする
	"inoremap <expr><C-g>     neocomplete#undo_completion()
    ""現在選択している候補をキャンセルし、ポップアップを閉じる
	inoremap <expr><C-g>  neocomplete#cancel_popup()
    "補完候補のなかから、共通する部分を補完する
	inoremap <expr><C-l>     neocomplete#complete_common_string()
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    "現在選択している候補を確定する
	inoremap <expr><C-y>  neocomplete#close_popup()
    ""現在選択している候補をキャンセルし、ポップアップを閉じる
	"inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
	inoremap <expr><Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"

	" Enable omni completion.
	AutocmdFT css setlocal omnifunc=csscomplete#CompleteCSS
	AutocmdFT html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	AutocmdFT javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	AutocmdFT python setlocal omnifunc=pythoncomplete#Complete
	AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags
    AutocmdFT c setlocal omnifunc=ccomplete#Complete

    "AutoComplPopを無効にする
    let g:acp_enableAtStartup = 0
    "vim起動時に有効化
    let g:neocomplete#enable_at_startup = 1
    "smart_caseを有効にする．大文字が入力されるまで大文字小文字の区別をなくす
    let g:neocomplete#enable_smart_case = 1
    " あいまいな候補一致
    let g:neocomplete#enable_fuzzy_completion = 1
    " デリミタ（autoload 関数の # など）の自動挿入
    let g:neocomplete#enable_auto_delimiter = 1
    "シンタックスをキャッシュするときの最小文字長を4に
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    "補完を開始する入力文字長
    let g:neocomplete#auto_completion_start_length = 2
    " これを設定していると、曖昧補間が効かなくなってしまった。
	" let g:neocomplete#enable_cursor_hold_i = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
    "日本語を収集しないようにする
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    "リスト表示
    let g:neocomplete#max_list = 2000
    " 辞書定義
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : expand('~/.vimshell/command-history'),
                \ }
    "区切り文字パターンの定義
    if !exists('g:neocomplete#delimiter_patterns')
        let g:neocomplete#delimiter_patterns = {}
    endif
    let g:neocomplete#delimiter_patterns.vim = ['#']
    let g:neocomplete#delimiter_patterns.cpp = ['::']
    let g:neocomplete#sources#include#patterns = {
        \ 'cpp' : '^\s*#\s*include',
        \ 'c' : '^\s*#\s*include',
        \ }

    let g:neocomplete#filename_include#exts = {}
    let g:neocomplete#filename_include#exts.cpp = ['', 'h', 'hpp', 'hxx']

    " " オムニ補完を実行するパターン
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_overwrite_completefunc = 1
    let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

    call neocomplete#custom#source('file', 'rank', 10)
    " 使用する補完の種類を減らす
    " 現在のSourceの取得は `:echo keys(neocomplete#variables#get_sources())`
    " デフォルト: ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'include', 'tag', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'include', 'omni', 'vim', 'buffer']
    "   \ }

    " neocomplete 補完用関数
    let g:neocomplete#sources#vim#complete_functions = {
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' : 'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' : 'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' : 'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \}
endif


if ! empty(neobundle#get('clang_complete'))
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 1

    if has('win32') || has('win64')
        let g:clang_library_path = "C:/clang/bin"
    else
        let g:clang_library_path = '/usr/lib'
    endif

    " let g:clang_user_options      = '-std=c++11'
    " let g:clang_auto_user_options ='path, .clang_complete'
    let g:clang_auto_user_options =''
    let g:clang_snippets = 1
    let g:clang_snippets_engine = 'clang_complete'
    let g:clang_trailing_placeholder = 1
    let g:clang_use_snipmate = 0
    let g:clang_hl_errors = 1
    let g:clang_jumpto_declaration_key = ""
    let g:clang_complete_copen=1
endif


if ! empty(neobundle#get('jedi-vim'))
    let g:jedi#force_py_version = 3
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#completions_enabled = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#show_call_signatures = "1"
    " let g:jedi#goto_assignments_command = "<leader>g"
    " let g:jedi#goto_definitions_command = "<leader>d"
    " let g:jedi#documentation_command = "K"
    " let g:jedi#usages_command = "<leader>n"
    " let g:jedi#completions_command = "<C-Space>"
    " let g:jedi#rename_command = "<leader>r"
    let g:jedi#goto_assignments_command = ''
    let g:jedi#goto_definitions_command = ''
    let g:jedi#documentation_command = ''
    let g:jedi#usages_command = ''
    let g:jedi#completions_command = ''
    let g:jedi#rename_command = ''

    " let g:jedi#completions_command = '<leader>j'
    " let g:jedi#auto_initialization = 0
    " let g:jedi#auto_vim_configuration = 0
    " let g:jedi#popup_select_first = 0
    " let g:jedi#documentation_command = ''
    " let g:jedi#force_py_version = 3
    " let g:jedi#show_call_signatures = 2
    nnoremap            [jedi] <nop>
    nmap     <Space>j   [jedi]

    function! s:jedi_settings()
        nnoremap <buffer>[jedi]r :<C-u>call jedi#rename()<CR>
        nnoremap <buffer>[jedi]g :<C-u>call jedi#goto_assignments()<CR>
        nnoremap <buffer>[jedi]d :<C-u>call jedi#goto_definitions()<CR>
        nnoremap <buffer>[jedi]k :<C-u>call jedi#show_documentation()<CR>
        nnoremap <buffer>[jedi]u :<C-u>call jedi#usages()<CR>
        nnoremap <buffer>[jedi]i :<C-u>Pyimport<Space>
        setlocal omnifunc=jedi#completions
        setlocal completeopt-=preview
        command! -nargs=0 JediRename call jedi#rename()
    endfunction
    AutocmdFT python call <SID>jedi_settings()
endif

if ! empty(neobundle#get('vimfiler.vim'))
    " [vimfilerメモ]
    " VimFilerでvimfilerバッファを作成する。他にvimfilerバッファが存在していれば、流用される。
    " 複数vimfilerバッファを作成したい場合はVimFilerCreateを使用する。
    nnoremap            [vimfiler] <nop>
    nmap     <Space>f   [vimfiler]
    " vimfilerバッファを生成する。すでに存在していればそのバッファを開く。
    nnoremap [vimfiler]f        :<C-u>VimFiler<CR>
    " 新しいvimfilerバッファ生成する。
    nnoremap [vimfiler]C        :<C-u>VimFilerCreate<CR>
    " vimfilerバッファをカレントディレクトリで開く。
    nnoremap [vimfiler]c        :<C-u>VimFilerCurrentDir<CR>
    " vimfilerバッファをカレントバッファで開く。
    nnoremap [vimfiler]b        :<C-u>VimFilerBufferDir<CR>
    " vimfilerバッファを画面分割で開く。
    nnoremap [vimfiler]s        :<C-u>VimFilerSplit<CR>
    " vimfilerを2画面で開く。
    nnoremap [vimfiler]d        :<C-u>VimFilerDouble<CR>
    " vimfilerをexploler風に開く
    nnoremap [vimfiler]e        :<C-u>VimFilerExplorer<CR>
    " .gitのあるディレクトリを開く。
    nnoremap <silent><expr>[vimfiler]g ":\<C-u>VimFiler " . <SID>GitRootDir() . '\<CR>'
    " .gitのあるディレクトリをexploer風に開く。
    nnoremap <silent><expr>[vimfiler]<S-g> ":\<C-u>VimFilerExplorer " . <SID>GitRootDir() . '\<CR>'

    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimfiler_enable_auto_cd = 0
    let g:vimfiler_preview_action = "preview"
    let g:vimfiler_execute_file_list = {
        \ '_' : 'vim', 'pdf' : 'open', 'mp3' : 'open', 'jpg' : 'open',
        \ 'png' : 'open', }
endif

if ! empty(neobundle#get('neosnippet'))
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)

	" SuperTab like snippets' behavior.
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	 \ "\<Plug>(neosnippet_expand_or_jump)"
	 \: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	 \ "\<Plug>(neosnippet_expand_or_jump)"
	 \: "\<TAB>"

	" For snippet_complete marker.
	if has('conceal')
	  set conceallevel=2 concealcursor=i
	endif

    let g:neosnippet#snippets_directory='~/.neosnippets'
    let g:neocomplete#snippets_dir='~/.neosnippets'
    " Works like g:neocomplete#snippets_disable_runtime_snippets
    " which disables all runtime snippets
    let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }
endif

    let g:vim_markdown_liquid=1
    let g:vim_markdown_frontmatter=1
    let g:vim_markdown_math=1
    let g:vim_markdown_codeblock_syntax=1
if ! empty(neobundle#get('vim-markdown'))
endif


if ! empty(neobundle#get('ctrlp.vim'))
    let g:ctrlp_map = ''
    let g:ctrlp_use_migemo          = 1
    let g:ctrlp_use_caching         = 1
    let g:ctrlp_lazy_update         = 0
    let g:ctrlp_show_hidden         = 1
    let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
    let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|neocon|neocomplcache|neocomplete|cache)$',
        \ 'file': '\v\.(mp3|mp4|bmp|jpg|png|pdf|zip|m4a|pkg|gz|'.
        \               'o|obj|a|exe|dll|so|swp|ttf|mov|avi|dmg|rar|xls|mobi)$',
        \ }
endif

if ! empty(neobundle#get('clever-f.vim'))
    " 大文字を入力した時だけ大文字小文字を区別する、しない
    let g:clever_f_smart_case = 1
    " migemoを使用する、しない
    let g:clever_f_use_migemo = 1
    " 行をまたいでf検索をする、しない
    let g:clever_f_across_no_line = 0
    " fで順方向、Fで逆方向に移動方向を固定する、しない
    let g:clever_f_fix_key_direction = 1
    " 任意の記号にマッチする文字を指定する。
    let g:clever_f_chars_match_any_signs = ';'
endif

if ! empty(neobundle#get('vim-easymotion'))
    " =======================================
    " Boost your productivity with EasyMotion
    " =======================================
    " Disable default mappings
    " If you are true vimmer, you should explicitly map keys by yourself.
    " Do not rely on default bidings.
    let g:EasyMotion_do_mapping = 0

    " Or map prefix key at least(Default: <Leader><Leader>)
    " map <Leader> <Plug>(easymotion-prefix)

    " =======================================
    " Find Motions
    " =======================================
    " Jump to anywhere you want by just `4` or `3` key strokes without thinking!
    " `s{char}{char}{target}`
    nmap s <Plug>(easymotion-s2)
    xmap s <Plug>(easymotion-s2)
    omap z <Plug>(easymotion-s2)

    " Turn on case sensitive feature
    let g:EasyMotion_smartcase = 1

    " " =======================================
    " " Line Motions
    " " =======================================
    " " `JK` Motions: Extend line motions
    " map <Leader>j <Plug>(easymotion-j)
    " map <Leader>k <Plug>(easymotion-k)
    " " keep cursor column with `JK` motions
    " let g:EasyMotion_startofline = 0

    " =======================================
    " General Configuration
    " =======================================
    let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
    " Show target key with upper case to improve readability
    let g:EasyMotion_use_upper = 1
    " Jump to first match with enter & space
    let g:EasyMotion_enter_jump_first = 1
    let g:EasyMotion_space_jump_first = 1

    " =======================================
    " Search Motions
    " =======================================
    " Extend search motions with vital-over command line interface
    " Incremental highlight of all the matches
    " Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
    " `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
    " :h easymotion-command-line
    nmap g/ <Plug>(easymotion-sn)
    xmap g/ <Plug>(easymotion-sn)
    omap g/ <Plug>(easymotion-tn)
endif

if ! empty(neobundle#get('syntastic'))
    let g:syntastic_debug = 0
    "let g:syntastic_aggregate_errors = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_enable_signs=1
    let g:syntastic_enable_highlighting = 1
    let g:syntastic_error_symbol = 'E>'
    let g:syntastic_warning_symbol = 'W>'
    let g:syntastic_enable_balloons = 1
    let g:syntastic_auto_jump = 1
    let g:syntastic_echo_current_error = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_loc_list_height = 5
    let g:syntastic_c_compiler = "gcc"
    let g:syntastic_c_check_header = 1
    let g:syntastic_cpp_compiler = "g++"
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_python_python_exe = 'python3'
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_args = '--ignore="E221"'
    " 明示的にSyntasticCheckを呼び出した時だけ構文チェックを行う。
    let g:syntastic_mode_map = { 'mode': 'passive' }

    nnoremap         [syntastic]  <nop>
    nmap    <Space>s [syntastic]
    noremap <silent>[syntastic]s :<C-u>SyntasticCheck<CR>
    noremap <silent>[syntastic]r :<C-u>SyntasticReset<CR>
    noremap <silent>[syntastic]i :<C-u>SyntasticInfo<CR>
endif

if ! empty(neobundle#get('vim-quickrun'))
    "<Leader>r を使わない
    let g:quickrun_no_default_key_mappings = 1
    " quickrun_configの初期化
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    " "QuickRun 結果の開き方
    let g:quickrun_config._ = {
                \ 'outputter' : 'unite_quickfix',
                \ 'split' : 'rightbelow 10sp',
                \ 'hook/hier_update/enable' : 1,
                \ 'runner/vimproc/updatetime' : 500,
                \ }

    let g:quickrun_config['cpp/preprocess/g++'] = { 'type' : 'cpp/g++', 'exec' : '%c -P -E %s' }
    let g:quickrun_config['cpp/preprocess'] = { 'type' : 'cpp', 'exec' : '%c -P -E %s' }
    let g:quickrun_config['c/preprocess'] = { 'type' : 'c', 'exec' : '%c -P -E %s' }

    "outputter
    let g:quickrun_unite_quickfix_outputter_unite_context = { 'no_empty' : 1 }
    " runner vimproc における polling 間隔
    let g:quickrun_config['_']['runner/vimproc/updatetime'] = 500

    " tmux
    let g:quickrun_config['tmux'] = {
                \ 'command' : 'tmux',
                \ 'cmdopt' : 'source-file',
                \ 'exec' : ['%c %o %s:p', 'echo "sourced %s"'],
                \ }

    nnoremap [quickrun] <nop>
    nmap     <Space>q [quickrun]
    nnoremap [quickrun]q :<C-u>QuickRun<CR>
    vnoremap [quickrun]q :QuickRun<CR>
    nnoremap [quickrun]r :<C-u>QuickRun<Space>
    AutocmdFT cpp nnoremap <silent><buffer>[quickrun]pp :<C-u>QuickRun -type cpp/preprocess<CR>
    AutocmdFT c nnoremap <silent><buffer>[quickrun]pp :<C-u>QuickRun -type c/preprocess<CR>
endif

if ! empty(neobundle#get('qfixhowm'))
    " QuickFix処理制御
    " 0 : なにもしない
    " 1 : QuickFix/ロケーションリストの両方で有効
    " 2 : ロケーションリストのみ有効
    " 3 : QFixMemo/QFixGrepコマンドで開いた場合のみ有効
    " @note
    " preview機能とかはかなり便利なのだが、プラグインを色々と入れだすと競合して
    " トラブルことが多い。よってqfixhowm機能利用時のみ有効としておく。
    let g:QFixWin_EnableMode = 3
    " QuickFixウィンドウでプレビューを有効にする
    let g:QFix_PreviewEnable = 1
    " QuickFixウィンドウではなくロケーションリストを使用する or しない
    let g:QFix_UseLocationList = 0
    " QuickFixウィンドウの幅
    let g:QFix_Width = 70
    " QuickFixウィンドウの高さ
    let g:QFix_Height = 10
    " プレビューウィンドウの幅
    let g:QFix_PreviewWidth  = 70
    " プレビューウィンドウの高さ(previewheightを使用したくない場合のみ指定)
    let g:QFix_PreviewHeight = 15
    " QuickFixウィンドウの開き方
    " @note botright 最下段に表示
    let g:QFix_CopenCmd = 'botright'
    " プレビューウィンドウの開き方指定
    " @note topleft 最上段に開く
    let g:QFix_PreviewOpenCmd = 'topleft'
    " QuickFixウィンドウでカーソルラインを表示
    let g:QFix_CursorLine = 1
    " QuickFixウィンドウのプレビューでfiletype別のハイライトを有効にする
    let g:QFix_PreviewFtypeHighlight = 1
    " QuickFixウィンドウから開いた後ウィンドウを閉じる or 閉じない
    let g:QFix_CloseOnJump = 0
    " QuickFixウィンドウの <S-CR> は分割ではなくタブで開くには 'tab'に設定する
    let g:QFix_Edit = 'tab'
    " プレビュー対象外ファイルの指定
    let g:QFix_PreviewExclude = ''.
      \'[~#]$\|\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|' .
      \'\.dll$\|\.lnk$\|\.o$\|\.obj$\|\.a$\|\.so$\|\.d$\|tags$\|cscope.out$'
    " プレビュー画面のカーソルラインを表示
    let g:QFix_PreviewCursorLine = 1
    " プレビューウィンドウの折り返し表示
    let g:QFix_PreviewWrap = 1
    " Grepコマンドのキーマップ
    let g:MyGrep_Key  = 'g'
    " Grepコマンドの2ストローク目キーマップ
    let g:MyGrep_KeyB = ','
    " grep対象にしたくないファイル名の正規表現
    let g:MyGrep_ExcludeReg = g:QFix_PreviewExclude

    if has('win32') || has('win64')
        " Windowsでcygwin1.7以降のgrep.exeを使用する場合のみ 1 に設定
        let g:MyGrep_cygwin17 = 1
        "" 使用するgrep(Windows)
        "let mygrepprg = 'findstr'
        let g:mygrepprg = 'grep'
        " 日本語が含まれる場合のgrep指定
        " let myjpgrepprg = 'grep'
        let g:myjpgrepprg = ''
        " 外部grep(shell)のエンコーディング(Windows)
        let g:MyGrep_ShellEncoding = 'cp932'
        " 外部grep(shell)でエンコーディング変換が行われる場合のエンコーディング指定
        " (通常はMyGrep_ShellEncodingと同一のため設定しないでください)
        let g:MyGrep_FileEncoding = ''
    else
        " 使用するgrep(Unix)
        let g:mygrepprg = 'grep'
        " 日本語が含まれる場合のgrep指定
        let g:myjpgrepprg = 'grep'
        " 外部grep(shell)のエンコーディング(Unix)
        let g:MyGrep_ShellEncoding = 'utf-8'
        " 外部grep(shell)でエンコーディング変換が行われる場合のエンコーディング指定
        " (通常はMyGrep_ShellEncodingと同一のため設定しないでください)
        let g:MyGrep_FileEncoding = ''
    endif

    " 検索ディレクトリはカレントディレクトリを基点にする
    " 0 : 現バッファのファイルが存在するディレクトリ
    " 1 : カレントディレクトリ
    let g:MyGrep_CurrentDirMode = 1
    " 検索は常に再帰検索
    let g:MyGrep_RecursiveMode = 0
    " 「だめ文字」対策を有効/無効
    let g:MyGrep_Damemoji = 2
    " 「だめ文字」を置き換える正規表現
    let g:MyGrep_DamemojiReplaceReg = '(..)'
    " 「だめ文字」を自分で追加指定したい場合は正規表現で指定する
    let g:MyGrep_DamemojiReplace = '[]'
    " QFixGrepの検索時にカーソル位置の単語を拾う/拾わない
    let g:MyGrep_DefaultSearchWord = 1
    " grep実行時にエラーメッセージが出たら表示
    let g:MyGrep_error = 1
    " ユーザ定義可能な追加オプション
    " @note
    " -i --ignore-case 大文字小文字の違いを無視する。
    " -n --line-number 行番号を表示する。
    " -I バイナリファイルを無視する。
    " -D skip デバイス、FIFO、ソケット等を無視する。
    let g:MyGrepcmd_useropt = ''.
                \' -i -n -I -D skip' .
                \' --exclude-dir=.git --exclude-dir=.svn --exclude-dir=.hg' .
                \' --exclude-dir=res --exclude-dir=resource' .
                \' --exclude-dir=bin --exclude-dir=lib' .
                \' --exclude-dir=[Dd]oxygen' .
                \' --exclude-dir=[Bb]uild'
    " 異なるエンコーディングのファイルが混在している場合にgrepを複数回実行して、エン
    " コーディングを気にせず日本語検索が可能です。
    " マルチエンコーディングgrepモードの切替は<Leader>rmでも行えます。
    " なお検索文字列に日本語を含まない場合は、一回しかgrepは実行されません。
    " マルチエンコーディングgrepモード
    let g:MyGrep_MultiEncoding = 1
    " マルチエンコーディングgrep エンコーディングリスト
    let g:MyGrep_MultiEncodingList = ['utf-8', 'cp932']

    " QFixHowmとのオプションコンバートを行う or 行わない
    let g:QFixHowm_Convert = 1
    " メモファイルの保存先
    let g:qfixmemo_dir           = '~/Dropbox/qfixmemo'

    let g:qfixmemo_title    = '#'
    " メモファイルのファイル名
    let g:qfixmemo_filename      = '%y%m%d-%H%M%S.mkd'
    " メモファイルのファイルエンコーディング
    let g:qfixmemo_fileencoding  = 'utf-8'
    " メモファイルのファイルフォーマット(改行コード)
    let g:qfixmemo_fileformat    = 'unix'
    " メモのファイルタイプ
    let g:qfixmemo_filetype      = 'markdown'
    " NOTE:
    " メモファイル中に [[キーワード]] のように [[ と ]] でWikiスタイルのキーワードを
    " 作成するとオートリンク化され、キーワード上で<CR>を押すと対応するファイルを開く
    " ことが出来ます。
    " キーワードは保存時に自動作成されますが、全ファイルを検索して再作成が可能です。
    " 不要なキーワードを削除した場合などは再作成してください。
    " <Leader>rk           キーワードファイルを再作成
    "
    " キーワードは以下の正規表現で定義されています。
    " キーワード開始正規表現
    let g:qfixmemo_keyword_pre = '\[\['
    " キーワード終了正規表現
    let g:qfixmemo_keyword_post = '\]\]'
    " NOTE:
    " howmのcome-fromリンクとgotoリンクも定義してあれば使用可能です。
    " howmのリンクパターン
    let g:howm_glink_pattern = '>>>'
    let g:howm_clink_pattern = '<<<'

    " NOTE:
    " キーワード処理は無効化可能です。
    " キーワードを使用しない or する
    let g:qfixmemo_use_keyword = 1

    " MRUの表示数
    let g:QFixMRU_Entries   = 100
    " 最近更新したエントリ一覧の日数
    let g:qfixmemo_RecentDays = 100

    " MRU保存ファイル名
    let g:QFixMRU_Filename  = g:qfixmemo_dir .'/.qfixmru'
    " MRUの基準ディレクトリ
    let g:QFixMRU_RootDir   = g:qfixmemo_dir

    " タイトル行検索の正規表現を初期化
    let g:QFixMRU_Title = {}

    " MRU登録用の正規表現(Vim)を指定
    let g:QFixMRU_Title['mkd'] = '^#[^#]'

    let qfixmemo_timeformat       = '<!-- %Y-%m-%d %H:%M -->'

    " qfixmemo#UpdateTime()でタイムスタンプの置換に使用する正規表現(Vim)
    let qfixmemo_timeformat_regxp = '<!-- \d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2} -->'

    " タイムスタンプ行とみなす正規表現(Vim)
    let qfixmemo_timestamp_regxp  = qfixmemo_timeformat_regxp

    " qfixmemo#AddTitle()で擬似タイトル行とみなす正規表現(Vim)
    let qfixmemo_alt_title_regxp  = ''

    " NOTE:
    " 外部grepと内部で使うVimの正規表現が異なる場合は、更にgrep専用の正規表現を設定
    " 可能です。
    " タイトル行検索の正規表現(grep)を指定
    let g:QFixMRU_Title['mkd_regxp'] = '^#[^#]'

    " QFixMemoを起動しない場合でも終了時にMRUを保存する
    let g:QFixMRU_VimLeaveWrite = 1

    " タイトル行検索正規表現初期化
    let g:QFixMRU_Title = {}

    " タイトル行検索正規表現(Vim)
    let g:QFixMRU_Title['vim'] = '^\s*\(silent!\?\)\?\s*func'
    let g:QFixMRU_Title['java'] = '^\s*public.*(.*).*{'
    let g:QFixMRU_Title['js']   = '^\s*function'
    let g:QFixMRU_Title['py']   = '^def'
    let g:QFixMRU_Title['rb']   = '^\s*def'

    " 8.3 アウトラインオプション                  *qfixmemo_submenu_outline_option*
    " アウトラインといってもfoldmethodとsyntaxを設定しているだけなので、好みに応じて
    " 変更してみてください。
    " 詳しくは|foldmethod|を参照してください。 >
    " アウトライン(foldenable)
    let g:qfixmemo_outline_foldenable = 1
    " アウトライン(foldmethod)
    let g:qfixmemo_outline_foldmethod = 'indent'
    " アウトライン(foldexpr)
    let g:qfixmemo_outline_foldexpr = "getline(v:lnum)=~'^[=.*・]'?'>1':'1'"
    " アウトライン(syntax)
    let g:qfixmemo_outline_syntax = 'ezotl'

    " NOTE:
    " 一ファイル複数エントリの場合、フォールディングを使用すると見やすくなります。
    " <Leader>o           フォールディング切替
    " フォールディングパターンは qfixmemo_folding_pattern で定義され、
    " qfixmemo_foldingが 0 だと qfixmemoのフォールディングは無効化されます。 >
    " デフォルトでは行頭がタイトル記号かどうかで折りたたみます
    let g:qfixmemo_folding         = 1
    let g:qfixmemo_folding_pattern = '^=[^=]'

    " 12.3 保存前処理                                           *qfixmemo_pre_save*
    " 保存前にタイトル行とタイムスタンプの付加とファイル末の空行削除等が行われます。
    " 保存前処理は .vimrc等でオプション設定する事で変更可能です。
    " タイトル行付加
    let g:qfixmemo_use_addtitle        = 1
    " タイムスタンプ付加
    let g:qfixmemo_use_addtime         = 1
    " タイムスタンプアップデート
    let g:qfixmemo_use_updatetime      = 1
    " ファイル末の空行を削除
    let g:qfixmemo_use_deletenulllines = 1
    " キーワードリンク作成
    let g:qfixmemo_use_keyword         = 1
    "予定・TODOのソート優先度
    let QFixHowm_ReminderPriority = {'@' : 1, '!' : 1, '+' : 3, '-' : 4, '~' : 5, '.' : 6}
    ",y で表示される予定・TODOパターン
    let QFixHowm_ListReminder_ScheExt = '[-@+!~]'
    "予定・TODOの検索場所指定
    let g:QFixHowm_ScheduleSearchDir = g:qfixmemo_dir .'/quick'
    let g:QFixHowm_QuickMemoFile = g:QFixHowm_ScheduleSearchDir . '/quick-000000-000000.mkd'

    "予定・TODOの検索ファイル名指定
    let g:QFixHowm_ScheduleSearchFile = ''
endif

let g:markdown_fenced_languages = ['vim', 'qmake', 'python', 'sh', 'c', 'cpp', 'ps1']


if ! empty(neobundle#get('vim-fakeclip'))
    let g:fakeclip_terminal_multiplexer_type="gnuscreen"
endif

if ! empty(neobundle#get('vim-scratch'))
    nnoremap <Space>sc :<C-u>Scratch<CR>
endif

if ! empty(neobundle#get('ZoomWin'))
    nnoremap <C-w>o :<C-u>ZoomWin<CR>
endif

if ! empty(neobundle#get('vinarise'))
    let g:vinarise_enable_auto_detect = 0
endif

if ! empty(neobundle#get('vim-altr'))
    nnoremap <silent><C-w>a :<C-u>call altr#forward()<CR>
    nnoremap <silent><C-w>A :<C-u>call altr#back()<CR>
endif


if ! empty(neobundle#get('vimshell'))
    nnoremap <Space>vs :<C-u>VimShellBufferDir<CR>
    let g:vimshell_interactive_update_time = 0
    " let g:vimshell_interactive_update_time = 2000
endif



if ! empty(neobundle#get('open-browser.vim'))
    nmap <Leader>o <Plug>(openbrowser-smart-search)
    xmap <Leader>o <Plug>(openbrowser-smart-search)
    nnoremap          [openbrowser]  <nop>
    nmap     <Space>o [openbrowser]
    nnoremap [openbrowser]o :<C-u>OpenBrowserSmartSearch<Space>
    nnoremap [openbrowser]w :<C-u>OpenBrowserSearch -weblio<Space>
    nnoremap [openbrowser]O :<C-u>OpenGithubFile<CR>
    vnoremap [openbrowser]O :OpenGithubFile<CR>
    let g:openbrowser_search_engines = {
        \ 'weblio': 'http://ejje.weblio.jp/content/{query}',
    \}
endif


if ! empty(neobundle#get('JpFormat.vim'))
    " 文字数指定を半角/全角単位にする
    " 1:半角
    " 2:全角
    let JpFormatCountMode = 2
    " 原稿(折り返し)全角文字数
    let JpCountChars = 40

    " 原稿行数
    let JpCountLines = 17

    " 禁則処理の最大ぶら下がり字数
    let JpCountOverChars = 1

    " 半角一文字分オーバーしても折り返し処理をする/しない
    let JpFormatHankakuOver = 0

    " 折り返し文字数(原稿用紙文字数)は textwidthから設定する
    let JpCountChars_Use_textwidth = 0

    " 挿入モードで一文字入力する度に自動整形を行う/行わない
    let JpFormatCursorMovedI = 1

    " 整形対象外行の正規表現
    let JpFormatExclude = '^$'

    " 原稿用紙換算計算時に削除するルビ等の正規表現
    let JpCountDeleteReg = '\[.\{-}\]\|<.\{-}>\|《.\{-}》\|［.\{-}］\|｜'

    " 整形コマンドを使用したら自動整形もON
    let JpAutoFormat = 1

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
    let JpAutoJoin = 1

    " gqを使用して整形を行う
    let JpFormatGqMode = 0

    " gqを使用して整形する場合の整形コマンド
    " 空文字列なら現在formatexprに設定しているコマンドが使用される
    let JpFormat_formatexpr = ''
endif

nnoremap <Space>tt :<C-u>TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_map_togglesort = "r"
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 1

" ピンク
hi htmlH1 guifg=#F2D8DF gui=bold
" オレンジ
hi htmlH2 guifg=#EF7585 gui=bold
" 薄いピンク
hi htmlH3 guifg=#EFC1C4 gui=bold
" 黄色
" hi htmlH4 guifg=#FFFF00 gui=bold
hi htmlH4 guifg=#F2D8DF gui=bold
" 薄い青
hi htmlH5 guifg=#00FF00  gui=bold
" 緑
hi htmlH6 guifg=#00FF00 gui=bold

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

colorscheme hybrid
call UpdatePath()
call SourceIfExist($HOME.'/.platform.vimrc')

if(<SID>is_git_dir())
    call SourceIfExist(GitRootDir() . '/.local.vimrc')
endif
