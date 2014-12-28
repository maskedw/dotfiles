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
" GVim�̃J���[�X�L�[����CUI�łł��g����悤�ɕϊ�����
NeoBundle 'godlygeek/csapprox'
NeoBundle 'thinca/vim-guicolorscheme'
" CUI��Vim�ł��N���b�v�{�[�h���g�p�ł���悤�ɂ���
NeoBundle 'kana/vim-fakeclip'
" �X�e�[�^�X���C�����������悭����
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'liotaz/BlockDiff'
" �X�N���b�`�o�b�t�@
NeoBundle 'duff/vim-scratch'
" �֘A����t�@�C�����J���₷������B
NeoBundle 'kana/vim-altr'
" �������傢���J���[�e�[�}
NeoBundle 'w0ng/vim-hybrid'


" NeoBundle 'vim-scripts/YankRing.vim'
" ���t�@�����X�̎Q��
NeoBundle 'thinca/vim-ref'
" .git�Ƃ��̃f�B���N�g����F�����Ċy�Ɉړ��ł���悤�ɂ���B
NeoBundle "airblade/vim-rooter"
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'sudo.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/webapi-vim'


" �񓯊�����
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
" " C++�p�̃v���O�C��
" �ǂ�������C/C++�v���O�C����Lazy�ɂ��Ă���ƁAclang_complete�̕⊮�������Ȃ���
" �鎞������B�悭�킩��񂪁A���̂�Lazy����߂Ă����B
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
" �t�@�C���̒T���p�X
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

" �V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
set autoindent

" �^�u�ƑΉ�����󔒂̐�
set tabstop=4

" ����͋������悭�킩���̂�0(����)�Ƃ�B
set softtabstop=0

" vim���}�����鎩���C���f���g���͌����ڏ�̋󔒉���������
set shiftwidth=4

" �C���f���g��shiftwidth�̔{���ɂ܂�߂�B
set shiftround

" TAB - SPACE �ϊ�
set expandtab

" �E�C���h�E�Ɏ��܂�Ȃ��s�͐܂�Ԃ��ĕ\������B
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


" �������t�@�C�������܂Ői�񂾂�t�@�C���擪����Ăь�������B
set wrapscan

" �����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������
set showmatch

" �X�e�[�^�X���C���ɍs�A��\��
set ruler

" �X�e�[�^�X�o�[����ɕ\������
set laststatus=2

" ��ɃJ�[�\���s����ʒ����ɂ���悤�ɂ���B
set scrolloff=1000

" ���s���ɗǂ����ʂƂ��̕����ɂ��������������̎����C���f���g���g�p����B
set smartindent

"������u�����ɑ啶���A����������ʂ���B��ʂ��Ȃ��悤�ɂ������Ƃ���
"�p�^�[���̂ǂ�����\c���ӂ��߂邩 set ignorecase�Ƃ���B
set noignorecase

"�������ɑ啶�����܂�ł������/������ʂ���B
set smartcase

" �r�W���A���x������
set novb t_vb=

" �^�u�����ƁA�s���󔒂�����
set list

" ���ꕶ���̌�����
set listchars=tab:>-,trail:-",eol:$

" �X�v���b�V����ʂ�\�����Ȃ�
set shortmess& shortmess+=I

" IM(�C���v�b�g���\�b�h)���g�p����
set noimdisable

" �^�u�y�[�W��2�ȏ゠��Ƃ��������x����\������B
set showtabline=1

"�C���N�������^���T�[�`�L��
set incsearch

" �������ʂ��n�C���C�g����
set hlsearch

" �R�}���h���C�����[�h�ŃR�}���h�E�C���h�E���o���L�[
set cedit=<C-c>

" �o�b�N�X�y�[�X�œ���ȕ�����������悤�ɂ���
set backspace=indent,eol,start

" �e�L�X�g���`�̐ݒ�B�e�t���O�̈Ӗ���:help formatoptions�y��:help fo-table���Q��
set formatoptions& formatoptions+=tcroqnmMj

" 8�i���C���N�������g���I�t�ɂ���
set nrformats-=octal

" �o�b�t�@�����Ƃ��ɉB����Ԃɂ���
set hidden

" help�̗D�揇��
set helplang=ja,en

" �N���b�v�{�[�h��OS�Ƌ��p�ɂ���
if (has('unix'))
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" ��`�I���Ŏ��R�Ɉړ�����
set virtualedit& virtualedit+=block

" ���s�R�[�h�̎����F��
if has('win32') || has('win64')
    set fileformats=dos,unix,mac
else
    set fileformats=unix,dos,mac
endif

" �������`�̑ΏۂƂȂ�e�L�X�g���B�����ł�0���w�肵�Ă����A�t�@�C���^�C�v��
" �v���O�C���ŌʂɎw�肷�邱�Ƃɂ���B
set textwidth=0

" �R�}���h���s�����ĕ`�悷��B
set nolazyredraw

" �����^�[�~�i���ڑ����s��
set ttyfast

" �⊮��₪������ł��|�b�v�A�b�v��\������B
set completeopt=menuone

" �܂肽���݂�L���ɂ���B
set foldenable

" �}���`�}�C�g�����������Ă��J�[�\��������Ȃ��悤�ɂ���B
set ambiwidth=double

" �ǂݍ���ł���t�@�C�����O���̃v���O�����ŕύX���ꂽ�玩���œǂ݂Ȃ����B
set autoread

" " h �� l �ōs���ׂ���悤�ɂ���
" set whichwrap +=h
" set whichwrap +=l

" 256�F���[�h
set t_Co=256

" �܂�Ԃ��ŃC���f���g��ێ�
if exists('+breakindent')
    set breakindent
    set breakindentopt=shift:-4
    let &showbreak = '>>> '
endif

" CUIvim�ł��}�E�X�����L���ɂ���
set mouse=a

" ���̃v���O�����Ńt�@�C��������������ꂽ�玩���œǂݒ���
set autoread

