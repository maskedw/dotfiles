" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Note: Vim script Tips
" Vim scriptの日本語情報は非常に少ない。Webで見つかる情報はとりあえずコピペしま
" した的なものも多く、コピペしましたを繰り返していく内に、vimrcは意味不明なもの
" になっていってしまう。全てを理解して設定するのは難しいが、極力理解したいもであ
" る。
"
" # 有用な参考リンク
" 基本的な構文はこの辺をみておけばなんとなくわかるはず。
"   + [vimrc基礎文法最速マスター](http://thinca.hatenablog.com/entry/20100205/1265307642)
"   + [Vimスクリプト基礎文法最速マスター](http://thinca.hatenablog.com/entry/20100201/1265009821)
"   + [モテる男のVim script短期集中講座](http://mattn.kaoriya.net/software/vim/20111202085236.htm)
"   + [Vimの極め方](http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation)
"
" # 分かりづらい文法の参考情報
"   + set <option>&
"   Ref [Vimの極め方].リローダブルなvimrcを書く
"
"   + autocmd!
"   Ref [Vimの極め方].autocmdの定義でありがちなミス
"
"   + キーマップの<silent>, <buffer>, <expr>とか
"   Ref [vimrc基礎文法最速マスター].キーマッピングのオプション
"
"   + mapとnoremap
"   Ref [vimrc基礎文法最速マスター].mapとnoremap
"
"   + foo#bar#baz()みたいな謎記法
"   Ref [モテる男のVim script短期集中講座].autoload
"
"   + let g:, s:, b:とかの謎プレフィックス
"   Ref [vimrc基礎文法最速マスター].スコープ
"
"   + XXXmap :<C-u> xxx の <C-u>ってなに？
"   Ref http://vim-jp.org/vim-users-jp/2009/07/02/Hack-35.html
"
"   + <SID>ってなに？
"   Ref [<SID>とs:の使い分け](http://whileimautomaton.net/2008/06/30070800)
"   mapからスクリプトローカルの関数を呼び出すときには<SID>を指定せなあかん、とい
"   う理解で大体いいんじゃなかろうか。
"
"   + <Plug>ってなに？
"   Ref [【図解Vim】mapとnoremap](http://cocopon.me/blog/?p=3871)
"   <Plug>でキーマップが割り当てられているVimプラグインを使用する時はnoremapでは
"   なく、mapを使用する、と覚えておけばいい。
"
"   + execute xxx
"   executeは引数の文字列をVim scriptのコマンドとして実行する。文字列を返す関数
"   とかで、コマンドを組み立てて実行できる。エスケープ処理なんかもええ感じで勝手
"   におこなってくれるのが嬉しい。
"
"   例えばsetで指定するオプションでは、スペースをバックスラッシュでエスケープす
"   る必要があり、面倒だしわかりづらい。そんなときはexecuteで実行すれば面倒なエ
"   スケープを行わずにすむ。
"   [例]
"   " スペースのエスケープはメンドイ
"   set path+=C:/Program\ Files/Foo\ Bar
"   " executeならエスケープいらず
"   execute "set path+=C:/Program Files/Foo Bar"
"
" # helpを極める
"   helpの分量は異様に充実しているので活用したい。説明をみてもなんのこっちゃわか
"   らんことも多いけど・・・。まあ見ないよりは全然いい。ただ、どんなキーワードで
"   helpを引けばいいのかを見つけるのが結構辛い。
"   [unite-help](https://github.com/tsukkee/unite-help/blob/master/autoload/unite/sources/help.vim)
"   を導入すると、絞り込みで検索ができるのでオススメ。
"
"   厳選した有用キーワード
"   + help keycodes
"     noremapとかで使用できる<CR>等の特殊キー一覧
"   + help expression-commands
"     let コマンドの全パターン
"   + help pattern-atoms
"     正規表現で使えるパターン
"   + help view-diffs
"     diff関連
"
" # スタイルガイド
"   著名なVimプラグイン作者 犬さん(https://github.com/rhysd)のvimrcを参考にした
"
"   command                     => アッパーキャメルケース
"   valiriable, local_function  => スネークケース
"   グローバルなfunctionはVim scriptの仕様として、必ず大文字から始めないといけな
"   いという制限があるのでスネークケースは使用できないことに注意。

" スペルチェック無効
set nospell

" [Windowsで:set encoding=utf-8する方法](http://thinca.hatenablog.com/entry/20090111/1231684962)
let $LANG='ja_JP.UTF-8'
set encoding=utf-8

" Vim scriptの文字エンコーディング
" プラグインの文字エンコーディングはまず間違いなくutf-8。
scriptencoding utf-8

" 言語設定
" vim内のメッセージを英語にする
language message C
" strftime()で使用する言語を英語にする
language time C

" シンタックスハイライト有効
syntax enable

" Python拡張の設定
" Vim scriptは他のスクリプト言語と連携して記述することができる。Ruby, Lua, Perl,
" Python2, 3 etc...と主要なスクリプト言語はなんでも使えるようだ。ただしVimのビル
" ド時に各言語連携のコンフィグを指定してあることが条件。
"
" その中でもPythonを使用しているVimプラグインは多い。Pythonは2系と3系で構文に互
" 換性がない。頑張って書けば両対応にもできるらしいが、Vimプラグインは2か3のどち
" らかにしか対応していないものも多い。
"
" Windowsでお手軽に利用できる [Kaoriya Vim](https://www.kaoriya.net/software/vim/)
" ではPython2, 3を同時に使用することができる(Python2にしか対応していないプラグイ
" ンと、3にしか対応していないプラグインを同時に使用できる)。
"
" しかし、UbuntuのVimは自分でビルドをしても、2,3を同時利用できないという問題があ
" る。[vim-jp Debian系のLinuxでPython 2.xと3.xが同時利用できない問題の原因と対策](https://github.com/vim-jp/issues/issues/301)
" 同時利用ができない、というのは、Vim起動後に初めに使用したPythonのバージョンし
" か使用できないということだ。参考記事を見る限り、今後もこの制限に変わりはなさそ
" う。
"
" どちらかしか使用できないなら、基本的にはPython3を使用したい。プラグインのロー
" ドを行うと、プラグインの実装によって、Python2, 3どちらが先に有効かされるかわか
" らないので、プログインのロード前に、明示的にPythonバージョンを指定しておく。
" Python拡張の有無を確認する has('python') or has('python3)を実行するだけでバー
" ジョンが固定される。
"
" Python2,3両対応しているプラグインはPython2の優先度が高いものが多い。先に
" Python3を有効にしておくと、has('python')はfalseを返すようになるので、そういう
" プラグインもPython3を使ってくれる。
let s:dammy = has('python3')
" let s:dammy = has('python')

if has('win32') || has('win64')
    " Cygwinにバックスラッシュ区切りのWindows形式パス(C:\Users\...)を渡しても警
    " 告を出力しないようにする環境変数の設定
    let $CYGWIN = 'nodosfilewarning'

    " Vim内でのみ追加したいPATH
    let s:add_path = ';C:\msys64\mingw64\bin;C:\msys64\usr\bin'
    " vimrcをリロードしても多重登録されないように初めに除去する
    let $PATH = substitute($PATH, s:add_path, '', 'g')
    let $PATH .= s:add_path
endif

augroup MyVimrc
    autocmd!
augroup END
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
AutocmdFT vim highlight def link myVimAutocmd vimAutocmd
AutocmdFT vim match myVimAutocmd /\<\(Autocmd\|AutocmdFT\)\>/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUNDLE_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! isdirectory(expand('~/vim.d/bundle'))
    " neobundleがインストールされていなければダウンロードする
    echon "Installing neobundle.vim..."
    silent call mkdir(expand('~/vim.d/bundle'), 'p')
    execute '!git clone https://github.com/Shougo/neobundle.vim ' . expand('~/vim.d/bundle/neobundle.vim')
    echo "done."
    if v:shell_error
        echoerr "neobundle.vim installation has failed!"
        finish
    endif
endif

" {{{ @neobundle
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/vim.d/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/vim.d/bundle/'))
call neobundle#load_cache()  " キャッシュの読込み

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin:Shougoシリーズ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" プラグインマネージャ。neobundle自身でneobundleの更新管理もできる。
NeoBundleFetch 'Shougo/neobundle.vim'

" [if_lua でない環境では neocomplcache を使いたい](http://rhysd.hatenablog.com/entry/2013/08/24/223438)
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    " 入力補完エンジン
    NeoBundle 'Shougo/neocomplete.vim'

    " neocomplete vim-complete用source
    NeoBundle 'Shougo/neco-vim'

    " neocomplete file/include用source
    NeoBundle 'Shougo/neoinclude.vim'

    " neocomplete syntax用source
    NeoBundle 'Shougo/neco-syntax'
else
    " neocompleteの旧型
    NeoBundle 'Shougo/neocomplcache.vim'
endif

