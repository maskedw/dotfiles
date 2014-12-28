" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nospell
scriptencoding utf-8
set shellslash
set shell=bash.exe
set shellslash
set shellcmdflag=-c
set shellpipe=\|&\ tee
set shellredir=>%s\ 2>&1
" if has("gui_win32")
" 	if $TERM == ""
" 		set shell=bash.exe\ --login
" 	else
" 		set shell=bash.exe
" 	endif
" 	set shellslash
" endif
" set shellslash
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
NeoBundle 'lambdalisue/vim-gista'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'idanarye/vim-merginal'

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
" GVim‚ÌƒJƒ‰[ƒXƒL[ƒ€‚ğCUI”Å‚Å‚àg‚¦‚é‚æ‚¤‚É•ÏŠ·‚·‚é
NeoBundle 'godlygeek/csapprox'
NeoBundle 'thinca/vim-guicolorscheme'
" CUI”ÅVim‚Å‚àƒNƒŠƒbƒvƒ{[ƒh‚ğg—p‚Å‚«‚é‚æ‚¤‚É‚·‚é
NeoBundle 'kana/vim-fakeclip'
" ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ğ‚©‚Á‚±‚æ‚­‚·‚é
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'liotaz/BlockDiff'
" ƒXƒNƒ‰ƒbƒ`ƒoƒbƒtƒ@
NeoBundle 'duff/vim-scratch'
" ŠÖ˜A‚·‚éƒtƒ@ƒCƒ‹‚ğŠJ‚«‚â‚·‚­‚·‚éB
NeoBundle 'kana/vim-altr'
" ‚©‚Á‚¿‚å‚¢‚¢ƒJƒ‰[ƒe[ƒ}
NeoBundle 'w0ng/vim-hybrid'


" NeoBundle 'vim-scripts/YankRing.vim'
" ƒŠƒtƒ@ƒŒƒ“ƒX‚ÌQÆ
NeoBundle 'thinca/vim-ref'
" .git‚Æ‚©‚ÌƒfƒBƒŒƒNƒgƒŠ‚ğ”F¯‚µ‚ÄŠy‚ÉˆÚ“®‚Å‚«‚é‚æ‚¤‚É‚·‚éB
NeoBundle "airblade/vim-rooter"
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'sudo.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/webapi-vim'


" ”ñ“¯Šúˆ—
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
" " C++—p‚Ìƒvƒ‰ƒOƒCƒ“
" ‚Ç‚¤‚à‘¼‚ÌC/C++ƒvƒ‰ƒOƒCƒ“‚àLazy‚É‚µ‚Ä‚¢‚é‚ÆAclang_complete‚Ì•âŠ®‚ªŒø‚©‚È‚­‚È
" ‚é‚ª‚ ‚éB‚æ‚­‚í‚©‚ç‚ñ‚ªA‘¼‚Ì‚ÍLazy‚ğ‚â‚ß‚Ä‚¨‚­B
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
" ƒtƒ@ƒCƒ‹‚Ì’TõƒpƒX
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

" V‚µ‚¢s‚ÌƒCƒ“ƒfƒ“ƒg‚ğŒ»İs‚Æ“¯‚¶‚É‚·‚é
set autoindent

" ƒ^ƒu‚Æ‘Î‰‚·‚é‹ó”’‚Ì”
set tabstop=4

" ‚±‚ê‚Í‹““®‚ª‚æ‚­‚í‚©‚ç‚ñ‚Ì‚Å0(–³Œø)‚Æ‚éB
set softtabstop=0

" vim‚ª‘}“ü‚·‚é©“®ƒCƒ“ƒfƒ“ƒg•‚ÍŒ©‚½–Úã‚Ì‹ó”’‰½•¶š•ª‚©
set shiftwidth=4

" ƒCƒ“ƒfƒ“ƒg‚ğshiftwidth‚Ì”{”‚É‚Ü‚é‚ß‚éB
set shiftround

" TAB - SPACE •ÏŠ·
set expandtab

" ƒEƒCƒ“ƒhƒE‚Éû‚Ü‚ç‚È‚¢s‚ÍÜ‚è•Ô‚µ‚Ä•\¦‚·‚éB
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


" ŒŸõ‚ªƒtƒ@ƒCƒ‹––”ö‚Ü‚Åi‚ñ‚¾‚çƒtƒ@ƒCƒ‹æ“ª‚©‚çÄ‚ÑŒŸõ‚·‚éB
set wrapscan

" •Â‚¶Š‡ŒÊ‚ª“ü—Í‚³‚ê‚½‚Æ‚«A‘Î‰‚·‚éŠ‡ŒÊ‚ğ•\¦‚·‚é
set showmatch

" ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ÉsA—ñ•\¦
set ruler

" ƒXƒe[ƒ^ƒXƒo[‚ğí‚É•\¦‚·‚é
set laststatus=2

" í‚ÉƒJ[ƒ\ƒ‹s‚ª‰æ–Ê’†‰›‚É‚­‚é‚æ‚¤‚É‚·‚éB
set scrolloff=1000

" ‰üs‚É—Ç‚¢Š‡ŒÊ‚Æ‚©‚Ì•¶–¬‚É‚»‚Á‚½‚¢‚¢Š´‚¶‚Ì©“®ƒCƒ“ƒfƒ“ƒg‚ğg—p‚·‚éB
set smartindent

"ŒŸõ‚â’uŠ·‚É‘å•¶šA¬•¶š‚ğ‹æ•Ê‚·‚éB‹æ•Ê‚µ‚È‚¢‚æ‚¤‚É‚µ‚½‚¢‚Æ‚«‚Í
"ƒpƒ^[ƒ“‚Ì‚Ç‚±‚©‚É\c‚ğ‚Ó‚­‚ß‚é‚© set ignorecase‚Æ‚·‚éB
set noignorecase

"ŒŸõ‚É‘å•¶š‚ğŠÜ‚ñ‚Å‚¢‚½‚ç‘å/¬‚ğ‹æ•Ê‚·‚éB
set smartcase

" ƒrƒWƒ…ƒAƒ‹ƒxƒ‹–³Œø
set novb t_vb=

" ƒ^ƒu•¶š‚ÆAs––‹ó”’‚ğ‰Â‹‰»
set list

" “Áê•¶š‚ÌŒ©‚¦•û
set listchars=tab:>-,trail:-",eol:$

" ƒXƒvƒ‰ƒbƒVƒ…‰æ–Ê‚ğ•\¦‚µ‚È‚¢
set shortmess& shortmess+=I

" IM(ƒCƒ“ƒvƒbƒgƒƒ\ƒbƒh)‚ğg—p‚·‚é
set noimdisable

" ƒ^ƒuƒy[ƒW‚ª2ŒÂˆÈã‚ ‚é‚Æ‚«‚¾‚¯ƒ‰ƒxƒ‹‚ğ•\¦‚·‚éB
set showtabline=1

"ƒCƒ“ƒNƒŠƒƒ“ƒ^ƒ‹ƒT[ƒ`—LŒø
set incsearch

" ŒŸõŒ‹‰Ê‚ğƒnƒCƒ‰ƒCƒg‚·‚é
set hlsearch

" ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ƒ‚[ƒh‚ÅƒRƒ}ƒ“ƒhƒEƒCƒ“ƒhƒE‚ğo‚·ƒL[
set cedit=<C-c>

" ƒoƒbƒNƒXƒy[ƒX‚Å“Áê‚È•¶š‚ğÁ‚¹‚é‚æ‚¤‚É‚·‚é
set backspace=indent,eol,start

" ƒeƒLƒXƒg®Œ`‚Ìİ’èBŠeƒtƒ‰ƒO‚ÌˆÓ–¡‚Í:help formatoptions‹y‚Ñ:help fo-table‚ğQÆ
set formatoptions& formatoptions+=tcroqnmMj

" 8i”ƒCƒ“ƒNƒŠƒƒ“ƒg‚ğƒIƒt‚É‚·‚é
set nrformats-=octal

" ƒoƒbƒtƒ@‚ğ•Â‚¶‚é‚Æ‚«‚É‰B‚µó‘Ô‚É‚·‚é
set hidden

" help‚Ì—Dæ‡ˆÊ
set helplang=ja,en

" ƒNƒŠƒbƒvƒ{[ƒh‚ğOS‚Æ‹¤—p‚É‚·‚é
if (has('unix'))
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" ‹éŒ`‘I‘ğ‚Å©—R‚ÉˆÚ“®‚·‚é
set virtualedit& virtualedit+=block

" ‰üsƒR[ƒh‚Ì©“®”F¯
if has('win32') || has('win64')
    set fileformats=dos,unix,mac
else
    set fileformats=unix,dos,mac
endif