" �L�[�}�b�v���[�_�[���f�t�H���g��'\'����ύX
"let mapleader = ","

"���͓r���̃R�}���h���E���ɕ\������
set showcmd

if has('win32') || has('win64')
" !!
" gitv���v���O�C�����t�@�C�����J���܂���I�ȃG���[��f���悤�ɂȂ����̂ŁA�R�����g�����Ƃ��B
    "set shell=nyaos.exe
    "set shellcmdflag=-e
    ""set shellpipe=\|&\ tee
    "set shellpipe=
    "set shellredir=>%s\ 2>&1
    "set shellxquote=\"
    let $CYGWIN = 'nodosfilewarning'
endif

" CursolHold�C�x���g
set updatetime=500

" �R�}���h���s���͍ĕ`�悵�Ȃ�
set lazyredraw

" �����^�[�~�i���ڑ����s��
set ttyfast

"=== @tags
set tags&
if has('path_extra')
    set tags+=tags;
endif

"�R�}���h�⊮�Ɋւ���ݒ�
set wildmode=longest:full,full

set completeopt=menuone

" �^�u�ݒ�
set showtabline=0


" �������Ȃ��ꏊ�ł̃y�[�X�g���ɋ󔒂��l�߂�
if has('virtualedit') && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" �O������y�[�X�g���鎞����set paste�Ƃ��Ă������Y��ɓ\��₷���炵���B
set nopaste

"�o�b�N�A�b�v�t�@�C�����g�p����
set backup

"�X���b�v�t�@�C�����g�p���Ȃ�
set noswapfile

set viewdir=~/vim.d/view
set backupdir=~/vim.d/backup
set directory=~/vim.d/swap
set undodir=~/vim.d/undo
set undofile

"!! ���̂����̃I�v�V������L���ɂ���ƁAneocomplcache���ُ�ɏd���Ȃ�B
"set viminfo=%,'50,/50,:50,<50,@50,h,f1,n~/.viminfo

set sessionoptions=curdir,resize,tabpages,winpos,winsize,unix,slash
"�o�b�t�@�̃I�v�V�����̓Z�[�u���Ȃ�
set viewoptions=cursor,folds,slash,unix
"�R�}���h����ۑ���
set history=100

"�R�}���h���C���̍���(gVim�p���ʂɗp�ӂ���)
set cmdheight=2

"�v���r���[�E�C���h�E�̍���
set previewheight=10

set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set ambiwidth=double

"�s�ԍ���\��
"set nonumber

"�s�ԍ��\��
set number

"�S�p�X�y�[�X������
highlight link ZenkakuSpace Error
match ZenkakuSpace /�@/

"�c�[���o�[���\���ɂ���
set guioptions-=T

"���j���[�o�[���\���ɂ���
set guioptions-=m

"�E�X�N���[���o�[��\��
set guioptions-=r
set guioptions-=R

"���X�N���[���o�[��\��
set guioptions-=l
set guioptions-=L

"���X�N���[���o�[��\��
set guioptions-=b
set matchpairs+=<:>