" snippetエンジン
NeoBundle 'Shougo/neosnippet'

" neosnippet用snippet詰め合わせ
NeoBundle 'Shougo/neosnippet-snippets'

" 汎用選択インターフェース
NeoBundle 'Shougo/unite.vim'

" unite用各種ソース
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'tsukkee/unite-help'
" NeoBundle 'tsukkee/unite-tag'
" NeoBundle 'thinca/vim-unite-history'
" NeoBundle 'osyo-manga/unite-quickfix'
" NeoBundle 'sgur/unite-everything'
" NeoBundle 'rhysd/unite-locate'
" NeoBundle 'rhysd/quickrun-unite-quickfix-outputter'
" NeoBundle 'sorah/unite-ghq'
" NeoBundle 'rhysd/unite-codic.vim'

" unite file_mru用source
NeoBundle 'Shougo/neomru.vim'

" バイナリエディタ
NeoBundle 'Shougo/vinarise'

" 非同期インターフェース
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw64.mak',
    \     'cygwin'  : 'make -f make_cygwin.mak',
    \     'mac'     : 'make -f make_mac.mak',
    \     'unix'    : 'make -f make_unix.mak',
    \    },
    \ }

" ファイラ
NeoBundleLazy 'Shougo/vimfiler.vim', {
    \ 'depends' : 'Shougo/unite.vim',
    \ 'autoload' : {
    \     'commands' : ['VimFiler', 'VimFilerCurrentDir',
    \                   'VimFilerBufferDir', 'VimFilerSplit',
    \                   'VimFilerExplorer', 'VimFilerDouble']
    \     }
    \ }

" Vim内shell
" Shellはやはりzshなりbashなりの専用のものを使った方がトラブルが少ないので使うの
" をやめた。
" NeoBundleLazy 'Shougo/vimshell', {
"     \ 'autoload' : {
"     \     'commands' : ['VimShell', 'VimShellSendString', 'VimShellCurrentDir', 'VimShellInteractive'],
"     \     }
"     \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin:見た目(カラーテーマとかシンタックスハイライトとか)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 愛用しているかっちょいいカラーテーマ
NeoBundle 'w0ng/vim-hybrid'

" GVimのカラースキームをCUI版でも使えるように変換する
NeoBundle 'godlygeek/csapprox'
" NeoBundle 'thinca/vim-guicolorscheme'

" ステータスラインをかっこよくする
" Note:
" vim-airlineを使用していると、数千行あるファイルを開いた時にクソ重くなったの
" でlightlineに乗り換えた。
" NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/lightline.vim'

" インデントレベルを視覚化する
NeoBundle 'Yggdroot/indentLine'

" asciidocシンタックスハイライト
" dahu/vim-asciidocはシンタックスハイライト以外にも多機能だが、色々なプラグイン
" に依存しており面倒なので、シンタックスハイライトだけを提供するシンプルな
" asciidoc/vim-asciidocを使用する。
NeoBundle 'asciidoc/vim-asciidoc'

" objdumpシンタックスハイライト
NeoBundle 'vim-scripts/Mixed-sourceassembly-syntax-objdump'
" C++11シンタックスハイライト
NeoBundle 'vim-jp/cpp-vim'
" QMakeシンタックスハイライト
NeoBundle 'artoj/qmake-syntax-vim'
" PowerShellシンタックスハイライト
NeoBundle 'PProvost/vim-ps1'
" TOMLシンタックスハイライト
NeoBundle 'cespare/vim-toml'
" jadeシンタックスハイライト
NeoBundle 'digitaltoad/vim-jade'
" JSONシンタックスハイライト
NeoBundle 'elzr/vim-json'
" jinja2シンタックスハイライト
NeoBundle 'Glench/Vim-Jinja2-Syntax'
" ansibleシンタックスハイライト
NeoBundle 'pearofducks/ansible-vim'
" Kotlinシンタックスハイライト
NeoBundle 'udalov/kotlin-vim'
" Doxygenシンタックスハイライト
NeoBundle 'vim-scripts/DoxyGen-Syntax', {
    \ 'autoload' : { 'filetypes' : ['c', 'cpp'] }}

" CSSカラー
" テキストファイル中のカラーコードっぽいものをカラー表示する。ただしめちゃ重い。
" このプラグインは結構重い。数万行のファイルを開こうとすると数秒かかる
NeoBundleLazy 'lilydjwg/colorizer', {
    \ 'autoload' : {'filetypes' : ['html', 'css']}
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:diff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ディレクトリ単位の比較
NeoBundleLazy 'vim-scripts/DirDiff.vim', {
    \ 'autoload' : { 'commands' : 'DirDiff' }}

if exists("*systemlist")
    " diffアルゴリズムを複数から選択できる
    NeoBundle 'chrisbra/vim-diff-enhanced'
endif

" ビジュアルモードで2つのブロックを選択して、差分を見る
NeoBundleLazy 'AndrewRadev/linediff.vim.git', {
    \ 'autoload' : { 'commands' : 'Linediff' }}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" メインとなる強力なGit Plugin。Gstatusが主力
NeoBundle 'tpope/vim-fugitive'

" git logを見やすく表示する。AgitFileでファイル単位で履歴を遡れるのがかなり便利
NeoBundle 'cohama/agit.vim'

" カレントバッファにHEADとの差分を表示する
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'idanarye/vim-merginal'

" git add -p拡張
" 使い方に癖があるし、fugitive Gstatus p で必要十分な感じがするので、とりあえず
" 除外しておく。
" NeoBundle 'AndrewRadev/gapply.vim'

"" 差分が大きいときに表示に時間がかかりすぎるので無効にしとく。
"" 差分を見たいときはgit commit -vとすれば、詳細な表示は出せるから、自動で豪華な
"" 表示になっちゃうのはやりすぎかな。
" git commit の表示を豪華にする
" NeoBundle 'rhysd/committia.vim'

" gist拡張
" NeoBundle 'lambdalisue/vim-gista'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:入力補完
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Rip-Rip/clang_complete', {
    \ 'autoload' : {
    \     'filetypes' : ['c', 'cpp'],
    \    },
    \  }
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'autoload' : {
    \     'filetypes' : ['python'],
    \    },
    \  }
" Powershell complete
" NeoBundle 'cd01/poshcomplete-vim'

" C/C++, C#, Python, Go, Javascript complete
" NeoBundleLazy "Valloric/YouCompleteMe", {
"     \ 'autoload' : {
"     \     'filetypes' : ['go', 'javascript'],
"     \    },
"     \  }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @plugin:ファイル操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 関連するファイルを開きやすくする。
NeoBundle 'kana/vim-altr'
" .gitとかのディレクトリを認識して楽に移動できるようにする。
NeoBundle "airblade/vim-rooter"

" シンプルイズベスト。高速なファイル検索
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/ctrlp-ghq'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:メモ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'vim-scripts/doxygen-support.vim', {
    \ 'autoload' : { 'filetypes' : ['c', 'cpp'] }}
NeoBundleLazy 'vim-scripts/DoxygenToolkit.vim', {
    \ 'autoload' : { 'filetypes' : ['c', 'cpp'] }}

NeoBundle 'fuenor/qfixhowm'

" NeoBundle 'Rykka/riv.vim'
" NeoBundle 'Rykka/InstantRst'

NeoBundle 'plasticboy/vim-markdown', {
    \ 'autoload' : { 'filetypes' : ['markdown'] }}
NeoBundle 'godlygeek/tabular', {
    \ 'autoload' : { 'filetypes' : ['markdown'] }}


" Markdownとかのアウトラインをいい感じに表示してくれる。
" 'vim-voom/VOoM'はpython3に非対応なので'juejung/VOoM'を使用する
" NeoBundle 'vim-voom/VOoM'
NeoBundleLazy 'juejung/VOoM.git', {
    \ 'autoload' : { 'commands' : 'VoomToggle' }}

NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'tyru/open-browser-github.vim'

" スクラッチバッファ
NeoBundle 'duff/vim-scratch'

" テキスト作図に便利
NeoBundle 'vim-scripts/DrawIt'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:整形
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 組込みのAlignコマンドより高機能？なAligntaコマンドが便利
NeoBundle 'h1mesuke/vim-alignta'

" Aligntaの方が個人的に使いやすかった
" NeoBundle 'junegunn/vim-easy-align'

" 日本語を禁則処理とかも踏まえてええ感じに整形する
" NeoBundle 'fuenor/JpFormat.vim'

" Markdownのリスト表示をディレクトリツリーぽい表示に整形できる
NeoBundle 'shinespark/vim-list2tree'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:カーソルとかウインドウ操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fによる文字ジャンプの拡張
NeoBundle 'rhysd/clever-f.vim'

" jkの移動を慣性スクロールっぽくする
" NeoBundle 'rhysd/accelerated-jk'

" %を拡張し、HTMLの閉じタグへのジャンプ等ができるようになる
NeoBundle 'https://github.com/tmhedberg/matchit.git'