" ©“®®Œ`‚Ì‘ÎÛ‚Æ‚È‚éƒeƒLƒXƒg•B‚±‚±‚Å‚Í0‚ğw’è‚µ‚Ä‚¨‚«Aƒtƒ@ƒCƒ‹ƒ^ƒCƒv•Ê
" ƒvƒ‰ƒOƒCƒ“‚ÅŒÂ•Ê‚Éw’è‚·‚é‚±‚Æ‚É‚·‚éB
set textwidth=0

" ƒRƒ}ƒ“ƒhÀs’†‚àÄ•`‰æ‚·‚éB
set nolazyredraw

" ‚‘¬ƒ^[ƒ~ƒiƒ‹Ú‘±‚ğs‚¤
set ttyfast

" •âŠ®Œó•â‚ªˆê‚Â‚¾‚¯‚Å‚àƒ|ƒbƒvƒAƒbƒv‚ğ•\¦‚·‚éB
set completeopt=menuone

" Ü‚è‚½‚½‚İ‚ğ—LŒø‚É‚·‚éB
set foldenable

" ƒ}ƒ‹ƒ`ƒ}ƒCƒg•¶š‚ª‚ ‚Á‚Ä‚àƒJ[ƒ\ƒ‹‚ª‚¸‚ê‚È‚¢‚æ‚¤‚É‚·‚éB
set ambiwidth=double

" “Ç‚İ‚ñ‚Å‚¢‚éƒtƒ@ƒCƒ‹‚ªŠO•”‚ÌƒvƒƒOƒ‰ƒ€‚Å•ÏX‚³‚ê‚½‚ç©“®‚Å“Ç‚İ‚È‚¨‚·B
set autoread

" " h ‚Æ l ‚Ås‚ğŒ×‚°‚é‚æ‚¤‚É‚·‚é
" set whichwrap +=h
" set whichwrap +=l

" 256Fƒ‚[ƒh
set t_Co=256

" Ü‚è•Ô‚µ‚ÅƒCƒ“ƒfƒ“ƒg‚ğ•Û
if exists('+breakindent')
    set breakindent
    set breakindentopt=shift:-4
    let &showbreak = '>>> '
endif

" CUIvim‚Å‚àƒ}ƒEƒX‘€ì‚ğ—LŒø‚É‚·‚é
set mouse=a

" ‘¼‚ÌƒvƒƒOƒ‰ƒ€‚Åƒtƒ@ƒCƒ‹‚ª‘‚«Š·‚¦‚ç‚ê‚½‚ç©“®‚Å“Ç‚İ’¼‚·
set autoread

" ƒL[ƒ}ƒbƒvƒŠ[ƒ_[‚ğƒfƒtƒHƒ‹ƒg‚Ì'\'‚©‚ç•ÏX
"let mapleader = ","

"“ü—Í“r’†‚ÌƒRƒ}ƒ“ƒh‚ğ‰E‰º‚É•\¦‚·‚é
set showcmd

if has('win32') || has('win64')
" !!
" gitv‚â‚çƒvƒ‰ƒOƒCƒ“‚ªƒtƒ@ƒCƒ‹‚ğŠJ‚¯‚Ü‚¹‚ñ“I‚ÈƒGƒ‰[‚ğ“f‚­‚æ‚¤‚É‚È‚Á‚½‚Ì‚ÅAƒRƒƒ“ƒg‰»‚µ‚Æ‚­B
    "set shell=nyaos.exe
    "set shellcmdflag=-e
    ""set shellpipe=\|&\ tee
    "set shellpipe=
    "set shellredir=>%s\ 2>&1
    "set shellxquote=\"
    let $CYGWIN = 'nodosfilewarning'
endif

" CursolHoldƒCƒxƒ“ƒg
set updatetime=500

" ƒRƒ}ƒ“ƒhÀs’†‚ÍÄ•`‰æ‚µ‚È‚¢
set lazyredraw

" ‚‘¬ƒ^[ƒ~ƒiƒ‹Ú‘±‚ğs‚¤
set ttyfast

"=== @tags
set tags&
if has('path_extra')
    set tags+=tags;
endif

"ƒRƒ}ƒ“ƒh•âŠ®‚ÉŠÖ‚·‚éİ’è
set wildmode=longest:full,full

set completeopt=menuone

" ƒ^ƒuİ’è
set showtabline=0


" •¶š‚ª‚È‚¢êŠ‚Å‚Ìƒy[ƒXƒg‚É‹ó”’‚ğ‹l‚ß‚é
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" ŠO•”‚©‚çƒy[ƒXƒg‚·‚é‚¾‚¯set paste‚Æ‚µ‚Ä‚¨‚­‚ÆãY—í‚É“\‚è‚â‚·‚¢‚ç‚µ‚¢B
set nopaste

"ƒoƒbƒNƒAƒbƒvƒtƒ@ƒCƒ‹‚ğg—p‚·‚é
set backup

"ƒXƒƒbƒvƒtƒ@ƒCƒ‹‚ğg—p‚µ‚È‚¢
set noswapfile

set viewdir=~/vim.d/view
set backupdir=~/vim.d/backup
set directory=~/vim.d/swap
set undodir=~/vim.d/undo
set undofile

"!! ‰½ŒÌ‚©‚±‚ÌƒIƒvƒVƒ‡ƒ“‚ğ—LŒø‚É‚·‚é‚ÆAneocomplcache‚ªˆÙí‚Éd‚­‚È‚éB
"set viminfo=%,'50,/50,:50,<50,@50,h,f1,n~/.viminfo

set sessionoptions=curdir,resize,tabpages,winpos,winsize,unix,slash
"ƒoƒbƒtƒ@‚ÌƒIƒvƒVƒ‡ƒ“‚ÍƒZ[ƒu‚µ‚È‚¢
set viewoptions=cursor,folds,slash,unix
"ƒRƒ}ƒ“ƒh—š—ğ•Û‘¶”
set history=100

"ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“‚Ì‚‚³(gVim—p‚à•Ê‚É—pˆÓ‚·‚é)
set cmdheight=2

"ƒvƒŒƒrƒ…[ƒEƒCƒ“ƒhƒE‚Ì‚‚³
set previewheight=10

set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set ambiwidth=double

"s”Ô†”ñ•\¦
"set nonumber

"s”Ô†•\¦
set number

"‘SŠpƒXƒy[ƒX‚ğ‰Â‹‰»
highlight link ZenkakuSpace Error
match ZenkakuSpace /@/

"ƒc[ƒ‹ƒo[‚ğ”ñ•\¦‚É‚·‚é
set guioptions-=T

"ƒƒjƒ…[ƒo[‚ğ”ñ•\¦‚É‚·‚é
set guioptions-=m

"‰EƒXƒNƒ[ƒ‹ƒo[”ñ•\¦
set guioptions-=r
set guioptions-=R

"¶ƒXƒNƒ[ƒ‹ƒo[”ñ•\¦
set guioptions-=l
set guioptions-=L

"‰ºƒXƒNƒ[ƒ‹ƒo[”ñ•\¦
set guioptions-=b
set matchpairs+=<:>

