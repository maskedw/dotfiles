"" vi互換off
set nocompatible
syntax enable
set encoding=utf-8
if has('win32') || has('win64')
    set runtimepath+=~/vimfiles/
    set fileformat=dos
else
    set runtimepath+=~/.vim/
    set fileformat=unix
endif

if has('vim_starting')
    filetype off
    filetype plugin indent off
    set runtimepath+=~/vim.d/bundle/neobundle.vim/,~/.vim/after
    call neobundle#rc(expand('~/vim.d/bundle/'))
    filetype on
    filetype plugin indent on
endif


runtime! vimrc/basic.vim

runtime! vimrc/pyclewn_rc.vim

""NeoBundleの色々な指定方法
"NeoBundle 'https://github.com/Shougo/neocomplete.vim.git'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/vimfiler', '9dbf244928a939b4e885225954d46afba133382f'
"NeoBundle 'qfixapp', {'type' : 'nosync', 'base' : '~/bundle' }


"強力補完
NeoBundle 'https://github.com/Shougo/neocomplete.vim.git'
runtime! vimrc/neocomplete_rc.vim


NeoBundle 'https://github.com/Rip-Rip/clang_complete.git'
runtime! vimrc/clang_complete_rc.vim


NeoBundle 'Shougo/neosnippet'
runtime! vimrc/neosnippet_rc.vim


"Vim内ファイラー
NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
runtime! vimrc/vimfiler_rc.vim


"Vimランチャー
NeoBundle 'Shougo/unite.vim'
runtime! vimrc/unite_rc.vim


NeoBundle 'Lokaltog/vim-easymotion'
runtime! vimrc/easymotion_rc.vim


"スクラッチバッファ作成
NeoBundle 'https://github.com/duff/vim-scratch.git'


"Git支援
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/tpope/vim-git.git'
NeoBundle 'https://github.com/gregsexton/gitv.git'
NeoBundle 'https://github.com/motemen/git-vim.git'
runtime! vimrc/git_rc.vim


"構文チェック
NeoBundle 'https://github.com/scrooloose/syntastic.git'
runtime! vimrc/syntastic_rc.vim


"Python補完
NeoBundle 'davidhalter/jedi-vim'
runtime! vimrc/jedi_rc.vim


NeoBundle 'https://github.com/vim-scripts/bash-support.vim.git'
runtime! vimrc/bash_support_rc.vim


"Doxygen支援
NeoBundle 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
NeoBundle 'https://github.com/vim-scripts/doxygen-support.vim.git'
runtime! vimrc/doxygen_rc.vim


NeoBundle 'https://github.com/vim-scripts/YankRing.vim.git'
runtime! vimrc/yankring_rc.vim


"リファレンス
NeoBundle 'https://github.com/thinca/vim-ref.git'
runtime! vimrc/ref_rc.vim


NeoBundle 'https://github.com/thinca/vim-quickrun.git'
runtime! vimrc/quickrun_rc.vim


NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
runtime! vimrc/SrcExpl_rc.vim


"日本語サポート
NeoBundle 'https://github.com/fuenor/JpFormat.vim.git'
NeoBundle 'https://github.com/fuenor/im_control.vim.git'
runtime! vimrc/jp_rc.vim


NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/echodoc'


"CUI版Vimでもクリップボードを使用できるようにすうる。
NeoBundle 'https://github.com/kana/vim-fakeclip.git'


"GVimのカラースキームをCUIでの使えるように変換する
NeoBundle 'https://github.com/godlygeek/csapprox.git'
NeoBundle 'https://github.com/thinca/vim-guicolorscheme.git'


"ステータスラインをかっこよくする
"NeoBundle 'https://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'bling/vim-airline'


"タグファイルを利用して便利にする
NeoBundle 'https://github.com/majutsushi/tagbar.git'
"NeoBundle 'https://github.com/mortice/taglist.vim.git'
runtime! vimrc/tagbar_rc.vim


"整形
NeoBundle 'https://github.com/vim-scripts/Align.git'
NeoBundle 'https://github.com/vim-scripts/RST-Tables.git'


"Textで図形とか頑張ってかく。
NeoBundle 'https://github.com/vim-scripts/DrawIt.git'


"cscope支援
NeoBundle 'https://github.com/vim-scripts/CCTree.git'


"ウインドウの状態等の保存と復元
NeoBundle 'https://github.com/osyo-manga/vim-reanimate.git'

" メモ
NeoBundle 'https://github.com/fuenor/qfixhowm.git'
runtime! vimrc/qfixhowm_rc.vim
NeoBundle 'https://github.com/vim-scripts/vimwiki.git'
runtime! vimrc/vimwiki_rc.vim
NeoBundle 'https://github.com/Rykka/riv.vim.git'
NeoBundle 'https://github.com/rcmdnk/vim-markdown.git'


NeoBundle 'https://github.com/itchyny/calendar.vim.git'
NeoBundle 'https://github.com/vim-scripts/trinity.vim.git'
NeoBundle 'https://github.com/vim-scripts/TagHighlight.git'
NeoBundle 'https://github.com/vim-scripts/a.vim.git'
NeoBundle 'https://github.com/vim-scripts/ifdef-highlighting.git'
NeoBundle 'https://github.com/vim-scripts/DirDiff.vim.git'
NeoBundle 'https://github.com/taku-o/vim-changed.git'
NeoBundle 'https://github.com/liotaz/BlockDiff.git'
NeoBundle 'https://github.com/vim-scripts/Mixed-sourceassembly-syntax-objdump.git'
NeoBundle 'https://bitbucket.org/kh3phr3n/vim-qt-syntax.git'
NeoBundle 'vim-jp/cpp-vim'
"Unite -auto-preview colorscheme
NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'https://github.com/Shougo/neomru.vim.git'
NeoBundle 'https://github.com/Shougo/unite-outline.git'
runtime! vimrc/misc_rc.vim


" Color theme
NeoBundle 'https://github.com/altercation/solarized.git'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'https://github.com/jnurmine/Zenburn.git'
"NeoBundle 'https://github.com/vim-scripts/desert.vim.git'
"NeoBundle 'https://github.com/jeffreyiacono/vim-colors-wombat.git'
"NeoBundle 'https://github.com/chriskempson/tomorrow-theme.git'
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'vim-scripts/rdark'
"NeoBundle 'vim-scripts/jammy.vim'

colorscheme hybrid