" カーソル移動の拡張
" 見た目は面白いんだけど、普通に/で検索した方が早いかな・・・。
" NeoBundle 'Lokaltog/vim-easymotion'

" 復数ウインドウ表示、単一ウインドウ表示のトグル
NeoBundleLazy 'vim-scripts/ZoomWin', {
    \ 'autoload' : { 'commands' : 'ZoomWin' }}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:その他ユーティリティ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" シンタックスチェック
NeoBundleLazy 'scrooloose/syntastic', {
    \ 'autoload' : { 'commands' : 'SyntasticCheck' }}
" 簡易実行
NeoBundle 'thinca/vim-quickrun'
" CUI版Vimでもクリップボードを使用できるようにする
NeoBundle 'kana/vim-fakeclip'

" Keyマップの連続実行を補助するサブモードを定義できる凄いプラグイン
" http://thinca.hatenablog.com/entry/20130131/1359567419
"
" しかし他のキーマップとバッティングしてると期待通り動かない？
" NeoBundle 'kana/vim-submode'

" アウトライン表示
NeoBundle 'majutsushi/tagbar'

" コールツリー
" NeoBundle 'vim-scripts/CCTree'

" Yank拡張
" YankRing.vimより副作用の少ないyankround.vimを使用する。
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'LeafCage/yankround.vim'

" リファレンスの参照
NeoBundle 'thinca/vim-ref'

" 日本語ヘルプ
NeoBundle 'vim-jp/vimdoc-ja'

NeoBundle 'vim-scripts/SudoEdit.vim'

" 全角スペースの可視化
NeoBundle 'thinca/vim-zenspace'

" コメントアウトのトグルを簡単にする
NeoBundleLazy 'tyru/caw.vim', {
    \ 'autoload' : {
    \     'mappings' :
    \         ['<Plug>(caw', '<Plug>(operator-caw)']
    \     }
    \ }

" vimスクリプトのベンチマーク
NeoBundleLazy 'mattn/benchvimrc-vim', {
  \ 'autoload': {
    \   'commands': ['BenchVimrc'],
      \  },
    \}
NeoBundleLazy 'itchyny/calendar.vim', {
    \ 'autoload' : {
    \       'commands' : {'name' : 'Calendar', 'complete' : 'customlist,calendar#argument#complete'},
    \   }
    \ }

" Python
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
    \ 'autoload' : {
    \     'filetypes' : 'python',
    \   }
    \ }

" Bash
NeoBundleLazy 'vim-scripts/bash-support.vim', {
    \ 'autoload' : {
    \     'filetypes' : 'sh',
    \   }
    \ }