" "=== @keymap-generic
" " CUI Vim‚Å‚à<Alt->‚ÌƒL[ƒ}ƒbƒv‚ğ‰Â”\‚É‚·‚éBƒVƒtƒg‚à‘g‚İ‡‚í‚¹‚Ä
" " <A-S-n>‚Æ‚©‚àOK
" " [Ql]
" " http://blog.remora.cx/2012/07/using-alt-as-meta-in-vim.html
" let c = 'a'
" while c <= 'z'
"     execute "set <M-" . c . ">=\e" . c
"     execute "imap \e" . c . " <M-" . c . ">"
"     execute "set <M-S-" . c . ">=\e" . toupper(c)
"     execute "imap \e" . toupper(c) . " <M-" . c . ">"
"     let c = nr2char(1+char2nr(c))
" endw
" ã‹LAltƒL[‚Ìİ’è‚É‚æ‚èƒRƒ}ƒ“ƒhƒ‚[ƒh‚ÅESC‚ğ‚Q‰ñ‰Ÿ‚³‚È‚¢‚Æƒm[ƒ}ƒ‹ƒ‚[ƒh‚É–ß
" ‚ê‚È‚­‚È‚é‚Ì‚ÅAESC‚Q˜A‘±‚ğƒ}ƒbƒv‚µ‚Ä‚¨‚­B
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
" s”Ô†•\¦İ’èƒgƒOƒ‹‚ÌƒVƒ‡[ƒgƒJƒbƒg
" nnoremap  <silent> <F1> :<C-u>call ToggleNumberOption2()<CR>
" " ‘Š‘Îs•\¦İ’èƒgƒOƒ‹‚ÌƒVƒ‡[ƒgƒJƒbƒg
" nnoremap  <silent> <F2> :<C-u>call ToggleNumberOption()<CR>
"ƒtƒ‹ƒXƒNƒŠ[ƒ“ƒ‚[ƒh
nnoremap <silent> <F11> :call ToggleFullScreen()<CR>
" ŒŸõƒnƒCƒ‰ƒCƒgÁ‹
nmap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>

" c•ûŒü‚Í˜_—ˆÚ“®‚·‚é
noremap j gj
noremap k gk

" Shift-hjkl‚ÅƒEƒBƒ“ƒhƒEƒTƒCƒY’²®
nnoremap <S-j> <C-w>10-
nnoremap <S-k> <C-w>10+
nnoremap <S-l> <C-w>10>
nnoremap <S-h> <C-w>10<
" Shift + ƒJ[ƒ\ƒ‹ƒL[‚Å‚ÌƒEƒBƒ“ƒhƒEƒTƒCƒY•ÏX
nnoremap <silent><S-Down>  <C-w>10-
nnoremap <silent><S-Up>    <C-w>10+
nnoremap <silent><S-Left>  <C-w>10<
nnoremap <silent><S-Right> <C-w>10>

" Visualƒ‚[ƒh‚Å‘I‚ñ‚¾”ÍˆÍ‚ğ'> | <'‚ÅƒCƒ“ƒfƒ“ƒg’²®
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" Œ»İ‚ÌƒEƒBƒ“ƒhƒE‚Ì‚İ‚ğc‚·
nnoremap <C-w>O <C-w>o
" ƒoƒbƒtƒ@íœ
nnoremap <C-w>d :<C-u>call <SID>delete_current_buf()<CR>
nnoremap <C-w>D :<C-u>bdelete<CR>
nnoremap <silent><Leader>h :<C-u>SmartHelp<Space><C-l>
" ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ƒEƒBƒ“ƒhƒE
" ŒŸõŒã‰æ–Ê‚Ì’†S‚ÉB
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz
"ƒJƒŒƒ“ƒgƒoƒbƒtƒ@‚ÌƒfƒBƒŒƒNƒgƒŠ‚ÖˆÚ“®
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"’¼‘O‚ÌƒRƒ}ƒ“ƒh‚ğÄÀsB@:‚ªƒrƒ‹ƒgƒCƒ“‚Ì•û–@‚¾‚ªA@‚ªYankRing‚Émap‚³‚ê‚Ä‚¢‚é‚Ì
"‚ÅˆÈ‰º‚Å‘ã—p‚·‚éB
nnoremap <C-@> q:<ESC>k<CR>
" " tag‚ğƒvƒŒƒrƒ…[‚ÅŠJ‚­
" nnoremap <silent><Space>s  <C-w>}
" " ƒvƒŒƒrƒ…[ƒEƒCƒ“ƒhƒE‚ğ•Â‚¶‚é
" nnoremap <silent><Space>q  <C-w><C-z>
" nnoremap <silent> <C-c><C-d> :call CdRootDir()<CR>

" " http://gajumaru.ddo.jp/wordpress/?p=1024
" cnoremap OD <Left>
" cnoremap OB <Down>
" cnoremap OA <Up>
" cnoremap OC <Right>
"Emacsƒ‰ƒCƒN‚ÈƒoƒCƒ“ƒfƒBƒ“ƒODƒ|ƒbƒvƒAƒbƒv‚ªo‚È‚¢‚æ‚¤‚ÉˆÚ“®D
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
" Emacsƒ‰ƒCƒN<C-k> http//vim.g.hatena.ne.jp/tyru/20100116
inoremap <silent><expr><C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" ƒNƒŠƒbƒvƒ{[ƒh‚©‚ç“\‚è•t‚¯
cnoremap <C-y> <C-r>+
" ƒLƒƒƒ“ƒZƒ‹
cnoremap <C-g> <C-u><BS>
"ƒoƒbƒtƒ@Ø‚è‘Ö‚¦
nnoremap <silent><C-n>   :<C-u>bnext<CR>
nnoremap <silent><C-p>   :<C-u>bprevious<CR>
"<BS>‚Ì‹““®
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
" ƒVƒ“ƒ{ƒ‹‚ğŒŸõ
nnoremap <silent>[cscope]s :<C-u>cs find s <C-R>=expand("<cword>")<CR><CR>
" ’è‹`‚ğŒŸõ
nnoremap <silent>[cscope]g :<C-u>cs find g <C-R>+ <CR>
" ‚±‚ÌŠÖ”‚©‚çŒÄ‚Î‚ê‚éŠÖ”‚ğŒŸõ
nnoremap <silent>[cscope]d :<C-u>cs find d <C-R>=expand("<cword>")<CR><CR>
" ‚±‚ÌŠÖ”‚ğ“Ç‚ñ‚Å‚¢‚éŠÖ”‚ğŒŸõ
nnoremap <silent>[cscope]c :<C-u>cs find c <C-R>=expand("<cword>")<CR><CR>
" •¶š—ñ‚ğŒŸõ
nnoremap <silent>[cscope]t :<C-u>cs find t <C-R>=expand("<cword>")<CR><CR>
" egrepƒpƒ^[ƒ“‚ğŒŸõ
nnoremap <silent>[cscope]e :<C-u>cs find e <C-R>=expand("<cword>")<CR><CR>
" ‚±‚Ìƒtƒ@ƒCƒ‹‚ğŒŸõ
nnoremap <silent>[cscope]f :<C-u>cs find f <C-R>=expand("<cfile>")<CR><CR>
" ‚±‚Ìƒtƒ@ƒCƒ‹‚ğinclude‚µ‚Ä‚¢‚éƒtƒ@ƒCƒ‹‚ğŒŸõ
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

"ƒJƒŒƒ“ƒgƒfƒBƒŒƒNƒgƒŠ‚ğŒ»İŠJ‚¢‚Ä‚¢‚éƒoƒbƒtƒ@‚ÌƒfƒBƒŒƒNƒgƒŠ‚É‚·‚é
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

" git ‚Ìƒ‹[ƒgƒfƒBƒŒƒNƒgƒŠ‚ğ•Ô‚·
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


" git ‚Ìƒ‹[ƒgƒfƒBƒŒƒNƒgƒŠ‚ğ•Ô‚·
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
            " c•ªŠ„
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
        " ‰¡•‚ğŠm•Û‚Å‚«‚È‚¢‚Æ‚«‚Íƒ^ƒu‚ÅŠJ‚­
        if winwidth(0) < 80
            execute 'quit'
            execute 'tab help ' . a:args
        endif
        silent! AdjustWindowWidth --direction=shrink
    endif
endfunction

" ƒoƒbƒtƒ@‚ğíœ
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
" ƒJ[ƒ\ƒ‹‰º‚ÌƒnƒCƒ‰ƒCƒgƒOƒ‹[ƒv‚ğæ“¾
command! -nargs=0 GetHighlightingGroup
            \ echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '>trans<'
            \ . synIDattr(synID(line('.'),col('.'),0),'name') . '>lo<'
            \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
command! Date :call setline('.', getline('.') . strftime('%Y/%m/%d (%a) %H:%M'))
command! CopyCurrentPath :call s:copy_current_path()
" c•‚Æ‰¡•‚ğŒ©‚Ä help ‚ÌŠJ‚«•û‚ğŒˆ‚ß‚é
command! -nargs=* -complete=help SmartHelp call <SID>smart_help(<q-args>)
" •¶š”ƒJƒEƒ“ƒg
command! -nargs=0 Wc %s/.//nge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO_COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc augroup
" *.md ‚Å“Ç‚İ‚Ş filetype ‚ğ•ÏXiƒfƒtƒHƒ‹ƒg‚Í modula2j
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
" Gnuplot ‚Ìƒtƒ@ƒCƒ‹ƒ^ƒCƒv‚ğİ’è
Autocmd BufRead,BufNew,BufNewFile *.plt,*.plot,*.gnuplot setlocal ft=gnuplot
" Ruby ‚Ì guard —pƒtƒ@ƒCƒ‹
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
" ‘O‰ñI—¹‚µ‚½ƒJ[ƒ\ƒ‹s‚ÉˆÚ“®
Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" Ü‚è‚½‚½‚İ‚Ì‚Ìmkview loadview‚ğ©“®‰»‚·‚é
Autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
Autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" •Û‘¶‚És––‚Ì‹ó”’‚ğœ‹‚·‚é
Autocmd BufWritePre * :%s/\s\+$//ge
Autocmd CmdwinEnter * map <buffer> <S-CR> <CR>q:
Autocmd BufRead,BufNewFile *.dis set filetype=cmix
Autocmd Syntax mixed so ~/.vim/syntax/cmix.vim
Autocmd WinEnter,BufRead * set cursorline
Autocmd WinLeave * set nocursorline
Autocmd CmdwinEnter * call s:InitCmdWin()
" git commit message ‚Ì‚Æ‚«‚ÍÜ‚è‚½‚½‚Ü‚È‚¢(diff ‚Å’†“r”¼’[‚ÈÜ‚è‚½‚½‚İ‚É‚È‚è‚ª‚¿)
" git commit message ‚Ì‚Æ‚«‚ÍƒXƒyƒ‹‚ğƒ`ƒFƒbƒN‚·‚é
AutocmdFT gitcommit setlocal nofoldenable spell | set fileencoding=utf-8
AutocmdFT diff setlocal nofoldenable
AutocmdFT c   setlocal omnifunc=ccomplete#Complete
AutocmdFT cpp setlocal omnifunc=ccomplete#Complete
AutocmdFT ps1 setlocal omnifunc=poshcomplete#CompleteCommand


" ƒXƒNƒŠƒvƒg‚ÉÀs‰Â”\‘®«‚ğ©“®‚Å•t‚¯‚é
if executable('chmod')
    Autocmd BufWritePost * call s:add_permission_x()

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! empty(neobundle#get('unite.vim'))
    " unite‚Ìà–¾‚É‚Â‚¢‚Ä‚ÍˆÈ‰ºƒŠƒ“ƒNæ‚ªÚ‚µ‚¢B
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

    " ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“ƒEƒBƒ“ƒhƒE‚Å Unite ƒRƒ}ƒ“ƒh‚ğ“ü—Í
    nnoremap [unite]u               :<C-u>Unite source<CR>
    " ƒoƒbƒtƒ@‚ğŠJ‚¢‚½‚ÌƒpƒX‚ğ‹N“_‚Æ‚µ‚½ƒtƒ@ƒCƒ‹ŒŸõ
    nnoremap <silent>[unite]f       :<C-u>UniteWithBufferDir -buffer-name=files -vertical file directory file/new<CR>
    " w’è‚µ‚½ƒfƒBƒŒƒNƒgƒŠˆÈ‰º‚ğÄ‹A“I‚ÉŠJ‚­
    nnoremap <silent>[unite]F       :<C-u>UniteWithBufferDir -no-start-insert file_rec/async -auto-resize<CR>
    " Å‹ßg—p‚µ‚½ƒtƒ@ƒCƒ‹
    nnoremap <silent>[unite]m       :<C-u>Unite file_mru directory_mru file/new<CR>
    " ƒoƒbƒtƒ@ˆê——
    nnoremap <silent>[unite]b       :<C-u>Unite -immediately -no-empty -auto-preview buffer<CR>
    " ƒvƒƒOƒ‰ƒ~ƒ“ƒO‚É‚¨‚¯‚éƒAƒEƒgƒ‰ƒCƒ“‚Ì•\¦
    " nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview -no-quit<CR>
    nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview<CR>
    " ƒRƒ}ƒ“ƒh‚Ìo—Í
    nnoremap <silent>[unite]O       :<C-u>Unite output<CR>
    nnoremap <silent>[unite]c       :<C-u>Unite codic<CR>
    " grepŒŸõD
    nnoremap <silent>[unite]g       :<C-u>Unite -no-start-insert grep -auto-preview<CR>
    " Git ‚Ìƒ‹[ƒgƒfƒBƒŒƒNƒgƒŠ‚ğŠJ‚­
    nnoremap <silent><expr>[unite]G  ":\<C-u>Unite file -input=".fnamemodify(GitRootDir(),":p")
    " Uniteƒoƒbƒtƒ@‚Ì•œŒ³
    nnoremap <silent>[unite]r       :<C-u>UniteResume<CR>
    " Unite ƒ\[ƒXˆê——
    nnoremap <silent>[unite]s       :<C-u>Unite source -vertical<CR>
    " ƒuƒbƒNƒ}[ƒN
    noremap <silent>[unite]B        :<C-u>Unite bookmark<CR>
    " ƒŒƒWƒXƒ^
    noremap <silent>[unite]R        :<C-u>Unite -buffer-name=register register<CR>
    " help(€–Ú‚ª‘½‚¢‚Ì‚ÅCŒŸõŒê‚ğ“ü—Í‚µ‚Ä‚©‚çi‚è‚Ş)
    nnoremap <silent>[unite]hh      :<C-u>UniteWithInput help -vertical<CR>
    " —š—ğ
    nnoremap <silent>[unite]hc      :<C-u>Unite -buffer-name=lines history/command -start-insert<CR>
    nnoremap <silent>[unite]hs      :<C-u>Unite -buffer-name=lines history/search<CR>
    nnoremap <silent>[unite]hy      :<C-u>Unite -buffer-name=lines history/yank<CR>


    " unite-lines ƒtƒ@ƒCƒ‹“àƒCƒ“ƒNƒŠƒƒ“ƒ^ƒ‹ŒŸõ
    nnoremap <silent><expr> [unite]L line('$') > 5000 ?
                \ ":\<C-u>Unite -no-split -start-insert -auto-preview line/fast\<CR>" :
                \ ":\<C-u>Unite -start-insert -auto-preview line:all\<CR>"
    " ƒJƒ‰[ƒXƒL[ƒ€
    nnoremap [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
    " ŒŸõ
    nnoremap <silent>[unite]/ :<C-u>execute 'Unite grep:'.expand('%:p').' -input='.escape(substitute(@/, '^\\v', '', ''), ' \')<CR>

    " ƒGƒ“ƒ^[‚Ì‘ã‚í‚è‚ÉˆÈ‰º‚ÌƒL[‚ÅƒEƒBƒ“ƒhƒE‚ğ…•½•ªŠ„‚µ‚ÄŠJ‚­
    AutocmdFT unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    AutocmdFT unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    " ƒGƒ“ƒ^[‚Ì‘ã‚í‚è‚ÉˆÈ‰º‚ÌƒL[‚ÅƒEƒBƒ“ƒhƒE‚ğ‚’¼•ªŠ„‚µ‚ÄŠJ‚­
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
    ""‘O‰ñs‚í‚ê‚½•âŠ®‚ğƒLƒƒƒ“ƒZƒ‹‚·‚é
	"inoremap <expr><C-g>     neocomplete#undo_completion()
    ""Œ»İ‘I‘ğ‚µ‚Ä‚¢‚éŒó•â‚ğƒLƒƒƒ“ƒZƒ‹‚µAƒ|ƒbƒvƒAƒbƒv‚ğ•Â‚¶‚é
	inoremap <expr><C-g>  neocomplete#cancel_popup()
    "•âŠ®Œó•â‚Ì‚È‚©‚©‚çA‹¤’Ê‚·‚é•”•ª‚ğ•âŠ®‚·‚é
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
    "Œ»İ‘I‘ğ‚µ‚Ä‚¢‚éŒó•â‚ğŠm’è‚·‚é
	inoremap <expr><C-y>  neocomplete#close_popup()
    ""Œ»İ‘I‘ğ‚µ‚Ä‚¢‚éŒó•â‚ğƒLƒƒƒ“ƒZƒ‹‚µAƒ|ƒbƒvƒAƒbƒv‚ğ•Â‚¶‚é
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

    "AutoComplPop‚ğ–³Œø‚É‚·‚é
    let g:acp_enableAtStartup = 0
    "vim‹N“®‚É—LŒø‰»
    let g:neocomplete#enable_at_startup = 1
    "smart_case‚ğ—LŒø‚É‚·‚éD‘å•¶š‚ª“ü—Í‚³‚ê‚é‚Ü‚Å‘å•¶š¬•¶š‚Ì‹æ•Ê‚ğ‚È‚­‚·
    let g:neocomplete#enable_smart_case = 1
    " ‚ ‚¢‚Ü‚¢‚ÈŒó•âˆê’v
    let g:neocomplete#enable_fuzzy_completion = 1
    " ƒfƒŠƒ~ƒ^iautoload ŠÖ”‚Ì # ‚È‚Çj‚Ì©“®‘}“ü
    let g:neocomplete#enable_auto_delimiter = 1
    "ƒVƒ“ƒ^ƒbƒNƒX‚ğƒLƒƒƒbƒVƒ…‚·‚é‚Æ‚«‚ÌÅ¬•¶š’·‚ğ4‚É
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    "•âŠ®‚ğŠJn‚·‚é“ü—Í•¶š’·
    let g:neocomplete#auto_completion_start_length = 2
    " ‚±‚ê‚ğİ’è‚µ‚Ä‚¢‚é‚ÆAB–†•âŠÔ‚ªŒø‚©‚È‚­‚È‚Á‚Ä‚µ‚Ü‚Á‚½B
	" let g:neocomplete#enable_cursor_hold_i = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
    "“ú–{Œê‚ğûW‚µ‚È‚¢‚æ‚¤‚É‚·‚é
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    "ƒŠƒXƒg•\¦
    let g:neocomplete#max_list = 2000
    " «‘’è‹`
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : expand('~/.vimshell/command-history'),
                \ }
    "‹æØ‚è•¶šƒpƒ^[ƒ“‚Ì’è‹`
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

    " " ƒIƒ€ƒj•âŠ®‚ğÀs‚·‚éƒpƒ^[ƒ“
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
    " g—p‚·‚é•âŠ®‚Ìí—Ş‚ğŒ¸‚ç‚·
    " Œ»İ‚ÌSource‚Ìæ“¾‚Í `:echo keys(neocomplete#variables#get_sources())`
    " ƒfƒtƒHƒ‹ƒg: ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'include', 'tag', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'include', 'omni', 'vim', 'buffer']
    "   \ }

    " neocomplete •âŠ®—pŠÖ”
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
    " [vimfilerƒƒ‚]
    " VimFiler‚Åvimfilerƒoƒbƒtƒ@‚ğì¬‚·‚éB‘¼‚Évimfilerƒoƒbƒtƒ@‚ª‘¶İ‚µ‚Ä‚¢‚ê‚ÎA—¬—p‚³‚ê‚éB
    " •¡”vimfilerƒoƒbƒtƒ@‚ğì¬‚µ‚½‚¢ê‡‚ÍVimFilerCreate‚ğg—p‚·‚éB
    nnoremap            [vimfiler] <nop>
    nmap     <Space>f   [vimfiler]
    " vimfilerƒoƒbƒtƒ@‚ğ¶¬‚·‚éB‚·‚Å‚É‘¶İ‚µ‚Ä‚¢‚ê‚Î‚»‚Ìƒoƒbƒtƒ@‚ğŠJ‚­B
    nnoremap [vimfiler]f        :<C-u>VimFiler<CR>
    " V‚µ‚¢vimfilerƒoƒbƒtƒ@¶¬‚·‚éB
    nnoremap [vimfiler]C        :<C-u>VimFilerCreate<CR>
    " vimfilerƒoƒbƒtƒ@‚ğƒJƒŒƒ“ƒgƒfƒBƒŒƒNƒgƒŠ‚ÅŠJ‚­B
    nnoremap [vimfiler]c        :<C-u>VimFilerCurrentDir<CR>
    " vimfilerƒoƒbƒtƒ@‚ğƒJƒŒƒ“ƒgƒoƒbƒtƒ@‚ÅŠJ‚­B
    nnoremap [vimfiler]b        :<C-u>VimFilerBufferDir<CR>
    " vimfilerƒoƒbƒtƒ@‚ğ‰æ–Ê•ªŠ„‚ÅŠJ‚­B
    nnoremap [vimfiler]s        :<C-u>VimFilerSplit<CR>
    " vimfiler‚ğ2‰æ–Ê‚ÅŠJ‚­B
    nnoremap [vimfiler]d        :<C-u>VimFilerDouble<CR>
    " vimfiler‚ğexploler•—‚ÉŠJ‚­
    nnoremap [vimfiler]e        :<C-u>VimFilerExplorer<CR>
    " .git‚Ì‚ ‚éƒfƒBƒŒƒNƒgƒŠ‚ğŠJ‚­B
    nnoremap <silent><expr>[vimfiler]g ":\<C-u>VimFiler " . <SID>GitRootDir() . '\<CR>'
    " .git‚Ì‚ ‚éƒfƒBƒŒƒNƒgƒŠ‚ğexploer•—‚ÉŠJ‚­B
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
    let g:ctrlp_clear_cache_on_exit = 0   " I—¹ƒLƒƒƒbƒVƒ…‚ğƒNƒŠƒA‚µ‚È‚¢
    let g:ctrlp_mruf_max            = 500 " MRU‚ÌÅ‘å‹L˜^”
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|neocon|neocomplcache|neocomplete|cache)$',
        \ 'file': '\v\.(mp3|mp4|bmp|jpg|png|pdf|zip|m4a|pkg|gz|'.
        \               'o|obj|a|exe|dll|so|swp|ttf|mov|avi|dmg|rar|xls|mobi)$',
        \ }
endif

if ! empty(neobundle#get('clever-f.vim'))
    " ‘å•¶š‚ğ“ü—Í‚µ‚½‚¾‚¯‘å•¶š¬•¶š‚ğ‹æ•Ê‚·‚éA‚µ‚È‚¢
    let g:clever_f_smart_case = 1
    " migemo‚ğg—p‚·‚éA‚µ‚È‚¢
    let g:clever_f_use_migemo = 1
    " s‚ğ‚Ü‚½‚¢‚ÅfŒŸõ‚ğ‚·‚éA‚µ‚È‚¢
    let g:clever_f_across_no_line = 0
    " f‚Å‡•ûŒüAF‚Å‹t•ûŒü‚ÉˆÚ“®•ûŒü‚ğŒÅ’è‚·‚éA‚µ‚È‚¢
    let g:clever_f_fix_key_direction = 1
    " ”CˆÓ‚Ì‹L†‚Éƒ}ƒbƒ`‚·‚é•¶š‚ğw’è‚·‚éB
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
    " –¾¦“I‚ÉSyntasticCheck‚ğŒÄ‚Ño‚µ‚½‚¾‚¯\•¶ƒ`ƒFƒbƒN‚ğs‚¤B
    let g:syntastic_mode_map = { 'mode': 'passive' }

    nnoremap         [syntastic]  <nop>
    nmap    <Space>s [syntastic]
    noremap <silent>[syntastic]s :<C-u>SyntasticCheck<CR>
    noremap <silent>[syntastic]r :<C-u>SyntasticReset<CR>
    noremap <silent>[syntastic]i :<C-u>SyntasticInfo<CR>
endif

if ! empty(neobundle#get('vim-quickrun'))
    "<Leader>r ‚ğg‚í‚È‚¢
    let g:quickrun_no_default_key_mappings = 1
    " quickrun_config‚Ì‰Šú‰»
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    " "QuickRun Œ‹‰Ê‚ÌŠJ‚«•û
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
    " runner vimproc ‚É‚¨‚¯‚é polling ŠÔŠu
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
    " QuickFixˆ—§Œä
    " 0 : ‚È‚É‚à‚µ‚È‚¢
    " 1 : QuickFix/ƒƒP[ƒVƒ‡ƒ“ƒŠƒXƒg‚Ì—¼•û‚Å—LŒø
    " 2 : ƒƒP[ƒVƒ‡ƒ“ƒŠƒXƒg‚Ì‚İ—LŒø
    " 3 : QFixMemo/QFixGrepƒRƒ}ƒ“ƒh‚ÅŠJ‚¢‚½ê‡‚Ì‚İ—LŒø
    " @note
    " preview‹@”\‚Æ‚©‚Í‚©‚È‚è•Ö—˜‚È‚Ì‚¾‚ªAƒvƒ‰ƒOƒCƒ“‚ğFX‚Æ“ü‚ê‚¾‚·‚Æ‹£‡‚µ‚Ä
    " ƒgƒ‰ƒuƒ‹‚±‚Æ‚ª‘½‚¢B‚æ‚Á‚Äqfixhowm‹@”\—˜—p‚Ì‚İ—LŒø‚Æ‚µ‚Ä‚¨‚­B
    let g:QFixWin_EnableMode = 3
    " QuickFixƒEƒBƒ“ƒhƒE‚ÅƒvƒŒƒrƒ…[‚ğ—LŒø‚É‚·‚é
    let g:QFix_PreviewEnable = 1
    " QuickFixƒEƒBƒ“ƒhƒE‚Å‚Í‚È‚­ƒƒP[ƒVƒ‡ƒ“ƒŠƒXƒg‚ğg—p‚·‚é or ‚µ‚È‚¢
    let g:QFix_UseLocationList = 0
    " QuickFixƒEƒBƒ“ƒhƒE‚Ì•
    let g:QFix_Width = 70
    " QuickFixƒEƒBƒ“ƒhƒE‚Ì‚‚³
    let g:QFix_Height = 10
    " ƒvƒŒƒrƒ…[ƒEƒBƒ“ƒhƒE‚Ì•
    let g:QFix_PreviewWidth  = 70
    " ƒvƒŒƒrƒ…[ƒEƒBƒ“ƒhƒE‚Ì‚‚³(previewheight‚ğg—p‚µ‚½‚­‚È‚¢ê‡‚Ì‚İw’è)
    let g:QFix_PreviewHeight = 15
    " QuickFixƒEƒBƒ“ƒhƒE‚ÌŠJ‚«•û
    " @note botright Å‰º’i‚É•\¦
    let g:QFix_CopenCmd = 'botright'
    " ƒvƒŒƒrƒ…[ƒEƒBƒ“ƒhƒE‚ÌŠJ‚«•ûw’è
    " @note topleft Åã’i‚ÉŠJ‚­
    let g:QFix_PreviewOpenCmd = 'topleft'
    " QuickFixƒEƒBƒ“ƒhƒE‚ÅƒJ[ƒ\ƒ‹ƒ‰ƒCƒ“‚ğ•\¦
    let g:QFix_CursorLine = 1
    " QuickFixƒEƒBƒ“ƒhƒE‚ÌƒvƒŒƒrƒ…[‚Åfiletype•Ê‚ÌƒnƒCƒ‰ƒCƒg‚ğ—LŒø‚É‚·‚é
    let g:QFix_PreviewFtypeHighlight = 1
    " QuickFixƒEƒBƒ“ƒhƒE‚©‚çŠJ‚¢‚½ŒãƒEƒBƒ“ƒhƒE‚ğ•Â‚¶‚é or •Â‚¶‚È‚¢
    let g:QFix_CloseOnJump = 0
    " QuickFixƒEƒBƒ“ƒhƒE‚Ì <S-CR> ‚Í•ªŠ„‚Å‚Í‚È‚­ƒ^ƒu‚ÅŠJ‚­‚É‚Í 'tab'‚Éİ’è‚·‚é
    let g:QFix_Edit = 'tab'
    " ƒvƒŒƒrƒ…[‘ÎÛŠOƒtƒ@ƒCƒ‹‚Ìw’è
    let g:QFix_PreviewExclude = ''.
      \'[~#]$\|\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|' .
      \'\.dll$\|\.lnk$\|\.o$\|\.obj$\|\.a$\|\.so$\|\.d$\|tags$\|cscope.out$'
    " ƒvƒŒƒrƒ…[‰æ–Ê‚ÌƒJ[ƒ\ƒ‹ƒ‰ƒCƒ“‚ğ•\¦
    let g:QFix_PreviewCursorLine = 1
    " ƒvƒŒƒrƒ…[ƒEƒBƒ“ƒhƒE‚ÌÜ‚è•Ô‚µ•\¦
    let g:QFix_PreviewWrap = 1
    " GrepƒRƒ}ƒ“ƒh‚ÌƒL[ƒ}ƒbƒv
    let g:MyGrep_Key  = 'g'
    " GrepƒRƒ}ƒ“ƒh‚Ì2ƒXƒgƒ[ƒN–ÚƒL[ƒ}ƒbƒv
    let g:MyGrep_KeyB = ','
    " grep‘ÎÛ‚É‚µ‚½‚­‚È‚¢ƒtƒ@ƒCƒ‹–¼‚Ì³‹K•\Œ»
    let g:MyGrep_ExcludeReg = g:QFix_PreviewExclude

    if has('win32') || has('win64')
        " Windows‚Åcygwin1.7ˆÈ~‚Ìgrep.exe‚ğg—p‚·‚éê‡‚Ì‚İ 1 ‚Éİ’è
        let g:MyGrep_cygwin17 = 1
        "" g—p‚·‚égrep(Windows)
        "let mygrepprg = 'findstr'
        let g:mygrepprg = 'grep'
        " “ú–{Œê‚ªŠÜ‚Ü‚ê‚éê‡‚Ìgrepw’è
        " let myjpgrepprg = 'grep'
        let g:myjpgrepprg = ''
        " ŠO•”grep(shell)‚ÌƒGƒ“ƒR[ƒfƒBƒ“ƒO(Windows)
        let g:MyGrep_ShellEncoding = 'cp932'
        " ŠO•”grep(shell)‚ÅƒGƒ“ƒR[ƒfƒBƒ“ƒO•ÏŠ·‚ªs‚í‚ê‚éê‡‚ÌƒGƒ“ƒR[ƒfƒBƒ“ƒOw’è
        " (’Êí‚ÍMyGrep_ShellEncoding‚Æ“¯ˆê‚Ì‚½‚ßİ’è‚µ‚È‚¢‚Å‚­‚¾‚³‚¢)
        let g:MyGrep_FileEncoding = ''
    else
        " g—p‚·‚égrep(Unix)
        let g:mygrepprg = 'grep'
        " “ú–{Œê‚ªŠÜ‚Ü‚ê‚éê‡‚Ìgrepw’è
        let g:myjpgrepprg = 'grep'
        " ŠO•”grep(shell)‚ÌƒGƒ“ƒR[ƒfƒBƒ“ƒO(Unix)
        let g:MyGrep_ShellEncoding = 'utf-8'
        " ŠO•”grep(shell)‚ÅƒGƒ“ƒR[ƒfƒBƒ“ƒO•ÏŠ·‚ªs‚í‚ê‚éê‡‚ÌƒGƒ“ƒR[ƒfƒBƒ“ƒOw’è
        " (’Êí‚ÍMyGrep_ShellEncoding‚Æ“¯ˆê‚Ì‚½‚ßİ’è‚µ‚È‚¢‚Å‚­‚¾‚³‚¢)
        let g:MyGrep_FileEncoding = ''
    endif

    " ŒŸõƒfƒBƒŒƒNƒgƒŠ‚ÍƒJƒŒƒ“ƒgƒfƒBƒŒƒNƒgƒŠ‚ğŠî“_‚É‚·‚é
    " 0 : Œ»ƒoƒbƒtƒ@‚Ìƒtƒ@ƒCƒ‹‚ª‘¶İ‚·‚éƒfƒBƒŒƒNƒgƒŠ
    " 1 : ƒJƒŒƒ“ƒgƒfƒBƒŒƒNƒgƒŠ
    let g:MyGrep_CurrentDirMode = 1
    " ŒŸõ‚Íí‚ÉÄ‹AŒŸõ
    let g:MyGrep_RecursiveMode = 0
    " u‚¾‚ß•¶šv‘Îô‚ğ—LŒø/–³Œø
    let g:MyGrep_Damemoji = 2
    " u‚¾‚ß•¶šv‚ğ’u‚«Š·‚¦‚é³‹K•\Œ»
    let g:MyGrep_DamemojiReplaceReg = '(..)'
    " u‚¾‚ß•¶šv‚ğ©•ª‚Å’Ç‰Áw’è‚µ‚½‚¢ê‡‚Í³‹K•\Œ»‚Åw’è‚·‚é
    let g:MyGrep_DamemojiReplace = '[]'
    " QFixGrep‚ÌŒŸõ‚ÉƒJ[ƒ\ƒ‹ˆÊ’u‚Ì’PŒê‚ğE‚¤/E‚í‚È‚¢
    let g:MyGrep_DefaultSearchWord = 1
    " grepÀs‚ÉƒGƒ‰[ƒƒbƒZ[ƒW‚ªo‚½‚ç•\¦
    let g:MyGrep_error = 1
    " ƒ†[ƒU’è‹`‰Â”\‚È’Ç‰ÁƒIƒvƒVƒ‡ƒ“
    " @note
    " -i --ignore-case ‘å•¶š¬•¶š‚Ìˆá‚¢‚ğ–³‹‚·‚éB
    " -n --line-number s”Ô†‚ğ•\¦‚·‚éB
    " -I ƒoƒCƒiƒŠƒtƒ@ƒCƒ‹‚ğ–³‹‚·‚éB
    " -D skip ƒfƒoƒCƒXAFIFOAƒ\ƒPƒbƒg“™‚ğ–³‹‚·‚éB
    let g:MyGrepcmd_useropt = ''.
                \' -i -n -I -D skip' .
                \' --exclude-dir=.git --exclude-dir=.svn --exclude-dir=.hg' .
                \' --exclude-dir=res --exclude-dir=resource' .
                \' --exclude-dir=bin --exclude-dir=lib' .
                \' --exclude-dir=[Dd]oxygen' .
                \' --exclude-dir=[Bb]uild'
    " ˆÙ‚È‚éƒGƒ“ƒR[ƒfƒBƒ“ƒO‚Ìƒtƒ@ƒCƒ‹‚ª¬İ‚µ‚Ä‚¢‚éê‡‚Égrep‚ğ•¡”‰ñÀs‚µ‚ÄAƒGƒ“
    " ƒR[ƒfƒBƒ“ƒO‚ğ‹C‚É‚¹‚¸“ú–{ŒêŒŸõ‚ª‰Â”\‚Å‚·B
    " ƒ}ƒ‹ƒ`ƒGƒ“ƒR[ƒfƒBƒ“ƒOgrepƒ‚[ƒh‚ÌØ‘Ö‚Í<Leader>rm‚Å‚às‚¦‚Ü‚·B
    " ‚È‚¨ŒŸõ•¶š—ñ‚É“ú–{Œê‚ğŠÜ‚Ü‚È‚¢ê‡‚ÍAˆê‰ñ‚µ‚©grep‚ÍÀs‚³‚ê‚Ü‚¹‚ñB
    " ƒ}ƒ‹ƒ`ƒGƒ“ƒR[ƒfƒBƒ“ƒOgrepƒ‚[ƒh
    let g:MyGrep_MultiEncoding = 1
    " ƒ}ƒ‹ƒ`ƒGƒ“ƒR[ƒfƒBƒ“ƒOgrep ƒGƒ“ƒR[ƒfƒBƒ“ƒOƒŠƒXƒg
    let g:MyGrep_MultiEncodingList = ['utf-8', 'cp932']

    " QFixHowm‚Æ‚ÌƒIƒvƒVƒ‡ƒ“ƒRƒ“ƒo[ƒg‚ğs‚¤ or s‚í‚È‚¢
    let g:QFixHowm_Convert = 1
    " ƒƒ‚ƒtƒ@ƒCƒ‹‚Ì•Û‘¶æ
    let g:qfixmemo_dir           = '~/Dropbox/qfixmemo'

    let g:qfixmemo_title    = '#'
    " ƒƒ‚ƒtƒ@ƒCƒ‹‚Ìƒtƒ@ƒCƒ‹–¼
    let g:qfixmemo_filename      = '%y%m%d-%H%M%S.mkd'
    " ƒƒ‚ƒtƒ@ƒCƒ‹‚Ìƒtƒ@ƒCƒ‹ƒGƒ“ƒR[ƒfƒBƒ“ƒO
    let g:qfixmemo_fileencoding  = 'utf-8'
    " ƒƒ‚ƒtƒ@ƒCƒ‹‚Ìƒtƒ@ƒCƒ‹ƒtƒH[ƒ}ƒbƒg(‰üsƒR[ƒh)
    let g:qfixmemo_fileformat    = 'unix'
    " ƒƒ‚‚Ìƒtƒ@ƒCƒ‹ƒ^ƒCƒv
    let g:qfixmemo_filetype      = 'markdown'
    " NOTE:
    " ƒƒ‚ƒtƒ@ƒCƒ‹’†‚É [[ƒL[ƒ[ƒh]] ‚Ì‚æ‚¤‚É [[ ‚Æ ]] ‚ÅWikiƒXƒ^ƒCƒ‹‚ÌƒL[ƒ[ƒh‚ğ
    " ì¬‚·‚é‚ÆƒI[ƒgƒŠƒ“ƒN‰»‚³‚êAƒL[ƒ[ƒhã‚Å<CR>‚ğ‰Ÿ‚·‚Æ‘Î‰‚·‚éƒtƒ@ƒCƒ‹‚ğŠJ‚­
    " ‚±‚Æ‚ªo—ˆ‚Ü‚·B
    " ƒL[ƒ[ƒh‚Í•Û‘¶‚É©“®ì¬‚³‚ê‚Ü‚·‚ªA‘Sƒtƒ@ƒCƒ‹‚ğŒŸõ‚µ‚ÄÄì¬‚ª‰Â”\‚Å‚·B
    " •s—v‚ÈƒL[ƒ[ƒh‚ğíœ‚µ‚½ê‡‚È‚Ç‚ÍÄì¬‚µ‚Ä‚­‚¾‚³‚¢B
    " <Leader>rk           ƒL[ƒ[ƒhƒtƒ@ƒCƒ‹‚ğÄì¬
    "
    " ƒL[ƒ[ƒh‚ÍˆÈ‰º‚Ì³‹K•\Œ»‚Å’è‹`‚³‚ê‚Ä‚¢‚Ü‚·B
    " ƒL[ƒ[ƒhŠJn³‹K•\Œ»
    let g:qfixmemo_keyword_pre = '\[\['
    " ƒL[ƒ[ƒhI—¹³‹K•\Œ»
    let g:qfixmemo_keyword_post = '\]\]'
    " NOTE:
    " howm‚Ìcome-fromƒŠƒ“ƒN‚ÆgotoƒŠƒ“ƒN‚à’è‹`‚µ‚Ä‚ ‚ê‚Îg—p‰Â”\‚Å‚·B
    " howm‚ÌƒŠƒ“ƒNƒpƒ^[ƒ“
    let g:howm_glink_pattern = '>>>'
    let g:howm_clink_pattern = '<<<'

    " NOTE:
    " ƒL[ƒ[ƒhˆ—‚Í–³Œø‰»‰Â”\‚Å‚·B
    " ƒL[ƒ[ƒh‚ğg—p‚µ‚È‚¢ or ‚·‚é
    let g:qfixmemo_use_keyword = 1

    " MRU‚Ì•\¦”
    let g:QFixMRU_Entries   = 100
    " Å‹ßXV‚µ‚½ƒGƒ“ƒgƒŠˆê——‚Ì“ú”
    let g:qfixmemo_RecentDays = 100

    " MRU•Û‘¶ƒtƒ@ƒCƒ‹–¼
    let g:QFixMRU_Filename  = g:qfixmemo_dir .'/.qfixmru'
    " MRU‚ÌŠî€ƒfƒBƒŒƒNƒgƒŠ
    let g:QFixMRU_RootDir   = g:qfixmemo_dir

    " ƒ^ƒCƒgƒ‹sŒŸõ‚Ì³‹K•\Œ»‚ğ‰Šú‰»
    let g:QFixMRU_Title = {}

    " MRU“o˜^—p‚Ì³‹K•\Œ»(Vim)‚ğw’è
    let g:QFixMRU_Title['mkd'] = '^#[^#]'

    let qfixmemo_timeformat       = '<!-- %Y-%m-%d %H:%M -->'

    " qfixmemo#UpdateTime()‚Åƒ^ƒCƒ€ƒXƒ^ƒ“ƒv‚Ì’uŠ·‚Ég—p‚·‚é³‹K•\Œ»(Vim)
    let qfixmemo_timeformat_regxp = '<!-- \d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2} -->'

    " ƒ^ƒCƒ€ƒXƒ^ƒ“ƒvs‚Æ‚İ‚È‚·³‹K•\Œ»(Vim)
    let qfixmemo_timestamp_regxp  = qfixmemo_timeformat_regxp

    " qfixmemo#AddTitle()‚Å‹[—ƒ^ƒCƒgƒ‹s‚Æ‚İ‚È‚·³‹K•\Œ»(Vim)
    let qfixmemo_alt_title_regxp  = ''

    " NOTE:
    " ŠO•”grep‚Æ“à•”‚Åg‚¤Vim‚Ì³‹K•\Œ»‚ªˆÙ‚È‚éê‡‚ÍAX‚Égrepê—p‚Ì³‹K•\Œ»‚ğİ’è
    " ‰Â”\‚Å‚·B
    " ƒ^ƒCƒgƒ‹sŒŸõ‚Ì³‹K•\Œ»(grep)‚ğw’è
    let g:QFixMRU_Title['mkd_regxp'] = '^#[^#]'

    " QFixMemo‚ğ‹N“®‚µ‚È‚¢ê‡‚Å‚àI—¹‚ÉMRU‚ğ•Û‘¶‚·‚é
    let g:QFixMRU_VimLeaveWrite = 1

    " ƒ^ƒCƒgƒ‹sŒŸõ³‹K•\Œ»‰Šú‰»
    let g:QFixMRU_Title = {}

    " ƒ^ƒCƒgƒ‹sŒŸõ³‹K•\Œ»(Vim)
    let g:QFixMRU_Title['vim'] = '^\s*\(silent!\?\)\?\s*func'
    let g:QFixMRU_Title['java'] = '^\s*public.*(.*).*{'
    let g:QFixMRU_Title['js']   = '^\s*function'
    let g:QFixMRU_Title['py']   = '^def'
    let g:QFixMRU_Title['rb']   = '^\s*def'

    " 8.3 ƒAƒEƒgƒ‰ƒCƒ“ƒIƒvƒVƒ‡ƒ“                  *qfixmemo_submenu_outline_option*
    " ƒAƒEƒgƒ‰ƒCƒ“‚Æ‚¢‚Á‚Ä‚àfoldmethod‚Æsyntax‚ğİ’è‚µ‚Ä‚¢‚é‚¾‚¯‚È‚Ì‚ÅAD‚İ‚É‰‚¶‚Ä
    " •ÏX‚µ‚Ä‚İ‚Ä‚­‚¾‚³‚¢B
    " Ú‚µ‚­‚Í|foldmethod|‚ğQÆ‚µ‚Ä‚­‚¾‚³‚¢B >
    " ƒAƒEƒgƒ‰ƒCƒ“(foldenable)
    let g:qfixmemo_outline_foldenable = 1
    " ƒAƒEƒgƒ‰ƒCƒ“(foldmethod)
    let g:qfixmemo_outline_foldmethod = 'indent'
    " ƒAƒEƒgƒ‰ƒCƒ“(foldexpr)
    let g:qfixmemo_outline_foldexpr = "getline(v:lnum)=~'^[=.*E]'?'>1':'1'"
    " ƒAƒEƒgƒ‰ƒCƒ“(syntax)
    let g:qfixmemo_outline_syntax = 'ezotl'

    " NOTE:
    " ˆêƒtƒ@ƒCƒ‹•¡”ƒGƒ“ƒgƒŠ‚Ìê‡AƒtƒH[ƒ‹ƒfƒBƒ“ƒO‚ğg—p‚·‚é‚ÆŒ©‚â‚·‚­‚È‚è‚Ü‚·B
    " <Leader>o           ƒtƒH[ƒ‹ƒfƒBƒ“ƒOØ‘Ö
    " ƒtƒH[ƒ‹ƒfƒBƒ“ƒOƒpƒ^[ƒ“‚Í qfixmemo_folding_pattern ‚Å’è‹`‚³‚êA
    " qfixmemo_folding‚ª 0 ‚¾‚Æ qfixmemo‚ÌƒtƒH[ƒ‹ƒfƒBƒ“ƒO‚Í–³Œø‰»‚³‚ê‚Ü‚·B >
    " ƒfƒtƒHƒ‹ƒg‚Å‚Ís“ª‚ªƒ^ƒCƒgƒ‹‹L†‚©‚Ç‚¤‚©‚ÅÜ‚è‚½‚½‚İ‚Ü‚·
    let g:qfixmemo_folding         = 1
    let g:qfixmemo_folding_pattern = '^=[^=]'

    " 12.3 •Û‘¶‘Oˆ—                                           *qfixmemo_pre_save*
    " •Û‘¶‘O‚Éƒ^ƒCƒgƒ‹s‚Æƒ^ƒCƒ€ƒXƒ^ƒ“ƒv‚Ì•t‰Á‚Æƒtƒ@ƒCƒ‹––‚Ì‹ósíœ“™‚ªs‚í‚ê‚Ü‚·B
    " •Û‘¶‘Oˆ—‚Í .vimrc“™‚ÅƒIƒvƒVƒ‡ƒ“İ’è‚·‚é–‚Å•ÏX‰Â”\‚Å‚·B
    " ƒ^ƒCƒgƒ‹s•t‰Á
    let g:qfixmemo_use_addtitle        = 1
    " ƒ^ƒCƒ€ƒXƒ^ƒ“ƒv•t‰Á
    let g:qfixmemo_use_addtime         = 1
    " ƒ^ƒCƒ€ƒXƒ^ƒ“ƒvƒAƒbƒvƒf[ƒg
    let g:qfixmemo_use_updatetime      = 1
    " ƒtƒ@ƒCƒ‹––‚Ì‹ós‚ğíœ
    let g:qfixmemo_use_deletenulllines = 1
    " ƒL[ƒ[ƒhƒŠƒ“ƒNì¬
    let g:qfixmemo_use_keyword         = 1
    "—\’èETODO‚Ìƒ\[ƒg—Dæ“x
    let QFixHowm_ReminderPriority = {'@' : 1, '!' : 1, '+' : 3, '-' : 4, '~' : 5, '.' : 6}
    ",y ‚Å•\¦‚³‚ê‚é—\’èETODOƒpƒ^[ƒ“
    let QFixHowm_ListReminder_ScheExt = '[-@+!~]'
    "—\’èETODO‚ÌŒŸõêŠw’è
    let g:QFixHowm_ScheduleSearchDir = g:qfixmemo_dir .'/quick'
    let g:QFixHowm_QuickMemoFile = g:QFixHowm_ScheduleSearchDir . '/quick-000000-000000.mkd'

    "—\’èETODO‚ÌŒŸõƒtƒ@ƒCƒ‹–¼w’è
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
    " •¶š”w’è‚ğ”¼Šp/‘SŠp’PˆÊ‚É‚·‚é
    " 1:”¼Šp
    " 2:‘SŠp
    let JpFormatCountMode = 2
    " Œ´e(Ü‚è•Ô‚µ)‘SŠp•¶š”
    let JpCountChars = 40

    " Œ´es”
    let JpCountLines = 17

    " ‹Ö‘¥ˆ—‚ÌÅ‘å‚Ô‚ç‰º‚ª‚èš”
    let JpCountOverChars = 1

    " ”¼Špˆê•¶š•ªƒI[ƒo[‚µ‚Ä‚àÜ‚è•Ô‚µˆ—‚ğ‚·‚é/‚µ‚È‚¢
    let JpFormatHankakuOver = 0

    " Ü‚è•Ô‚µ•¶š”(Œ´e—p†•¶š”)‚Í textwidth‚©‚çİ’è‚·‚é
    let JpCountChars_Use_textwidth = 0

    " ‘}“üƒ‚[ƒh‚Åˆê•¶š“ü—Í‚·‚é“x‚É©“®®Œ`‚ğs‚¤/s‚í‚È‚¢
    let JpFormatCursorMovedI = 1

    " ®Œ`‘ÎÛŠOs‚Ì³‹K•\Œ»
    let JpFormatExclude = '^$'

    " Œ´e—p†Š·ZŒvZ‚Éíœ‚·‚éƒ‹ƒr“™‚Ì³‹K•\Œ»
    let JpCountDeleteReg = '\[.\{-}\]\|<.\{-}>\|s.\{-}t\|m.\{-}n\|b'

    " ®Œ`ƒRƒ}ƒ“ƒh‚ğg—p‚µ‚½‚ç©“®®Œ`‚àON
    let JpAutoFormat = 1

    " ˜AŒ‹ƒ}[ƒJ[
    let JpFormatMarker = "\t"

    " Šî–{“I‚Èˆ—•û–@
    " 1. ‚Ü‚¸w’è•¶š”‚És‚ğ•ªŠ„
    " 2. Ÿs‚Ìs“ª‹Ö‘¥•¶š(JpKinsoku)‚ğŒ»İs‚ÖˆÚ“®
    " 3. Œ»İs‚Ìs––‹Ö‘¥•¶š(JpKinsokuE)‚ğŸs‚ÖˆÚ“®
    " 4. ‚Ô‚ç‰º‚ª‚è•¶š”‚ğ’´‚¦‚Ä‚Ô‚ç‰º‚ª‚Á‚Ä‚¢‚½‚ç’Ç‚¢o‚µ(JpKinsokuO)
    "    (JpKinsokuO‚ª–¢İ’è‚Ìê‡‚ÍJpKinsoku‚Å‘ã—p‚³‚ê‚Ü‚·)

    " s“ª‹Ö‘¥
    let JpKinsoku = '[-!?}>|°`IHJKTUjn¡£¤¥ŞßRS[X]E:;.‹ŒABCD,)\]plrtvxz‡fhâd\c]'
    " s––‹Ö‘¥
    let JpKinsokuE = '[0-9a-zA-Z([{<iokqsuwy‡€egá]'
    " ‹å“_‚Æ•Â‚¶Š‡ŒÊ
    let JpKutenParen = '[ABCD,)\]plrtvxz‡fhâ]'
    " ‹å“_‚Æ•Â‚¶Š‡ŒÊ‚Å•ª—£•s‰Â•¶š’Ç‚¢o‚µ—p
    " •ª—£•s‰Â•¶š‚ğ’Ç‚¢o‚·JpNoDivN‚ª‚ ‚Á‚½‚çA‚»‚±‚©‚ç’Ç‚¢o‚µB
    " ‚Å‚·‚©H\\<•ªŠ„> ‚ª‚ ‚Á‚½‚ç H‚Íc‚µ‚Ä\\‚Ì‚İ‚ğ’Ç‚¢o‚·‚½‚ß‚Ìw’èB
    let JpNoDivN = '[ABCD,)\]plrtvxz‡fhâ!?IH]'
    " •ª—£•s‰Â
    let JpNoDiv = '[\cd]'

    " ˜AŒ‹ƒ}[ƒJ[”ñg—p‚ÌTOLƒLƒƒƒ‰ƒNƒ^[
    let JpJoinTOL = '[\s@uE–]'
    " ˜AŒ‹ƒ}[ƒJ[”ñg—p‚ÌEOLƒLƒƒƒ‰ƒNƒ^[
    let JpJoinEOL = '[BvIHn]'

    " ‘}“üƒ‚[ƒh‚ÖˆÚs‚µ‚½‚ç©“®˜AŒ‹
    " 0 : ‚È‚É‚à‚µ‚È‚¢
    " 1 : ƒJ[ƒ\ƒ‹ˆÊ’uˆÈ~‚ğ©“®˜AŒ‹
    " 2 : ƒpƒ‰ƒOƒ‰ƒt‚ğ©“®˜AŒ‹
    let JpAutoJoin = 1

    " gq‚ğg—p‚µ‚Ä®Œ`‚ğs‚¤
    let JpFormatGqMode = 0

    " gq‚ğg—p‚µ‚Ä®Œ`‚·‚éê‡‚Ì®Œ`ƒRƒ}ƒ“ƒh
    " ‹ó•¶š—ñ‚È‚çŒ»İformatexpr‚Éİ’è‚µ‚Ä‚¢‚éƒRƒ}ƒ“ƒh‚ªg—p‚³‚ê‚é
    let JpFormat_formatexpr = ''
endif

nnoremap <Space>tt :<C-u>TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_map_togglesort = "r"
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 1

" ƒsƒ“ƒN
hi htmlH1 guifg=#F2D8DF gui=bold
" ƒIƒŒƒ“ƒW
hi htmlH2 guifg=#EF7585 gui=bold
" ”–‚¢ƒsƒ“ƒN
hi htmlH3 guifg=#EFC1C4 gui=bold
" ‰©F
" hi htmlH4 guifg=#FFFF00 gui=bold
hi htmlH4 guifg=#F2D8DF gui=bold
" ”–‚¢Â
hi htmlH5 guifg=#00FF00  gui=bold
" —Î
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

let g:gista#github_user = 'maskedw'