" "=== @keymap-generic
" " CUI Vim�ł�<Alt->�̃L�[�}�b�v���\�ɂ���B�V�t�g���g�ݍ��킹��
" " <A-S-n>�Ƃ���OK
" " [�Q�l]
" " http://blog.remora.cx/2012/07/using-alt-as-meta-in-vim.html
" let c = 'a'
" while c <= 'z'
"     execute "set <M-" . c . ">=\e" . c
"     execute "imap \e" . c . " <M-" . c . ">"
"     execute "set <M-S-" . c . ">=\e" . toupper(c)
"     execute "imap \e" . toupper(c) . " <M-" . c . ">"
"     let c = nr2char(1+char2nr(c))
" endw
" ��LAlt�L�[�̐ݒ�ɂ��R�}���h���[�h��ESC���Q�񉟂��Ȃ��ƃm�[�}�����[�h�ɖ�
" ��Ȃ��Ȃ�̂ŁAESC�Q�A�����}�b�v���Ă����B
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
" �s�ԍ��\���ݒ�g�O���̃V���[�g�J�b�g
" nnoremap  <silent> <F1> :<C-u>call ToggleNumberOption2()<CR>
" " ���΍s�\���ݒ�g�O���̃V���[�g�J�b�g
" nnoremap  <silent> <F2> :<C-u>call ToggleNumberOption()<CR>
"�t���X�N���[�����[�h
nnoremap <silent> <F11> :call ToggleFullScreen()<CR>
" �����n�C���C�g����
nmap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>

" �c�����͘_���ړ�����
noremap j gj
noremap k gk

" Shift-hjkl�ŃE�B���h�E�T�C�Y����
nnoremap <S-j> <C-w>10-
nnoremap <S-k> <C-w>10+
nnoremap <S-l> <C-w>10>
nnoremap <S-h> <C-w>10<
" Shift + �J�[�\���L�[�ł̃E�B���h�E�T�C�Y�ύX
nnoremap <silent><S-Down>  <C-w>10-
nnoremap <silent><S-Up>    <C-w>10+
nnoremap <silent><S-Left>  <C-w>10<
nnoremap <silent><S-Right> <C-w>10>

" Visual���[�h�őI�񂾔͈͂�'> | <'�ŃC���f���g����
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" ���݂̃E�B���h�E�݂̂��c��
nnoremap <C-w>O <C-w>o
" �o�b�t�@�폜
nnoremap <C-w>d :<C-u>call <SID>delete_current_buf()<CR>
nnoremap <C-w>D :<C-u>bdelete<CR>
nnoremap <silent><Leader>h :<C-u>SmartHelp<Space><C-l>
" �R�}���h���C���E�B���h�E
" �������ʂ̒��S�ɁB
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz
"�J�����g�o�b�t�@�̃f�B���N�g���ֈړ�
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"���O�̃R�}���h���Ď��s�B@:���r���g�C���̕��@�����A@��YankRing��map����Ă����
"�ňȉ��ő�p����B
nnoremap <C-@> q:<ESC>k<CR>
" " tag���v���r���[�ŊJ��
" nnoremap <silent><Space>s  <C-w>}
" " �v���r���[�E�C���h�E�����
" nnoremap <silent><Space>q  <C-w><C-z>
" nnoremap <silent> <C-c><C-d> :call CdRootDir()<CR>

" " http://gajumaru.ddo.jp/wordpress/?p=1024
" cnoremap OD <Left>
" cnoremap OB <Down>
" cnoremap OA <Up>
" cnoremap OC <Right>
"Emacs���C�N�ȃo�C���f�B���O�D�|�b�v�A�b�v���o�Ȃ��悤�Ɉړ��D
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
" Emacs���C�N<C-k> http//vim.g.hatena.ne.jp/tyru/20100116
inoremap <silent><expr><C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
" �N���b�v�{�[�h����\��t��
cnoremap <C-y> <C-r>+
" �L�����Z��
cnoremap <C-g> <C-u><BS>
"�o�b�t�@�؂�ւ�
nnoremap <silent><C-n>   :<C-u>bnext<CR>
nnoremap <silent><C-p>   :<C-u>bprevious<CR>
"<BS>�̋���
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
" �V���{��������
nnoremap <silent>[cscope]s :<C-u>cs find s <C-R>=expand("<cword>")<CR><CR>
" ��`������
nnoremap <silent>[cscope]g :<C-u>cs find g <C-R>+ <CR>
" ���̊֐�����Ă΂��֐�������
nnoremap <silent>[cscope]d :<C-u>cs find d <C-R>=expand("<cword>")<CR><CR>
" ���̊֐���ǂ�ł���֐�������
nnoremap <silent>[cscope]c :<C-u>cs find c <C-R>=expand("<cword>")<CR><CR>
" �����������
nnoremap <silent>[cscope]t :<C-u>cs find t <C-R>=expand("<cword>")<CR><CR>
" egrep�p�^�[��������
nnoremap <silent>[cscope]e :<C-u>cs find e <C-R>=expand("<cword>")<CR><CR>
" ���̃t�@�C��������
nnoremap <silent>[cscope]f :<C-u>cs find f <C-R>=expand("<cfile>")<CR><CR>
" ���̃t�@�C����include���Ă���t�@�C��������
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

"�J�����g�f�B���N�g�������݊J���Ă���o�b�t�@�̃f�B���N�g���ɂ���
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

" git �̃��[�g�f�B���N�g����Ԃ�
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


" git �̃��[�g�f�B���N�g����Ԃ�
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
            " �c����
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
        " �������m�ۂł��Ȃ��Ƃ��̓^�u�ŊJ��
        if winwidth(0) < 80
            execute 'quit'
            execute 'tab help ' . a:args
        endif
        silent! AdjustWindowWidth --direction=shrink
    endif
endfunction

" �o�b�t�@���폜
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
" �J�[�\�����̃n�C���C�g�O���[�v���擾
command! -nargs=0 GetHighlightingGroup
            \ echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '>trans<'
            \ . synIDattr(synID(line('.'),col('.'),0),'name') . '>lo<'
            \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
command! Date :call setline('.', getline('.') . strftime('%Y/%m/%d (%a) %H:%M'))
command! CopyCurrentPath :call s:copy_current_path()
" �c���Ɖ��������� help �̊J���������߂�
command! -nargs=* -complete=help SmartHelp call <SID>smart_help(<q-args>)
" �������J�E���g
command! -nargs=0 Wc %s/.//nge

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO_COMMANDS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc augroup
" *.md �œǂݍ��� filetype ��ύX�i�f�t�H���g�� modula2�j
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
" Gnuplot �̃t�@�C���^�C�v��ݒ�
Autocmd BufRead,BufNew,BufNewFile *.plt,*.plot,*.gnuplot setlocal ft=gnuplot
" Ruby �� guard �p�t�@�C��
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
" �O��I�������J�[�\���s�Ɉړ�
Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" �܂肽���݂̎���mkview loadview������������
Autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
Autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" �ۑ����ɍs���̋󔒂���������
Autocmd BufWritePre * :%s/\s\+$//ge
Autocmd CmdwinEnter * map <buffer> <S-CR> <CR>q:
Autocmd BufRead,BufNewFile *.dis set filetype=cmix
Autocmd Syntax mixed so ~/.vim/syntax/cmix.vim
Autocmd WinEnter,BufRead * set cursorline
Autocmd WinLeave * set nocursorline
Autocmd CmdwinEnter * call s:InitCmdWin()
" git commit message �̂Ƃ��͐܂肽���܂Ȃ�(diff �Œ��r���[�Ȑ܂肽���݂ɂȂ肪��)
" git commit message �̂Ƃ��̓X�y�����`�F�b�N����
AutocmdFT gitcommit setlocal nofoldenable spell | set fileencoding=utf-8
AutocmdFT diff setlocal nofoldenable
AutocmdFT c   setlocal omnifunc=ccomplete#Complete
AutocmdFT cpp setlocal omnifunc=ccomplete#Complete
AutocmdFT ps1 setlocal omnifunc=poshcomplete#CompleteCommand


" �X�N���v�g�Ɏ��s�\�����������ŕt����
if executable('chmod')
    Autocmd BufWritePost * call s:add_permission_x()

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN_SETTINGS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! empty(neobundle#get('unite.vim'))
    " unite�̐����ɂ��Ă͈ȉ������N�悪�ڂ����B
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

    " �R�}���h���C���E�B���h�E�� Unite �R�}���h�����
    nnoremap [unite]u               :<C-u>Unite source<CR>
    " �o�b�t�@���J�������̃p�X���N�_�Ƃ����t�@�C������
    nnoremap <silent>[unite]f       :<C-u>UniteWithBufferDir -buffer-name=files -vertical file directory file/new<CR>
    " �w�肵���f�B���N�g���ȉ����ċA�I�ɊJ��
    nnoremap <silent>[unite]F       :<C-u>UniteWithBufferDir -no-start-insert file_rec/async -auto-resize<CR>
    " �ŋߎg�p�����t�@�C��
    nnoremap <silent>[unite]m       :<C-u>Unite file_mru directory_mru file/new<CR>
    " �o�b�t�@�ꗗ
    nnoremap <silent>[unite]b       :<C-u>Unite -immediately -no-empty -auto-preview buffer<CR>
    " �v���O���~���O�ɂ�����A�E�g���C���̕\��
    " nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview -no-quit<CR>
    nnoremap <silent>[unite]o       :<C-u>Unite outline -vertical -no-start-insert -auto-preview<CR>
    " �R�}���h�̏o��
    nnoremap <silent>[unite]O       :<C-u>Unite output<CR>
    nnoremap <silent>[unite]c       :<C-u>Unite codic<CR>
    " grep�����D
    nnoremap <silent>[unite]g       :<C-u>Unite -no-start-insert grep -auto-preview<CR>
    " Git �̃��[�g�f�B���N�g�����J��
    nnoremap <silent><expr>[unite]G  ":\<C-u>Unite file -input=".fnamemodify(GitRootDir(),":p")
    " Unite�o�b�t�@�̕���
    nnoremap <silent>[unite]r       :<C-u>UniteResume<CR>
    " Unite �\�[�X�ꗗ
    nnoremap <silent>[unite]s       :<C-u>Unite source -vertical<CR>
    " �u�b�N�}�[�N
    noremap <silent>[unite]B        :<C-u>Unite bookmark<CR>
    " ���W�X�^
    noremap <silent>[unite]R        :<C-u>Unite -buffer-name=register register<CR>
    " help(���ڂ������̂ŁC���������͂��Ă���i�荞��)
    nnoremap <silent>[unite]hh      :<C-u>UniteWithInput help -vertical<CR>
    " ����
    nnoremap <silent>[unite]hc      :<C-u>Unite -buffer-name=lines history/command -start-insert<CR>
    nnoremap <silent>[unite]hs      :<C-u>Unite -buffer-name=lines history/search<CR>
    nnoremap <silent>[unite]hy      :<C-u>Unite -buffer-name=lines history/yank<CR>


    " unite-lines �t�@�C�����C���N�������^������
    nnoremap <silent><expr> [unite]L line('$') > 5000 ?
                \ ":\<C-u>Unite -no-split -start-insert -auto-preview line/fast\<CR>" :
                \ ":\<C-u>Unite -start-insert -auto-preview line:all\<CR>"
    " �J���[�X�L�[��
    nnoremap [unite]C :<C-u>Unite -auto-preview colorscheme<CR>
    " ����
    nnoremap <silent>[unite]/ :<C-u>execute 'Unite grep:'.expand('%:p').' -input='.escape(substitute(@/, '^\\v', '', ''), ' \')<CR>

    " �G���^�[�̑���Ɉȉ��̃L�[�ŃE�B���h�E�𐅕��������ĊJ��
    AutocmdFT unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    AutocmdFT unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
    " �G���^�[�̑���Ɉȉ��̃L�[�ŃE�B���h�E�𐂒��������ĊJ��
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
    ""�O��s��ꂽ�⊮���L�����Z������
	"inoremap <expr><C-g>     neocomplete#undo_completion()
    ""���ݑI�����Ă�������L�����Z�����A�|�b�v�A�b�v�����
	inoremap <expr><C-g>  neocomplete#cancel_popup()
    "�⊮���̂Ȃ�����A���ʂ��镔����⊮����
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
    "���ݑI�����Ă�������m�肷��
	inoremap <expr><C-y>  neocomplete#close_popup()
    ""���ݑI�����Ă�������L�����Z�����A�|�b�v�A�b�v�����
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

    "AutoComplPop�𖳌��ɂ���
    let g:acp_enableAtStartup = 0
    "vim�N�����ɗL����
    let g:neocomplete#enable_at_startup = 1
    "smart_case��L���ɂ���D�啶�������͂����܂ő啶���������̋�ʂ��Ȃ���
    let g:neocomplete#enable_smart_case = 1
    " �����܂��Ȍ���v
    let g:neocomplete#enable_fuzzy_completion = 1
    " �f���~�^�iautoload �֐��� # �Ȃǁj�̎����}��
    let g:neocomplete#enable_auto_delimiter = 1
    "�V���^�b�N�X���L���b�V������Ƃ��̍ŏ���������4��
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    "�⊮���J�n������͕�����
    let g:neocomplete#auto_completion_start_length = 2
    " �����ݒ肵�Ă���ƁA�B����Ԃ������Ȃ��Ȃ��Ă��܂����B
	" let g:neocomplete#enable_cursor_hold_i = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
    "���{������W���Ȃ��悤�ɂ���
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    "���X�g�\��
    let g:neocomplete#max_list = 2000
    " ������`
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : expand('~/.vimshell/command-history'),
                \ }
    "��؂蕶���p�^�[���̒�`
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

    " " �I���j�⊮�����s����p�^�[��
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
    " �g�p����⊮�̎�ނ����炷
    " ���݂�Source�̎擾�� `:echo keys(neocomplete#variables#get_sources())`
    " �f�t�H���g: ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer', 'file/include']
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'include', 'tag', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'omni', 'vim', 'buffer']
    "   \ }
    " let g:neocomplete#sources = {
    "   \ '_' : ['file', 'file/include', 'neosnippet', 'syntax', 'member', 'include', 'omni', 'vim', 'buffer']
    "   \ }

    " neocomplete �⊮�p�֐�
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
    " [vimfiler����]
    " VimFiler��vimfiler�o�b�t�@���쐬����B����vimfiler�o�b�t�@�����݂��Ă���΁A���p�����B
    " ����vimfiler�o�b�t�@���쐬�������ꍇ��VimFilerCreate���g�p����B
    nnoremap            [vimfiler] <nop>
    nmap     <Space>f   [vimfiler]
    " vimfiler�o�b�t�@�𐶐�����B���łɑ��݂��Ă���΂��̃o�b�t�@���J���B
    nnoremap [vimfiler]f        :<C-u>VimFiler<CR>
    " �V����vimfiler�o�b�t�@��������B
    nnoremap [vimfiler]C        :<C-u>VimFilerCreate<CR>
    " vimfiler�o�b�t�@���J�����g�f�B���N�g���ŊJ���B
    nnoremap [vimfiler]c        :<C-u>VimFilerCurrentDir<CR>
    " vimfiler�o�b�t�@���J�����g�o�b�t�@�ŊJ���B
    nnoremap [vimfiler]b        :<C-u>VimFilerBufferDir<CR>
    " vimfiler�o�b�t�@����ʕ����ŊJ���B
    nnoremap [vimfiler]s        :<C-u>VimFilerSplit<CR>
    " vimfiler��2��ʂŊJ���B
    nnoremap [vimfiler]d        :<C-u>VimFilerDouble<CR>
    " vimfiler��exploler���ɊJ��
    nnoremap [vimfiler]e        :<C-u>VimFilerExplorer<CR>
    " .git�̂���f�B���N�g�����J���B
    nnoremap <silent><expr>[vimfiler]g ":\<C-u>VimFiler " . <SID>GitRootDir() . '\<CR>'
    " .git�̂���f�B���N�g����exploer���ɊJ���B
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
    let g:ctrlp_clear_cache_on_exit = 0   " �I�����L���b�V�����N���A���Ȃ�
    let g:ctrlp_mruf_max            = 500 " MRU�̍ő�L�^��
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|neocon|neocomplcache|neocomplete|cache)$',
        \ 'file': '\v\.(mp3|mp4|bmp|jpg|png|pdf|zip|m4a|pkg|gz|'.
        \               'o|obj|a|exe|dll|so|swp|ttf|mov|avi|dmg|rar|xls|mobi)$',
        \ }
endif

if ! empty(neobundle#get('clever-f.vim'))
    " �啶������͂����������啶������������ʂ���A���Ȃ�
    let g:clever_f_smart_case = 1
    " migemo���g�p����A���Ȃ�
    let g:clever_f_use_migemo = 1
    " �s���܂�����f����������A���Ȃ�
    let g:clever_f_across_no_line = 0
    " f�ŏ������AF�ŋt�����Ɉړ��������Œ肷��A���Ȃ�
    let g:clever_f_fix_key_direction = 1
    " �C�ӂ̋L���Ƀ}�b�`���镶�����w�肷��B
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
    " �����I��SyntasticCheck���Ăяo�����������\���`�F�b�N���s���B
    let g:syntastic_mode_map = { 'mode': 'passive' }

    nnoremap         [syntastic]  <nop>
    nmap    <Space>s [syntastic]
    noremap <silent>[syntastic]s :<C-u>SyntasticCheck<CR>
    noremap <silent>[syntastic]r :<C-u>SyntasticReset<CR>
    noremap <silent>[syntastic]i :<C-u>SyntasticInfo<CR>
endif

if ! empty(neobundle#get('vim-quickrun'))
    "<Leader>r ���g��Ȃ�
    let g:quickrun_no_default_key_mappings = 1
    " quickrun_config�̏�����
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    " "QuickRun ���ʂ̊J����
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
    " runner vimproc �ɂ����� polling �Ԋu
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
    " QuickFix��������
    " 0 : �Ȃɂ����Ȃ�
    " 1 : QuickFix/���P�[�V�������X�g�̗����ŗL��
    " 2 : ���P�[�V�������X�g�̂ݗL��
    " 3 : QFixMemo/QFixGrep�R�}���h�ŊJ�����ꍇ�̂ݗL��
    " @note
    " preview�@�\�Ƃ��͂��Ȃ�֗��Ȃ̂����A�v���O�C����F�X�Ɠ��ꂾ���Ƌ�������
    " �g���u�����Ƃ������B�����qfixhowm�@�\���p���̂ݗL���Ƃ��Ă����B
    let g:QFixWin_EnableMode = 3
    " QuickFix�E�B���h�E�Ńv���r���[��L���ɂ���
    let g:QFix_PreviewEnable = 1
    " QuickFix�E�B���h�E�ł͂Ȃ����P�[�V�������X�g���g�p���� or ���Ȃ�
    let g:QFix_UseLocationList = 0
    " QuickFix�E�B���h�E�̕�
    let g:QFix_Width = 70
    " QuickFix�E�B���h�E�̍���
    let g:QFix_Height = 10
    " �v���r���[�E�B���h�E�̕�
    let g:QFix_PreviewWidth  = 70
    " �v���r���[�E�B���h�E�̍���(previewheight���g�p�������Ȃ��ꍇ�̂ݎw��)
    let g:QFix_PreviewHeight = 15
    " QuickFix�E�B���h�E�̊J����
    " @note botright �ŉ��i�ɕ\��
    let g:QFix_CopenCmd = 'botright'
    " �v���r���[�E�B���h�E�̊J�����w��
    " @note topleft �ŏ�i�ɊJ��
    let g:QFix_PreviewOpenCmd = 'topleft'
    " QuickFix�E�B���h�E�ŃJ�[�\�����C����\��
    let g:QFix_CursorLine = 1
    " QuickFix�E�B���h�E�̃v���r���[��filetype�ʂ̃n�C���C�g��L���ɂ���
    let g:QFix_PreviewFtypeHighlight = 1
    " QuickFix�E�B���h�E����J������E�B���h�E����� or ���Ȃ�
    let g:QFix_CloseOnJump = 0
    " QuickFix�E�B���h�E�� <S-CR> �͕����ł͂Ȃ��^�u�ŊJ���ɂ� 'tab'�ɐݒ肷��
    let g:QFix_Edit = 'tab'
    " �v���r���[�ΏۊO�t�@�C���̎w��
    let g:QFix_PreviewExclude = ''.
      \'[~#]$\|\.pdf$\|\.mp3$\|\.jpg$\|\.bmp$\|\.png$\|\.zip$\|\.rar$\|\.exe$\|' .
      \'\.dll$\|\.lnk$\|\.o$\|\.obj$\|\.a$\|\.so$\|\.d$\|tags$\|cscope.out$'
    " �v���r���[��ʂ̃J�[�\�����C����\��
    let g:QFix_PreviewCursorLine = 1
    " �v���r���[�E�B���h�E�̐܂�Ԃ��\��
    let g:QFix_PreviewWrap = 1
    " Grep�R�}���h�̃L�[�}�b�v
    let g:MyGrep_Key  = 'g'
    " Grep�R�}���h��2�X�g���[�N�ڃL�[�}�b�v
    let g:MyGrep_KeyB = ','
    " grep�Ώۂɂ������Ȃ��t�@�C�����̐��K�\��
    let g:MyGrep_ExcludeReg = g:QFix_PreviewExclude

    if has('win32') || has('win64')
        " Windows��cygwin1.7�ȍ~��grep.exe���g�p����ꍇ�̂� 1 �ɐݒ�
        let g:MyGrep_cygwin17 = 1
        "" �g�p����grep(Windows)
        "let mygrepprg = 'findstr'
        let g:mygrepprg = 'grep'
        " ���{�ꂪ�܂܂��ꍇ��grep�w��
        " let myjpgrepprg = 'grep'
        let g:myjpgrepprg = ''
        " �O��grep(shell)�̃G���R�[�f�B���O(Windows)
        let g:MyGrep_ShellEncoding = 'cp932'
        " �O��grep(shell)�ŃG���R�[�f�B���O�ϊ����s����ꍇ�̃G���R�[�f�B���O�w��
        " (�ʏ��MyGrep_ShellEncoding�Ɠ���̂��ߐݒ肵�Ȃ��ł�������)
        let g:MyGrep_FileEncoding = ''
    else
        " �g�p����grep(Unix)
        let g:mygrepprg = 'grep'
        " ���{�ꂪ�܂܂��ꍇ��grep�w��
        let g:myjpgrepprg = 'grep'
        " �O��grep(shell)�̃G���R�[�f�B���O(Unix)
        let g:MyGrep_ShellEncoding = 'utf-8'
        " �O��grep(shell)�ŃG���R�[�f�B���O�ϊ����s����ꍇ�̃G���R�[�f�B���O�w��
        " (�ʏ��MyGrep_ShellEncoding�Ɠ���̂��ߐݒ肵�Ȃ��ł�������)
        let g:MyGrep_FileEncoding = ''
    endif

    " �����f�B���N�g���̓J�����g�f�B���N�g������_�ɂ���
    " 0 : ���o�b�t�@�̃t�@�C�������݂���f�B���N�g��
    " 1 : �J�����g�f�B���N�g��
    let g:MyGrep_CurrentDirMode = 1
    " �����͏�ɍċA����
    let g:MyGrep_RecursiveMode = 0
    " �u���ߕ����v�΍��L��/����
    let g:MyGrep_Damemoji = 2
    " �u���ߕ����v��u�������鐳�K�\��
    let g:MyGrep_DamemojiReplaceReg = '(..)'
    " �u���ߕ����v�������Œǉ��w�肵�����ꍇ�͐��K�\���Ŏw�肷��
    let g:MyGrep_DamemojiReplace = '[]'
    " QFixGrep�̌������ɃJ�[�\���ʒu�̒P����E��/�E��Ȃ�
    let g:MyGrep_DefaultSearchWord = 1
    " grep���s���ɃG���[���b�Z�[�W���o����\��
    let g:MyGrep_error = 1
    " ���[�U��`�\�Ȓǉ��I�v�V����
    " @note
    " -i --ignore-case �啶���������̈Ⴂ�𖳎�����B
    " -n --line-number �s�ԍ���\������B
    " -I �o�C�i���t�@�C���𖳎�����B
    " -D skip �f�o�C�X�AFIFO�A�\�P�b�g���𖳎�����B
    let g:MyGrepcmd_useropt = ''.
                \' -i -n -I -D skip' .
                \' --exclude-dir=.git --exclude-dir=.svn --exclude-dir=.hg' .
                \' --exclude-dir=res --exclude-dir=resource' .
                \' --exclude-dir=bin --exclude-dir=lib' .
                \' --exclude-dir=[Dd]oxygen' .
                \' --exclude-dir=[Bb]uild'
    " �قȂ�G���R�[�f�B���O�̃t�@�C�������݂��Ă���ꍇ��grep�𕡐�����s���āA�G��
    " �R�[�f�B���O���C�ɂ������{�ꌟ�����\�ł��B
    " �}���`�G���R�[�f�B���Ogrep���[�h�̐ؑւ�<Leader>rm�ł��s���܂��B
    " �Ȃ�����������ɓ��{����܂܂Ȃ��ꍇ�́A��񂵂�grep�͎��s����܂���B
    " �}���`�G���R�[�f�B���Ogrep���[�h
    let g:MyGrep_MultiEncoding = 1
    " �}���`�G���R�[�f�B���Ogrep �G���R�[�f�B���O���X�g
    let g:MyGrep_MultiEncodingList = ['utf-8', 'cp932']

    " QFixHowm�Ƃ̃I�v�V�����R���o�[�g���s�� or �s��Ȃ�
    let g:QFixHowm_Convert = 1
    " �����t�@�C���̕ۑ���
    let g:qfixmemo_dir           = '~/Dropbox/qfixmemo'

    let g:qfixmemo_title    = '#'
    " �����t�@�C���̃t�@�C����
    let g:qfixmemo_filename      = '%y%m%d-%H%M%S.mkd'
    " �����t�@�C���̃t�@�C���G���R�[�f�B���O
    let g:qfixmemo_fileencoding  = 'utf-8'
    " �����t�@�C���̃t�@�C���t�H�[�}�b�g(���s�R�[�h)
    let g:qfixmemo_fileformat    = 'unix'
    " �����̃t�@�C���^�C�v
    let g:qfixmemo_filetype      = 'markdown'
    " NOTE:
    " �����t�@�C������ [[�L�[���[�h]] �̂悤�� [[ �� ]] ��Wiki�X�^�C���̃L�[���[�h��
    " �쐬����ƃI�[�g�����N������A�L�[���[�h���<CR>�������ƑΉ�����t�@�C�����J��
    " ���Ƃ��o���܂��B
    " �L�[���[�h�͕ۑ����Ɏ����쐬����܂����A�S�t�@�C�����������čč쐬���\�ł��B
    " �s�v�ȃL�[���[�h���폜�����ꍇ�Ȃǂ͍č쐬���Ă��������B
    " <Leader>rk           �L�[���[�h�t�@�C�����č쐬
    "
    " �L�[���[�h�͈ȉ��̐��K�\���Œ�`����Ă��܂��B
    " �L�[���[�h�J�n���K�\��
    let g:qfixmemo_keyword_pre = '\[\['
    " �L�[���[�h�I�����K�\��
    let g:qfixmemo_keyword_post = '\]\]'
    " NOTE:
    " howm��come-from�����N��goto�����N����`���Ă���Ύg�p�\�ł��B
    " howm�̃����N�p�^�[��
    let g:howm_glink_pattern = '>>>'
    let g:howm_clink_pattern = '<<<'

    " NOTE:
    " �L�[���[�h�����͖������\�ł��B
    " �L�[���[�h���g�p���Ȃ� or ����
    let g:qfixmemo_use_keyword = 1

    " MRU�̕\����
    let g:QFixMRU_Entries   = 100
    " �ŋߍX�V�����G���g���ꗗ�̓���
    let g:qfixmemo_RecentDays = 100

    " MRU�ۑ��t�@�C����
    let g:QFixMRU_Filename  = g:qfixmemo_dir .'/.qfixmru'
    " MRU�̊�f�B���N�g��
    let g:QFixMRU_RootDir   = g:qfixmemo_dir

    " �^�C�g���s�����̐��K�\����������
    let g:QFixMRU_Title = {}

    " MRU�o�^�p�̐��K�\��(Vim)���w��
    let g:QFixMRU_Title['mkd'] = '^#[^#]'

    let qfixmemo_timeformat       = '<!-- %Y-%m-%d %H:%M -->'

    " qfixmemo#UpdateTime()�Ń^�C���X�^���v�̒u���Ɏg�p���鐳�K�\��(Vim)
    let qfixmemo_timeformat_regxp = '<!-- \d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2} -->'

    " �^�C���X�^���v�s�Ƃ݂Ȃ����K�\��(Vim)
    let qfixmemo_timestamp_regxp  = qfixmemo_timeformat_regxp

    " qfixmemo#AddTitle()�ŋ[���^�C�g���s�Ƃ݂Ȃ����K�\��(Vim)
    let qfixmemo_alt_title_regxp  = ''

    " NOTE:
    " �O��grep�Ɠ����Ŏg��Vim�̐��K�\�����قȂ�ꍇ�́A�X��grep��p�̐��K�\����ݒ�
    " �\�ł��B
    " �^�C�g���s�����̐��K�\��(grep)���w��
    let g:QFixMRU_Title['mkd_regxp'] = '^#[^#]'

    " QFixMemo���N�����Ȃ��ꍇ�ł��I������MRU��ۑ�����
    let g:QFixMRU_VimLeaveWrite = 1

    " �^�C�g���s�������K�\��������
    let g:QFixMRU_Title = {}

    " �^�C�g���s�������K�\��(Vim)
    let g:QFixMRU_Title['vim'] = '^\s*\(silent!\?\)\?\s*func'
    let g:QFixMRU_Title['java'] = '^\s*public.*(.*).*{'
    let g:QFixMRU_Title['js']   = '^\s*function'
    let g:QFixMRU_Title['py']   = '^def'
    let g:QFixMRU_Title['rb']   = '^\s*def'

    " 8.3 �A�E�g���C���I�v�V����                  *qfixmemo_submenu_outline_option*
    " �A�E�g���C���Ƃ����Ă�foldmethod��syntax��ݒ肵�Ă��邾���Ȃ̂ŁA�D�݂ɉ�����
    " �ύX���Ă݂Ă��������B
    " �ڂ�����|foldmethod|���Q�Ƃ��Ă��������B >
    " �A�E�g���C��(foldenable)
    let g:qfixmemo_outline_foldenable = 1
    " �A�E�g���C��(foldmethod)
    let g:qfixmemo_outline_foldmethod = 'indent'
    " �A�E�g���C��(foldexpr)
    let g:qfixmemo_outline_foldexpr = "getline(v:lnum)=~'^[=.*�E]'?'>1':'1'"
    " �A�E�g���C��(syntax)
    let g:qfixmemo_outline_syntax = 'ezotl'

    " NOTE:
    " ��t�@�C�������G���g���̏ꍇ�A�t�H�[���f�B���O���g�p����ƌ��₷���Ȃ�܂��B
    " <Leader>o           �t�H�[���f�B���O�ؑ�
    " �t�H�[���f�B���O�p�^�[���� qfixmemo_folding_pattern �Œ�`����A
    " qfixmemo_folding�� 0 ���� qfixmemo�̃t�H�[���f�B���O�͖���������܂��B >
    " �f�t�H���g�ł͍s�����^�C�g���L�����ǂ����Ő܂肽���݂܂�
    let g:qfixmemo_folding         = 1
    let g:qfixmemo_folding_pattern = '^=[^=]'

    " 12.3 �ۑ��O����                                           *qfixmemo_pre_save*
    " �ۑ��O�Ƀ^�C�g���s�ƃ^�C���X�^���v�̕t���ƃt�@�C�����̋�s�폜�����s���܂��B
    " �ۑ��O������ .vimrc���ŃI�v�V�����ݒ肷�鎖�ŕύX�\�ł��B
    " �^�C�g���s�t��
    let g:qfixmemo_use_addtitle        = 1
    " �^�C���X�^���v�t��
    let g:qfixmemo_use_addtime         = 1
    " �^�C���X�^���v�A�b�v�f�[�g
    let g:qfixmemo_use_updatetime      = 1
    " �t�@�C�����̋�s���폜
    let g:qfixmemo_use_deletenulllines = 1
    " �L�[���[�h�����N�쐬
    let g:qfixmemo_use_keyword         = 1
    "�\��ETODO�̃\�[�g�D��x
    let QFixHowm_ReminderPriority = {'@' : 1, '!' : 1, '+' : 3, '-' : 4, '~' : 5, '.' : 6}
    ",y �ŕ\�������\��ETODO�p�^�[��
    let QFixHowm_ListReminder_ScheExt = '[-@+!~]'
    "�\��ETODO�̌����ꏊ�w��
    let g:QFixHowm_ScheduleSearchDir = g:qfixmemo_dir .'/quick'
    let g:QFixHowm_QuickMemoFile = g:QFixHowm_ScheduleSearchDir . '/quick-000000-000000.mkd'

    "�\��ETODO�̌����t�@�C�����w��
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
    " �������w��𔼊p/�S�p�P�ʂɂ���
    " 1:���p
    " 2:�S�p
    let JpFormatCountMode = 2
    " ���e(�܂�Ԃ�)�S�p������
    let JpCountChars = 40

    " ���e�s��
    let JpCountLines = 17

    " �֑������̍ő�Ԃ牺���莚��
    let JpCountOverChars = 1

    " ���p�ꕶ�����I�[�o�[���Ă��܂�Ԃ�����������/���Ȃ�
    let JpFormatHankakuOver = 0

    " �܂�Ԃ�������(���e�p��������)�� textwidth����ݒ肷��
    let JpCountChars_Use_textwidth = 0

    " �}�����[�h�ňꕶ�����͂���x�Ɏ������`���s��/�s��Ȃ�
    let JpFormatCursorMovedI = 1

    " ���`�ΏۊO�s�̐��K�\��
    let JpFormatExclude = '^$'

    " ���e�p�����Z�v�Z���ɍ폜���郋�r���̐��K�\��
    let JpCountDeleteReg = '\[.\{-}\]\|<.\{-}>\|�s.\{-}�t\|�m.\{-}�n\|�b'

    " ���`�R�}���h���g�p�����玩�����`��ON
    let JpAutoFormat = 1

    " �A���}�[�J�[
    let JpFormatMarker = "\t"

    " ��{�I�ȏ������@
    " 1. �܂��w�蕶�����ɍs�𕪊�
    " 2. ���s�̍s���֑�����(JpKinsoku)�����ݍs�ֈړ�
    " 3. ���ݍs�̍s���֑�����(JpKinsokuE)�����s�ֈړ�
    " 4. �Ԃ牺���蕶�����𒴂��ĂԂ牺�����Ă�����ǂ��o��(JpKinsokuO)
    "    (JpKinsokuO�����ݒ�̏ꍇ��JpKinsoku�ő�p����܂�)

    " �s���֑�
    let JpKinsoku = '[-!?}>�|��`�I�H�J�K�T�U�j�n�����߁R�S�[�X�]�E:;.�������A�B�C�D,)\]�p�l�r�t�v�x�z���f�h��d�\�c]'
    " �s���֑�
    let JpKinsokuE = '[0-9a-zA-Z([{<�i�o�k�q�s�u�w�y���e�g��]'
    " ��_�ƕ�����
    let JpKutenParen = '[�A�B�C�D,)\]�p�l�r�t�v�x�z���f�h��]'
    " ��_�ƕ����ʂŕ����s�����ǂ��o���p
    " �����s������ǂ��o����JpNoDivN����������A��������ǂ��o���B
    " �ł����H�\�\<����> ���������� �H�͎c���ā\�\�݂̂�ǂ��o�����߂̎w��B
    let JpNoDivN = '[�A�B�C�D,)\]�p�l�r�t�v�x�z���f�h��!?�I�H]'
    " �����s��
    let JpNoDiv = '[�\�c�d]'

    " �A���}�[�J�[��g�p����TOL�L�����N�^�[
    let JpJoinTOL = '[\s�@�u�E��]'
    " �A���}�[�J�[��g�p����EOL�L�����N�^�[
    let JpJoinEOL = '[�B�v�I�H�n]'

    " �}�����[�h�ֈڍs�����玩���A��
    " 0 : �Ȃɂ����Ȃ�
    " 1 : �J�[�\���ʒu�ȍ~�������A��
    " 2 : �p���O���t�������A��
    let JpAutoJoin = 1

    " gq���g�p���Đ��`���s��
    let JpFormatGqMode = 0

    " gq���g�p���Đ��`����ꍇ�̐��`�R�}���h
    " �󕶎���Ȃ猻��formatexpr�ɐݒ肵�Ă���R�}���h���g�p�����
    let JpFormat_formatexpr = ''
endif

nnoremap <Space>tt :<C-u>TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_map_togglesort = "r"
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 1

" �s���N
hi htmlH1 guifg=#F2D8DF gui=bold
" �I�����W
hi htmlH2 guifg=#EF7585 gui=bold
" �����s���N
hi htmlH3 guifg=#EFC1C4 gui=bold
" ���F
" hi htmlH4 guifg=#FFFF00 gui=bold
hi htmlH4 guifg=#F2D8DF gui=bold
" ������
hi htmlH5 guifg=#00FF00  gui=bold
" ��
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