" Go
NeoBundleLazy 'Blackrush/vim-gocode', {
    \ 'autoload' : {
    \       'filetypes' : ['go', 'markdown'],
    \       'commands' : 'Godoc',
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin:様子見中
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VimFilerの対抗となる、シンプル系ファイラー
" NeoBundle 'cocopon/vaffle.vim'

NeoBundleSaveCache  " キャッシュの書込み
call neobundle#end()

NeoBundleCheck

" Required:
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイルの探索パス
set path&
if executable('gcc')
    " C/C++標準ライブラリの入力補完のためにGCCのデフォルトサーチパスをpathに加える。
    " C/C++の開発をしないのであればこの設定は不要。
    let s:gcc_ver = substitute(system('gcc -dumpversion'), '\n', '', 'g')
    let s:gcc_target = substitute(system('gcc -dumpmachine'), '\n', '', 'g')
    if has('win32') || has('win64')
        let s:prefix = 'c:/msys64/mingw64/'
    else
        set path+=/usr/include
        set path+=/usr/local/include
        let s:prefix = '/usr/'
    endif
    execute 'set path+=' . s:prefix . 'lib/gcc/' . s:gcc_target . '/' . s:gcc_ver . '/include'
    execute 'set path+=' . s:prefix . 'lib/gcc/' . s:gcc_target . '/' . s:gcc_ver . '/include-fixed'
    execute 'set path+=' . s:prefix . 'include/' . s:gcc_target
    execute 'set path+=' . s:prefix . s:gcc_target . '/include'
    execute 'set path+=' . s:prefix . 'include/c++/' . s:gcc_ver
    execute 'set path+=' . s:prefix . 'include/c++/' . s:gcc_ver . '/backward'
    execute 'set path+=' . s:prefix . 'include/' . s:gcc_target . '/c++/' . s:gcc_ver
    execute 'set path+=' . s:prefix . 'include/c++/' . s:gcc_ver . '/' . s:gcc_target

    " このexecuteはこんな感じに展開される。
    " set path+=/usr/lib/gcc/x86_64-linux-gnu/5/include
    " set path+=/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
    " set path+=/usr/include/x86_64-linux-gnu
    " set path+=/usr/include/c++/5
    " set path+=/usr/include/c++/5/backward
    " set path+=/usr/include/x86_64-linux-gnu/c++/5
endif
let g:default_path = &path


" シンタックス解析を行う最大文字数。無制限にシンタックス解析を行うと、minifyされ
" たjsファイル等をうっかり開いてしまったときに、クソ重たくなってしまうので、適当
" に制限をもうけておいたほうがいい。
set synmaxcol=500

" 新しい行のインデントを現在行と同じにする
set autoindent

" タブと対応する空白の数。基本を4として言語のスタンダード的なインデント幅がある
" ときは、ファイルタイプオプションで別途指定する。
set tabstop=4

" これは挙動がよくわからんので0(無効)にしておく。
set softtabstop=0

" vimが挿入する自動インデント幅は見た目上の空白何文字分か
set shiftwidth=4

" インデントをshiftwidthの倍数にまるめる。
set shiftround

" TAB - SPACE 変換。Makefile等のタブが構文上の意味を持つような時はファイルタイプ
" オプションで別途 setlocal noexpandtabを指定する。
set expandtab

" 単語選択で'-'も含める
set iskeyword+=

" ウインドウに収まらない行は折り返して表示する。
set wrap           " the longer line is wrapped
set linebreak      " wrap at 'breakat'
set showbreak=+\   " set showbreak

if exists('+breakindent')
    "" breakindentについては以下のサイトが詳しい。
    " https://rcmdnk.com/blog/2014/07/14/computer-vim/

    " 折り返しが発生した際に、折り返された行と同じインデントで表示する
    set breakindent
    " 折り返し表示のマーカー
    let &showbreak = '> '
    Autocmd BufEnter * set breakindentopt=min:20,shift:0
endif

" 検索がファイル末尾まで進んだらファイル先頭から再び検索する。
set wrapscan

" 閉じ括弧が入力されたとき対応する括弧を強調表示する
set showmatch

" ステータスラインに行、列を表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" 常にカーソル行が画面中央にくるようにする
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
set fileformats=unix,dos,mac

" 自動整形の対象となるテキスト幅
set textwidth=80

" 遅延描画オン
set lazyredraw

" 高速ターミナル接続を行わない。(デフォルト値)
set nottyfast

" CursolHoldイベント発生までの時間(ミリ秒)
set updatetime=500

" 補完候補が一つだけでもポップアップを表示する。
set completeopt=menuone

" 折りたたみを有効にする。
set foldenable

" マルチマイト文字があってもカーソルがずれないようにする。
" set ambiwidth=double

" 読み込んでいるファイルが外部のプログラムで変更されたら自動で読みなおす。
set autoread

" " h と l で行を跨げるようにする
set whichwrap&
set whichwrap +=h
set whichwrap +=l

" 256色モード
set t_Co=256

" CUIvimでもマウス操作を有効にする
set mouse=a

" キーマップリーダーをデフォルトの'\'から変更する
"let mapleader = ","

set tags&
if has('path_extra')
    set tags+=tags;
endif

"コマンド補完に関する設定
set wildmode=longest:full,full

" 文字がない場所でのペースト時に空白を詰める
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" 外部からペーストする時だけset pasteとしておくと綺麗に貼りやすいらしい。
set nopaste

" バックアップファイルを使用する
set backup

" スワップファイルを使用しない
set noswapfile

" アンドゥファイルを使用する
set undofile

" 特殊ファイル置き場が存在しなければ作成する
let s:viewdir=expand('~/vim.d/view')
let s:backupdir=expand('~/vim.d/backup')
let s:swapdir=expand('~/vim.d/swap')
let s:undodir=expand('~/vim.d/undo')
for d in [s:viewdir, s:backupdir, s:swapdir, s:undodir]
    if ! isdirectory(d)
        call mkdir(d, 'p')
    endif
endfor

execute 'set viewdir=' . s:viewdir
execute 'set backupdir=' . s:backupdir
execute 'set directory=' . s:swapdir
execute 'set undodir=' . s:undodir

"!! 何故かこのオプションを有効にすると、neocomplcacheが異常に重くなる。
"set viminfo=%,'50,/50,:50,<50,@50,h,f1,n~/.viminfo

set sessionoptions=curdir,resize,tabpages,winpos,winsize,unix,slash

"バッファのオプションはセーブしない
set viewoptions=cursor,folds,slash,unix

"コマンド履歴保存数
set history=1000

"コマンドラインの高さ(gVim用も別に用意する)
set cmdheight=2

"プレビューウインドウの高さ
set previewheight=10

" コマンドラインウインドウの高さ
set cmdwinheight=3

set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

" 行番号を表示する
set number

set guioptions&
" ツールバーを非表示
set guioptions-=T

" メニューバーを非表示
set guioptions-=m

" 右スクロールバーを非表示
set guioptions-=r
set guioptions-=R

" 左スクロールバーを非表示
set guioptions-=l
set guioptions-=L

" 下スクロールバーを非表示
set guioptions-=b

" %でジャンプできる括弧の組を追加する
set matchpairs&
set matchpairs+=<:>

" diffモード時に空白の差分は無視する
set diffopt&
set diffopt+=iwhite

"" なんか微妙に動きが不安定なので止めた。
"" CUI Vimでも<Alt->のキーマップを可能にする。シフトも組み合わせて
"" <A-S-n>とかもOK
"" [参考]
"" http://blog.remora.cx/2012/07/using-alt-as-meta-in-vim.html
"let c = 'a'
"while c <= 'z'
"    execute "set <M-" . c . ">=\e" . c
"    execute "imap \e" . c . " <M-" . c . ">"
"    execute "set <M-S-" . c . ">=\e" . toupper(c)
"    execute "imap \e" . toupper(c) . " <M-" . c . ">"
"    let c = nr2char(1+char2nr(c))
"endw
"上記Altキーの設定によりコマンドモードでESCを２回押さないとノーマルモードに戻
"れなくなるので、ESC２連続をマップしておく。
"cnoremap <C-[> <ESC><ESC>

" cscope系のオプション
"set cscoperelative
"set csre
set csverb
set csto=1
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBIND:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"フルスクリーンモード
nnoremap <silent><F11> :<C-u> call <SID>toggle_fullscreen()<CR>

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
" カレントウィンドウのみを残して、他のウインドウを閉じる
nnoremap <C-w>O <C-w>o
" バッファ削除
nnoremap <C-w>d :<C-u>call <SID>delete_current_buf()<CR>
nnoremap <C-w>D :<C-u>bdelete<CR>

nnoremap <silent><Leader>h :<C-u>SmartHelp<Space><C-l>

" 検索後画面の中心に。
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz

"カレントバッファのディレクトリへ移動する
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

noremap <silent><C-p>   :<C-u>bprevious<CR>
"<BS>の挙動
" nnoremap <BS> diw

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS: 汎用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathが存在していればpathをsourceコマンドで実行する
function! SourceIfExist(path)
    if filereadable(a:path)
        execute 'source' a:path
    endif
endfunction

" 文字列の前後から空白(改行も含む)を除去して返す
function! Strip(input_string)
    return substitute(a:input_string,'\v^[\s\n]*(.{-})[\s\n]*$','\1','')
endfunction

" vimにset pathした時の、','区切りのパスをGCCの'-I'形式のインクルードパスに変換
" して返す
function! VimPath2CincludePath(path)
    let cpath = a:path
    let cpath = substitute(cpath, ",", " -I ", "g")
    let cpath = substitute(cpath, "\\", "", "g")
    let cpath = substitute(cpath, "^.", "", "")
    return cpath
endfunction

function! UpdatePath()
    let s:cpath = VimPath2CincludePath(&path)
    let s:copt = '-std=gnu99 ' . s:cpath
    let s:cppopt = '-std=gnu++0x ' . s:cpath
    let s:strict_copt = '-Wall -Wextra -fPIC ' . s:copt
    let s:strict_cppopt = '-Wall -Wextra -fPIC ' . s:cppopt

    let g:syntastic_c_compiler_options   = s:strict_copt
    let g:syntastic_cpp_compiler_options = s:strict_cppopt

    let g:neocomplete#sources#include#paths = {
            \ 'cpp' :   &path,
            \ 'c'   :   &path,
            \ }
    let g:clang_user_options = s:strict_cppopt
    let g:quickrun_config = {
                \   "_" : {
                \       "outputter/buffer/split" : ":botright",
                \       "outputter/buffer/close_on_empty" : 1
                \   },
                \}
    let g:quickrun_config.c = {
                \ 'command' : 'gcc',
                \ 'cmdopt' : '-std=gnu99 -O2',
                \ 'tempfile': '%{tempname()}.c',
                \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
                \ 'hook/quickrunex/enable' : 1,
                \ 'hook/sweep/files': '%S:p:r',
                \ 'hook/add_include_option/enable' : 1,
                \ }
    let g:quickrun_config.cpp = {
                \ 'command' : 'g++',
                \ 'cmdopt' : '-std=gnu++11 -O2',
                \ 'tempfile': '%{tempname()}.cpp',
                \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
                \ 'hook/quickrunex/enable' : 1,
                \ 'hook/sweep/files': '%S:p:r',
                \ 'hook/add_include_option/enable' : 1,
                \ }
    let g:quickrun_config.python = {
                \ 'command' : 'python3',
                \ 'tempfile': '%{tempname()}.py',
                \ 'hook/quickrunex/enable' : 1,
                \ 'hook/sweep/files': '%S:p:r',
                \ }
    let g:quickrun_config.ruby = {
                \ 'tempfile': '%{tempname()}.rb',
                \ 'hook/quickrunex/enable' : 1,
                \   "hook/output_encode/enable" : 1,
                \   "hook/output_encode/encoding" : "utf-8",
                \}
    if has('win32') || has('win64')
        " windowsには/usr/bin/envは存在しないので、シェバンは無効にしておいた方
        " がよい。
        let g:quickrun_config._['hook/shebang/enable'] = 0
    endif
endfunction

function! s:python_settings()
    if &modifiable
        setlocal fileencoding=utf-8
        setlocal fileformat=unix
    endif
endfunction

function! s:html_settings()
    if &modifiable
        setlocal tabstop=2
        setlocal shiftwidth=2
        setlocal textwidth=0
        setlocal noexpandtab
    endif
endfunction

function! s:gitcommit_settings()
    if &modifiable
        setlocal fileencoding=utf-8
    endif
endfunction

function! s:yaml_settings()
    if &modifiable
        setlocal tabstop=2
        setlocal shiftwidth=2
        setlocal textwidth=0
    endif
endfunction


function! s:cmdwin_settings()
    map <buffer> <S-CR> <CR>q:
    nnoremap <buffer> q :<C-u>quit<CR>
    "nnoremap <buffer> <TAB> :<C-u>quit<CR>
    inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
    inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
    inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
    " Completion.
    inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    setlocal nonumber
    " let b:neocomplete_sources = ['vim']
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

function! s:toggle_fullscreen()
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
function! s:chdir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" 相対行ナンバー表示、絶対行ナンバー表示をトグルする
function! s:toggle_relative_number_option()
    if version < 703
        echo 'relativenumber not supported'
        return
    else
        if &relativenumber
            setlocal norelativenumber
        else
            setlocal relativenumber
        endif
    endif
endfunction

" パスをクリップボードにコピーする
if has('win32') || has('win64')
    function! s:copy_path()
        let @*=expand('%:P')
    endfunction
    function! s:copy_fullpath()
        let @*=expand('%:p')
    endfunction
    function! s:copy_file_name()
        let @*=expand('%:t')
    endfunction
    function! s:copy_git_dir()
        let @*=s:GitRootDir()
    endfunction
else
    function! s:copy_path()
        let @+=expand('%:P')
    endfunction
    function! s:copy_fullpath()
        let @+=expand('%:p')
    endfunction
    function! s:copy_file_name()
        let @+=expand('%:t')
    endfunction
    function! s:copy_git_dir()
        let @+=s:GitRootDir()
    endfunction
endif


" git管理のディレクトリーツリーにいるかどうかを返す
function! s:is_git_dir()
    return system('git rev-parse --is-inside-work-tree') ==# "true\n"
endfunction

" git のルートディレクトリを返す
function! GitRootDir()
    if(s:is_git_dir())
        let l:gitdir = system('git rev-parse --show-toplevel')
        let l:gitdir= substitute(l:gitdir, '\r\n', '', 'g')
        let l:gitdir= substitute(l:gitdir, '\n', '', 'g')
        return l:gitdir
    else
        echoerr 'current directory is outside git working tree'
    endif
endfunction

function! s:add_permission_x()
    let file = expand('%:p')
    if getline(1) =~# '^#!' && !executable(file)
        silent! call vimproc#system('chmod a+x ' . shellescape(file))
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

" バッファを削除する
function! s:delete_current_buf()
    let bufnr = bufnr('%')
    bnext
    if bufnr == bufnr('%') | enew | endif
    silent! bdelete #
endfunction


function! CustomFoldText()
    " 折り畳みの n 行:という表記は個人的に目障りなので除去する
    let ret = substitute(foldtext(), '- \+[0-9]\+ 行:', '- ', '')
    return ret
endfunction

function! s:get_syn_id(transparent)
  let synid = synID(line(".") - 1, col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=? -complete=dir -bang CD  call s:chdir('<args>', '<bang>')
" カーソル下のハイライトグループを取得
command! -nargs=0 GetHighlightingGroup
            \ echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '>trans<'
            \ . synIDattr(synID(line('.'),col('.'),0),'name') . '>lo<'
            \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'

" より詳しいハイライト情報
command! SyntaxInfo call s:get_syn_info()

" 日時を現在行に挿入する
command! Date :call setline('.', getline('.') . strftime('%Y/%m/%d %H:%M'))

" 縦幅と横幅を見て help の開き方を決める
command! -nargs=* -complete=help SmartHelp call <SID>smart_help(<q-args>)

" 文字数カウント
command! -nargs=0 Wc %s/.//nge

command! CopyPath                       call <SID>copy_path()
command! CopyFullPath                   call <SID>copy_full_path()
command! CopyFileName                   call <SID>copy_file_name()
command! CopyGitDir                     call <SID>copy_git_dir()
command! ToggleRelativeNumberOption     call <SID>toggle_relative_number_option()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO_COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc augroup
function! s:markdown_settings()
    nnoremap <buffer><Space>tt :<C-u>VoomToggle markdown<CR>
    " let g:voom_tree_placement = "top"
    let g:voom_tree_placement = "left"
    let g:voom_tree_height = 70
    let g:voom_tree_width = 70
    if &modifiable
        setlocal fileencoding=utf-8
        setlocal fileformat=unix
        setlocal textwidth=0
        setlocal tabstop=4
        setlocal nospell
    endif
    " hi markdownH1   cterm=bold ctermfg=224 gui=bold guifg=#f2d8df
    " hi markdownH2   cterm=bold ctermfg=211 gui=bold guifg=#ef7585
    " hi markdownH3   cterm=bold ctermfg=224 gui=bold guifg=#efc1c4
    " hi markdownH4   cterm=bold ctermfg=226 gui=bold guifg=#ffff00
    " hi markdownH5   cterm=bold ctermfg=46 gui=bold guifg=#00ff00
    " hi markdownH6   cterm=bold ctermfg=46 gui=bold guifg=#00ff00
endfunction

" Markdown
Autocmd BufRead,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown | call <SID>markdown_settings()
" tmux
Autocmd BufRead,BufNewFile *tmux.conf setlocal ft=tmux
" git config file
Autocmd BufRead,BufNewFile gitconfig setlocal ft=gitconfig

" Gnuplot のファイルタイプを設定
Autocmd BufRead,BufNewFile *.plt,*.plot,*.gnuplot setlocal ft=gnuplot
" Ruby の guard 用ファイル
Autocmd BufRead,BufNewFile Guardfile setlocal ft=ruby
" JSON
Autocmd BufRead,BufNewFile *.json,*.jsonp setlocal ft=json
" jade
Autocmd BufRead,BufNewFile *.jade setlocal ft=jade
" Go
Autocmd BufRead,BufNewFile *.go setlocal ft=go
" vimspec
Autocmd BufRead,BufNewFile *.vimspec setlocal ft=vim.vimspec
" neosnippet
Autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=snippet
" 前回終了したカーソル行に移動
Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" 折りたたみの時のmkview loadviewを自動化する
Autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
Autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

function! s:rtrim()
    " 保存時に行末の空白を除去する。ただし、markdownの場合は行末の空白に意味があ
    " るので除去しない。
    let s:cursor = getpos(".")
    if &filetype == "markdown"
        %s/\s\+\(\s\{2}\)$/\1/e
    else
        %s/\s\+$//e
    endif
    call setpos(".", s:cursor)
endfunction

Autocmd BufWritePre * call <SID>rtrim()

Autocmd BufRead,BufNewFile *.dis set filetype=cmix
Autocmd Syntax mixed so ~/.vim/syntax/cmix.vim
Autocmd WinEnter,BufRead * set cursorline
Autocmd WinLeave * set nocursorline
Autocmd CmdwinEnter * call <SID>cmdwin_settings()

AutocmdFT diff setlocal nofoldenable
AutocmdFT ps1 setlocal omnifunc=poshcomplete#CompleteCommand
AutocmdFT cpp setlocal suffixesadd=.hpp
AutocmdFT python call <SID>python_settings()
AutocmdFT html call <SID>html_settings()
AutocmdFT yaml call <SID>yaml_settings()
AutocmdFT gitcommit call <SID>gitcommit_settings()
AutocmdFT make,snippet setlocal noexpandtab

" quickfixウインドウで<CR>すると、該当の場所にジャンプするが、むしろジャンプし
" てほしくない(プレビューしたい)のでジャンプしてから無理やり戻るという方法を取
" る。
" [注]
" quickfixウインドウから別のファイルにジャンプするときに、挙動がおかしくなったの
" で、一旦コメントアウトしておく。
" Autocmd BufReadPost quickfix nnoremap <buffer><silent> <C-j>    j<CR>:copen<CR>
" Autocmd BufReadPost quickfix nnoremap <buffer><silent> <C-k>    k<CR>:copen<CR>
" Autocmd BufReadPost quickfix nnoremap <buffer><silent> <CR>     <CR>:copen<CR>

" voomtree(アウトラインビュー)でアウトラインにたいして<CR>を入力すると、プレ
" ビューされるが、カーソル移動するだけでプレビューしてほしいので、以下のマッピン
" グをする。
AutocmdFT voomtree nmap <buffer> <C-j> j<CR>
AutocmdFT voomtree nmap <buffer> <C-k> k<CR>

" スクリプトに実行可能属性を自動で付ける
if executable('chmod')
    Autocmd BufWritePost * call s:add_permission_x()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! empty(neobundle#get('unite.vim'))
    " uniteの説明については以下リンク先が詳しい。
    " http://komaken.me/blog/2014/05/07/いつまでたってもunite-vimが使いこなせないので、さす/
    let g:unite_enable_start_insert=0
    let g:unite_enable_split_vertically=1
    let g:unit_file_mru_limit=1000
    let g:unite_kind_file_use_trashbox = 1

    " unite grepのデフォルトオプション
    " let s:grep_exclude_dirs = '--exclude-dir=.git,.hg,.bzr,.svn,boost,bin,lib '
    let s:grep_exclude_dirs = '--exclude-dir=.*,boost,bin,lib'
    let g:unite_source_grep_default_opts = '-IinH ' . s:grep_exclude_dirs

    " 大文字小文字を区別しない
    let g:unite_enable_ignore_case = 1
    let g:unite_enable_smart_case = 1

    nnoremap         [unite]  <nop>
    nmap    <Space>u [unite]

    " コマンドラインウィンドウで Unite コマンドを入力
    nnoremap [unite]u       :<C-u>Unite source<CR>

    " -auto-previewオプションは遅すぎるからやめとこか。pで手動プレビューできる。
    " grep検索
    nnoremap [unite]g      :<C-u>Unite grep:. -sync -no-start-insert -no-empty -horizontal -direction=botright -winheight=10<CR>

    " メモgrep検索
    nnoremap [unite]m      :<C-u>execute 'Unite grep:'.expand('~/Dropbox/dev-mem').' -sync -no-start-insert -no-empty -horizontal -direction=botright -winheight=10'<CR>

    " ghq
    nnoremap [unite]q      :<C-u>Unite -no-empty -start-insert -default-action=vimfiler ghq directory_mru<CR>

    " Git のルートディレクトリを開く
    nnoremap <expr>[unite]G  ":\<C-u>Unite file -input=".fnamemodify(GitRootDir(),":p")

    " バッファ一覧
    " nnoremap [unite]b       :<C-u>Unite -immediately -no-empty -horizontal -direction=botright -winheight=10 -auto-preview buffer<CR>
    nnoremap [unite]b       :<C-u>Unite -immediately -no-empty -horizontal -direction=botright -winheight=10 buffer<CR>

    " Uniteバッファの復元
    nnoremap [unite]r       :<C-u>UniteResume<CR>
    " Unite ソース一覧
    nnoremap [unite]s       :<C-u>Unite source -vertical<CR>
    " ブックマーク
    noremap [unite]B        :<C-u>Unite bookmark<CR>
    " レジスタ
    noremap [unite]R        :<C-u>Unite -buffer-name=register register<CR>
    " help(項目が多いので，検索語を入力してから絞り込む)
    " nnoremap [unite]hh      :<C-u>UniteWithInput -vertical -auto-preview help<CR>
    nnoremap [unite]hh      :<C-u>Unite -start-insert -vertical -no-quit help<CR>
    " 履歴
    nnoremap [unite]hc      :<C-u>Unite -buffer-name=lines history/command -start-insert<CR>
    nnoremap [unite]hs      :<C-u>Unite -buffer-name=lines history/search<CR>
    nnoremap [unite]hy      :<C-u>Unite -buffer-name=lines history/yank<CR>

    " カラースキーム
    nnoremap [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
    " 検索
    nnoremap [unite]/ :<C-u>execute 'Unite grep:'.expand('%:p').' -input='.escape(substitute(@/, '^\\v', '', ''), ' \')<CR>

    "" この辺はCtrlPの方が使いやすいから無効かしとこ
    "" バッファを開いた時のパスを起点としたファイル検索
    " nnoremap [unite]f       :<C-u>UniteWithBufferDir -buffer-name=files -vertical file directory file/new<CR>
    "" 指定したディレクトリ以下を再帰的に開く
    " nnoremap [unite]F       :<C-u>UniteWithBufferDir -no-start-insert file_rec/async -auto-resize<CR>
    " 最近使用したファイル
    " nnoremap [unite]m       :<C-u>Unite file_mru directory_mru file/new<CR>

    " コマンドの出力
    " unite-lines ファイル内インクリメンタル検索
    nnoremap <expr> [unite]L line('$') > 5000 ?
                \ ":\<C-u>Unite -no-split -start-insert -auto-preview line/fast\<CR>" :
                \ ":\<C-u>Unite -start-insert -auto-preview line:all\<CR>"
    " エンターの代わりに以下のキーでウィンドウを水平分割して開く
    AutocmdFT unite nnoremap  <buffer> <expr> <C-S> unite#do_action('split')
    AutocmdFT unite inoremap  <buffer> <expr> <C-S> unite#do_action('split')
    " エンターの代わりに以下のキーでウィンドウを垂直分割して開く
    AutocmdFT unite nnoremap  <buffer> <expr> <C-V> unite#do_action('vsplit')
    AutocmdFT unite inoremap  <buffer> <expr> <C-V> unite#do_action('vsplit')
endif

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
    AutocmdFT xml setlocal omnifunc=xmlcomplete#CompleteTags

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
    "シンタックスをキャッシュするときの最小文字長
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
    let g:neocomplete#max_keyword_width = 2000
    let g:neocomplete#sources#buffer#max_keyword_width = 2000

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

    if ! empty(neobundle#get('clang_complete'))
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
    endif

    call neocomplete#custom#source('file', 'rank', 10)
    " 使用する補完の種類を減らす
    " 現在のSourceの取得は `:echo keys(neocomplete#variables#get_sources())`
    " デフォルト: ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
    "
    if !exists('g:neocomplete#sources')
        let g:neocomplete#sources = {}
    endif

    let g:neocomplete#sources._ = ['file', 'file/include', 'neosnippet', 'syntax', 'omni', 'member', 'buffer']
    let g:neocomplete#sources.vim = ['file', 'file/include', 'neosnippet', 'syntax', 'vim', 'omni', 'member', 'buffer']

    " neocomplete 補完用関数
    let g:neocomplete#sources#vim#complete_functions = {
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' : 'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' : 'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' : 'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \}

    " YouCompleteMeがインストールされている時は、特定の言語の時にneocompleを
    " Disableにする
    " if ! empty(neobundle#get('YouCompleteMe'))
    "     AutocmdFT c,cpp,go, NeoCompleteLock
    " endif
endif

if ! empty(neobundle#get('neocomplcache.vim'))
    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif


if ! empty(neobundle#get('clang_complete'))
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 1

    if has('win32') || has('win64')
        " let g:clang_library_path = "C:/llvm/bin"
        let g:clang_library_path = "C:/dev/llvm/bin"
        " いつもまにかWindowsだと謎のエラーがでるようになったので、この機能は
        " 使わない。
        let g:clang_snippets = 0
    else
        let g:clang_library_path = '/usr/lib'
        " let g:clang_library_path = '/usr/lib/llvm-3.6/lib'
        " clang本体はPython3に対応しているが、スニペット展開の部分は対応してない
        " だと・・・。
        " let g:clang_snippets = 0
        " 2017/02/27 対応したようだ
        let g:clang_snippets = 1
    endif


    let g:clang_complete_macros = 1
    let g:clang_auto_user_options = ".clang_complete, path"
    let g:clang_snippets_engine = 'clang_complete'
    let g:clang_trailing_placeholder = 1
    let g:clang_use_snipmate = 0
    let g:clang_hl_errors = 1
    let g:clang_jumpto_declaration_key = ""
    let g:clang_jumpto_back_key = ""
    let g:clang_jumpto_declaration_in_preview_key = ""
    let g:clang_complete_copen=1

    let g:clang_make_default_keymappings = 0
    function! s:clang_complete_settings()
        " デフォルトのタグジャンプキーバインドを置き換える
        nnoremap <silent><buffer> <C-]>   :<C-u>call ClangGotoDeclaration()<CR>
        inoremap <silent><buffer> <S-tab> <ESC>:<C-u>python updateSnips()<CR>
    endfunction
    AutocmdFT c,cpp call s:clang_complete_settings()
endif

if empty(neobundle#get('jedi-vim'))
    AutocmdFT python setlocal omnifunc=pythoncomplete#Complete
else
    let g:jedi#force_py_version = 3
    let g:jedi#auto_initialization = 1
    " let g:jedi#auto_vim_configuration = 1
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#completions_enabled = 1
    let g:jedi#popup_select_first = 0
    " 1だと、入力位置上部にシグネチャがポップアップする。2だとコマンド
    " ラインウインドウに表示される。
    let g:jedi#show_call_signatures = "2"
    let g:jedi#goto_assignments_command = ''
    let g:jedi#goto_definitions_command = ''
    let g:jedi#documentation_command = ''
    let g:jedi#usages_command = ''
    let g:jedi#completions_command = ''
    let g:jedi#rename_command = ''

    function! s:jedi_settings()
        setlocal omnifunc=jedi#completions
        " デフォルトのタグジャンプキーバインドを置き換える
        nnoremap <buffer>            [jedi] <nop>
        nmap     <buffer> <Space>j   [jedi]
        nnoremap <buffer> [jedi]r    :<C-u>call jedi#rename()<CR>
        nnoremap <buffer> [jedi]g    :<C-u>call jedi#goto_assignments()<CR>
        nnoremap <buffer> [jedi]d    :<C-u>call jedi#show_documentation()<CR>
        nnoremap <buffer> [jedi]u    :<C-u>call jedi#usages()<CR>
        nnoremap <buffer> [jedi]i    :<C-u>Pyimport<Space>
        nnoremap <buffer> <C-]>      :<C-u>call jedi#goto_definitions()<CR>
        command! -nargs=0 JediRename call jedi#rename()
    endfunction
    AutocmdFT python call s:jedi_settings()
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
    " .gitのあるディレクトリをexploer風に開く。
    nnoremap <expr>[vimfiler]g ":\<C-u>VimFilerExplorer " . GitRootDir() . "\<CR>"
    " .gitのあるディレクトリを開く。
    nnoremap <expr>[vimfiler]<S-g> ":\<C-u>VimFiler " . GitRootDir() . "\<CR>"

    let g:loaded_netrwPlugin = 1
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimfiler_enable_auto_cd = 1
    let g:vimfiler_preview_action = "preview"
    let g:vimfiler_execute_file_list = {
        \ '_' : 'vim', 'pdf' : 'open', 'mp3' : 'open', 'jpg' : 'open',
        \ 'png' : 'open', }

    " 誤操作を減らすために不要なコマンドはマッピングしないのと、いくつかはデフ
    " ォルトのマッピングから変更する
    let g:vimfiler_no_default_key_mappings = 1

    function! s:MyVimFilerKeyMapping()
        nmap <buffer><silent> j             <Plug>(vimfiler_loop_cursor_down)
        nmap <buffer><silent> k             <Plug>(vimfiler_loop_cursor_up)
        nmap <buffer><silent> l             <Plug>(vimfiler_smart_l)
        nmap <buffer><silent> h             <Plug>(vimfiler_smart_h)
        nmap <buffer><silent> gg            <Plug>(vimfiler_cursor_top)
        nmap <buffer><silent> <Space>       <Plug>(vimfiler_toggle_mark_current_line)
        nmap <buffer><silent> *             <Plug>(vimfiler_toggle_mark_all_lines)
        nmap <buffer><silent> t             <Plug>(vimfiler_expand_tree)
        nmap <buffer><silent> T             <Plug>(vimfiler_expand_tree_recursive)
        nmap <buffer><silent> c             <Plug>(vimfiler_copy_file)
        nmap <buffer><silent> m             <Plug>(vimfiler_move_file)
        nmap <buffer><silent> d             <Plug>(vimfiler_delete_file)
        nmap <buffer><silent> r             <Plug>(vimfiler_rename_file)
        nmap <buffer><silent> K             <Plug>(vimfiler_make_directory)
        nmap <buffer><silent> N             <Plug>(vimfiler_new_file)
        nmap <buffer><silent> yy            <Plug>(vimfiler_yank_full_path)

        nmap <buffer><silent> <Tab>         <Plug>(vimfiler_switch_to_another_vimfiler)
        nmap <buffer><silent> ~             <Plug>(vimfiler_switch_to_home_directory)
        nmap <buffer><silent> \             <Plug>(vimfiler_switch_to_root_directory)
        nmap <buffer><silent> &             <Plug>(vimfiler_switch_to_project_directory)
        nmap <buffer><silent> <C-j>         <Plug>(vimfiler_switch_to_history_directory)
        nmap <buffer><silent> <BS>          <Plug>(vimfiler_switch_to_parent_directory)

        " Lはウインドウサイズ調整にマッピングしてるので別のキーを割り当てておく
        " nmap <buffer><silent> L             <Plug>(vimfiler_switch_to_drive)
        nmap <buffer><silent> D             <Plug>(vimfiler_switch_to_drive)

        nmap <buffer><silent> e             <Plug>(vimfiler_edit_file)
        nmap <buffer><silent> E             <Plug>(vimfiler_split_edit_file)
        nmap <buffer><silent> B             <Plug>(vimfiler_edit_binary_file)
        nmap <buffer><silent> <Enter>       <Plug>(vimfiler_cd_or_edit)

        nmap <buffer><silent> <C-l>         <Plug>(vimfiler_redraw_screen)
        nmap <buffer><silent> S             <Plug>(vimfiler_select_sort_type)
        nmap <buffer><silent> a             <Plug>(vimfiler_choose_action)
        nmap <buffer><silent> .             <Plug>(vimfiler_toggle_visible_ignore_files)
        nmap <buffer><silent> ge            <Plug>(vimfiler_execute_external_filer)

        " ややこしいからqで常に閉じるようにしよう
        nmap <buffer><silent> q             <Plug>(vimfiler_close)
        " nmap <buffer><silent> q             <Plug>(vimfiler_hide)
        " nmap <buffer><silent> Q             <Plug>(vimfiler_exit)
        " nmap <buffer><silent> -             <Plug>(vimfiler_close)

        " pでpreviewの方が直観的かな
        " nmap <buffer><silent> v             <Plug>(vimfiler_preview_file)
        nmap <buffer><silent> p             <Plug>(vimfiler_preview_file)


        nmap <buffer><silent> !             <Plug>(vimfiler_execute_shell_command)
        nmap <buffer><silent> gr            <Plug>(vimfiler_grep)
        nmap <buffer><silent> gf            <Plug>(vimfiler_find)

        " ?だけでhelpの方がわかりやすくない？
        " nmap <buffer><silent> g?            <Plug>(vimfiler_help)
        nmap <buffer><silent> ?            <Plug>(vimfiler_help)

        nmap <buffer><silent> x             <Plug>(vimfiler_execute_system_associated)
        nmap <buffer><silent> X             <Plug>(vimfiler_execute_vimfiler_associated)
        nmap <buffer><silent> <RightMouse>  <Plug>(vimfiler_execute_external_filer)
        nmap <buffer><silent> <S-LeftMouse> <Plug>(vimfiler_toggle_mark_current_line)
        nmap <buffer><silent> <2-LeftMouse> <Plug>(vimfiler_double_click)
        vmap <buffer><silent> <Space>       <Plug>(vimfiler_toggle_mark_selected_lines)
    endfunction

    AutocmdFT vimfiler call s:MyVimFilerKeyMapping()
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


if ! empty(neobundle#get('ctrlp.vim'))
    let g:ctrlp_map = ''
    let g:ctrlp_use_migemo          = 1
    let g:ctrlp_use_caching         = 1
    let g:ctrlp_lazy_update         = 0
    let g:ctrlp_show_hidden         = 1
    let g:ctrlp_clear_cache_on_exit = 0    " 終了時キャッシュをクリアしない
    let g:ctrlp_mruf_max            = 5000 " MRUの最大記録数
    let g:ctrlp_regexp = 1
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'

    nnoremap          [ctrlp]  <nop>
    nmap     <C-p>    [ctrlp]
    nnoremap <silent> [ctrlp]<C-p>    :<C-u>CtrlP<CR>
    nnoremap <silent> [ctrlp]<C-b>    :<C-u>CtrlPBuffer<CR>
    nnoremap <silent> [ctrlp]<C-m>    :<C-u>CtrlPMRU<CR>
    nnoremap <silent> [ctrlp]<C-r>    :<C-u>CtrlPRoot<CR>
    nnoremap <silent> [ctrlp]<C-g>    :<c-u>CtrlPGhq<cr>
    let g:ctrlp_ghq_actions = [
    \ {"label": "Open", "action": "e", "path": 1},
    \ {"label": "Look", "action": "!ghq look", "path": 0},
    \]
    let ctrlp_ghq_default_action = 'e'
    let g:ctrlp_ghq_cache_enabled = 1

    if has('win32') || has('win64')
        let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*|^C:\\tmp\\.*'
    else
        let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
    endif
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|neocon|neocomplcache|neocomplete|cache|[Bb]uild|[Dd]oxy.*)$',
        \ 'file': '\v\.(mp3|mp4|bmp|jpg|png|pdf|zip|m4a|pkg|gz|'.
        \               'o|obj|a|exe|dll|so|swp|ttf|mov|avi|dmg|rar|xls|mobi)$',
        \ }
endif

if ! empty(neobundle#get('clever-f.vim'))
    " 大文字を入力した時だけ大文字小文字を区別する、しない
    let g:clever_f_smart_case = 1
    " migemoを使用する、しない
    let g:clever_f_use_migemo = 1
    " 行をまたいでf検索をしない、する
    let g:clever_f_across_no_line = 1
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
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_yaml_checkers = ['yamllint']

    nnoremap         [syntastic]  <nop>
    nmap    <Space>s [syntastic]
    noremap [syntastic]s :<C-u>SyntasticCheck<CR>
    noremap [syntastic]r :<C-u>SyntasticReset<CR>
    noremap [syntastic]i :<C-u>SyntasticInfo<CR>
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
                \ 'hook/shebang/enable': 1,
                \ 'runner/vimproc/updatetime' : 200,
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
    " メモファイル保存先
    let g:qfixmemo_dir = '~/Dropbox/qfixmemo'
    " MRUファイル保存先
    let g:QFixMRU_Filename = g:qfixmemo_dir .'/.qfixmru'
    let QFixHowm_DiaryFile = '~/Dropbox/qfixmemo/diary/%Y/diary-%Y%m%d.howm'
    "予定・TODOの検索先
    let g:QFixHowm_ScheduleSearchDir = '~/Dropbox/qfixmemo/diary'
    " MRUの基準ディレクトリ
    let g:QFixMRU_RootDir = g:qfixmemo_dir

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
        " let g:MyGrep_cygwin17 = 1
        "" 使用するgrep(Windows)
        "let mygrepprg = 'findstr'
        let g:mygrepprg = 'grep'
        " 日本語が含まれる場合のgrep指定
        " let myjpgrepprg = 'grep'
        let g:myjpgrepprg = ''
        " 外部grep(shell)のエンコーディング(Windows)
        " let g:MyGrep_ShellEncoding = 'cp932'
        let g:MyGrep_ShellEncoding = 'utf-8'
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
    " let g:MyGrepcmd_useropt = ""
    "             \ . " -i -n -I -D skip"
    "             \ . " --exclude-dir=.git"
    "             \ . " --exclude-dir=.svn"
    "             \ . " --exclude-dir=.hg"
    "             \ . " --exclude-dir=res"
    "             \ . " --exclude-dir=resource"
    "             \ . " --exclude-dir=bin"
    "             \ . " --exclude-dir=lib"
    "             \ . " --exclude-dir=libs"
    "             \ . " --exclude-dir=[Dd]oxygen"
    "             \ . " --exclude-dir=[Bb]uild"
    "             \ . " --exclude-dir='CMake*'"
    "             \ . " --exclude-dir='**/picox/docs/apidoc'"
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

    let g:qfixmemo_title    = '#'
    " メモファイルのファイル名
    let g:qfixmemo_filename      = '%y%m%d-%H%M%S.md'
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

    let qfixmemo_timeformat       = '<!-- %Y-%m-%d %H:%M -->'

    " qfixmemo#UpdateTime()でタイムスタンプの置換に使用する正規表現(Vim)
    let qfixmemo_timeformat_regxp = '<!-- \d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2} -->'

    " タイムスタンプ行とみなす正規表現(Vim)
    let qfixmemo_timestamp_regxp  = qfixmemo_timeformat_regxp

    " qfixmemo#AddTitle()で擬似タイトル行とみなす正規表現(Vim)
    let qfixmemo_alt_title_regxp  = ''

    " QFixMemoを起動しない場合でも終了時にMRUを保存する
    let g:QFixMRU_VimLeaveWrite = 1

    " タイトル行検索の正規表現を初期化
    let g:QFixMRU_Title = {}

    " MRU登録用の正規表現(Vim)を指定
    let g:QFixMRU_Title['mkd']  = '^#[^#]'
    let g:QFixMRU_Title['md']   = g:QFixMRU_Title['mkd']
    let g:QFixMRU_Title['vim']  = '^\s*\(silent!\?\)\?\s*func'
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
    let g:qfixmemo_use_addtitle        = 0
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
    "予定・TODOの検索ファイル名指定
    let g:QFixHowm_ScheduleSearchFile = ''
endif

if ! empty(neobundle#get('JpFormat.vim'))
    " 文字数指定を半角/全角単位にする
    " 1:半角
    " 2:全角
    let JpFormatCountMode = 2
    " 原稿(折り返し)全角文字数
    " let JpCountChars = 40
    let JpCountChars = 120

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

if ! empty(neobundle#get('vim-fakeclip'))
    let g:fakeclip_terminal_multiplexer_type="gnuscreen"
endif

if ! empty(neobundle#get('vim-scratch'))
    nnoremap <Space>sc :<C-u>Scratch<CR>
endif

if ! empty(neobundle#get('ZoomWin'))
    " デフォルトのキーマップは<C-w>oだが、tmuxのキーバインドと合わせて<C-w>zとす
    " る。
    nnoremap <C-w>z :<C-u>ZoomWin<CR>
endif

if ! empty(neobundle#get('vinarise'))
    let g:vinarise_enable_auto_detect = 0
endif

if ! empty(neobundle#get('vim-altr'))
    nnoremap <silent><C-w>a :<C-u>call altr#forward()<CR>
    nnoremap <silent><C-w>A :<C-u>call altr#back()<CR> <S
endif

if ! empty(neobundle#get('vimshell'))
    nnoremap <Space>vs :<C-u>VimShellBufferDir<CR>
    let g:vimshell_interactive_update_time = 0
    " let g:vimshell_interactive_update_time = 2000
endif

if ! empty(neobundle#get('open-browser.vim'))
    nmap        <Leader>o       <Plug>(openbrowser-smart-search)
    xmap        <Leader>o       <Plug>(openbrowser-smart-search)
    nnoremap    [openbrowser]   <nop>
    nmap        <Space>o        [openbrowser]
    nnoremap    [openbrowser]o  :<C-u>OpenBrowserSmartSearch<Space>
    nnoremap    [openbrowser]w  :<C-u>OpenBrowserSearch -weblio<Space>
    nnoremap    [openbrowser]O  :<C-u>OpenGithubFile<CR>
    vnoremap    [openbrowser]O  :OpenGithubFile<CR>
    let g:openbrowser_search_engines = {
        \ 'weblio': 'http://ejje.weblio.jp/content/{query}',
    \}
endif

if ! empty(neobundle#get('tagbar'))
    nnoremap <Space>tt :<C-u>TagbarToggle<CR>
    let g:tagbar_left = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_map_togglesort = "r"
    let g:tagbar_singleclick = 1
    let g:tagbar_autoshowtag = 1
    let g:tagbar_autopreview = 0
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Headline'
        \ ],
        \ 'sort' : 0,
    \ }
endif


if ! empty(neobundle#get('vim-rooter'))
    let g:rooter_manual_only = 1
endif


if ! empty(neobundle#get('DoxyGen-Syntax'))
    " WORKAROUND:
    " フラグをセットしてデフォルトのシンタックスハイライトを無理やり読み込ませな
    " いようにし、'DoxyGen-Syntax'の設定を優先させる。
    let g:load_doxygen_syntax=1
endif


if ! empty(neobundle#get('previm'))
    let g:previm_disable_default_css = 0
    let g:previm_custom_css_path = expand('~/Dropbox/dev/tools/github.css')
endif


if ! empty(neobundle#get('lightline.vim'))
    let g:lightline = {
        \ 'active' : {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype', 'bufnum'] ]
        \ },
        \ 'inactive' : {
        \   'left': [ [ 'filename' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'bufnum' ],
        \              [ 'percent' ] ]
        \ }
        \ }

    let g:lightline.component = {
        \   'bufnum': 'buf %n'
        \}
endif


if ! empty(neobundle#get('DirDiff.vim'))
    let g:DirDiffExcludes = "CVS,.git,.hg,*.class,*.o"
    let s:path = expand('~/.grepignore')
    if filereadable(s:path)
        let g:DirDiffExcludes = join(readfile(s:path), ',')
    endif
    let g:DirDiffIgnore = "Id:"

    " diff --help
    " -w  --ignore-all-space        Ignore all white space.
    " -B  --ignore-blank-lines      Ignore changes whose lines are all blank.
    let g:DirDiffAddArgs = "-wB"
    let g:DirDiffEnableMappings = 1
endif

if ! empty(neobundle#get('yankround.vim'))
    nmap p <Plug>(yankround-p)
    xmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    xmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)

    " 推奨設定の<C-p>はctrlp.vimとかぶる。
    " かといって他にあんまりいいキーマップの空きがないな～・・・。
    " <C-n>に割り当てるとなぜかquickfixで<CR>押下時にジャンプできなくなった。
    nmap <C-q> <Plug>(yankround-prev)
    nmap <C-e> <Plug>(yankround-next)
endif

if ! empty(neobundle#get('calendar.vim'))
    let g:calendar_google_task = 0
    let g:calendar_google_task = 0
    let g:calendar_cache_directory = expand('~/Dropbox/calendar-vim')
    let g:calendar_google_calendar = 0
endif


if ! empty(neobundle#get('indentLine'))
    let g:indentLine_fileType = ['python', 'ruby', 'make', 'sh', 'xml']
endif

if ! empty(neobundle#get('vim-gitgutter'))
    " 自動で差分が表示されるのはちょっと煩わしいのでデフォルトはOFFにしておく
    " :GitGutterEnable, GitGutterDisable等で明示的に実行する。
    let g:gitgutter_enabled = 0

    let g:gitgutter_realtime = 1
    let g:gitgutter_async = 1
endif

if ! empty(neobundle#get('YouCompleteMe'))
    " デフォルトのYCM設定
    let g:ycm_global_ycm_extra_conf = expand('~/.ycm_extra_conf.py')
    " .ycm_extran_conf.py
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_always_populate_location_list = 1
    let g:ycm_auto_trigger = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1

    let g:ycm_filetype_whitelist = {
        \ 'c': 1,
        \ 'cpp': 1,
        \ 'go': 1,
        \}

    function! s:youcompleteme_settings()
        " デフォルトのタグジャンプキーバインドを置き換える
        " nnoremap <silent><buffer> <C-]> :<C-u>YcmCompleter GoToDefinition<CR>
        nnoremap <silent><buffer> <C-]> :<C-u>YcmCompleter GoTo<CR>
    endfunction
    AutocmdFT c,cpp,go call s:youcompleteme_settings()
endif

if ! empty(neobundle#get('vim-ref'))
    " language message C に設定していると、manが英語になってしまったので、コマン
    " ド引数で日本語指定をしておく。
    let g:ref_man_cmd = 'man -L ja -Tutf8'
endif

if ! empty(neobundle#get('vim-markdown'))
    " foldingは重すぎるので無効にしておく
    let g:vim_markdown_folding_disabled = 1
    " let g:vim_markdown_folding_disabled = 0

    " テキストを変に隠したりするのは逆に編集しづらいと感じるのでOFF
    let g:vim_markdown_conceal = 0

    " let g:vim_markdown_folding_style_pythonic = 1
    let g:vim_markdown_folding_level = 3
    " let g:vim_markdown_no_default_key_mappings = 1

    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_frontmatter = 1
    let g:vim_markdown_toml_frontmatter = 1
    let g:vim_markdown_json_frontmatter = 1
    let g:vim_markdown_new_list_item_indent = 2
    let g:vim_markdown_fenced_languages = ['dos=dosbatch', 'jinja=jinja2', 'j2=jinja2']
else
    " 外部pluginなしでfencedブロックのシンタックスハイライトを有効にしたい時は、
    " 明示的に有効なファイルタイプを指定しておかなければならない。
    let g:markdown_fenced_languages = [
        \ 'vim', 'qmake', 'python', 'ruby', 'sh', 'c', 'cpp', 'ps1', 'lua',
        \ 'gitconfig', 'cmake', 'help', 'conf', 'dosbatch'
        \ ]
endif


" let g:list2tree_charset_ascii=1

" なんか.vimrcの上の方でこの設定をすると、効いてなかったので、他のトコで上書きさ
" れてる？とりあえず一番最後に設定することで回避する。
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" お気に入りのカラースキーム 'w0ng/vim-hybrid'
colorscheme hybrid
set background=dark

call UpdatePath()
call SourceIfExist($HOME.'/.local.vimrc')
if(s:is_git_dir())
    call SourceIfExist(GitRootDir() . '/.local.vimrc')
endif
