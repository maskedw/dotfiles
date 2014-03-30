#export PATH=${HOME}/local/cross/raspberrypi/bin:${HOME}/local/cross/raspberrypi/x-tools/arm-unknown-linux-gnueabi/bin/:${PATH}
#export PATH=$HOME/.nodebrew/current/bin:/usr/local/qt5pi/mkspecs:/opt/cross/bin:/opt/cross/x-tools/arm-unknown-linux-gnueabi/bin/:${PATH}
# キーバインドはviモード
 bindkey -v

## in
#xsel --input --clipboard
## out
#xsel --output --clipboard

alias raspiqmake='/usr/local/qt5pi/bin/qmake'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

#source ~/.zsh/.zshrc.antigen
source ~/.zsh/git-prompt/zshrc.sh
#source ~/.zsh/incr-0.2.zsh
#source ~/.zsh/auto-fu.zsh/auto-fu.zsh
source ~/.zsh/z-zsh/z.sh
function precmd() {
  z --add "$(pwd -P)"
}

setopt   auto_list auto_param_slash list_packed rec_exact
unsetopt list_beep
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _approximate _list _history

autoload -U compinit
compinit

# source ~/.zsh/auto-fu.zsh/auto-fu.zsh
# function zle-line-init () {
#     auto-fu-init
# }
#     zle -N zle-line-init
# zstyle ':auto-fu:var' disable magic-space
# zle -N zle-keymap-select auto-fu-zle-keymap-select
# # skipwordsはカーソルの直前の引数と比較されます
# zstyle ':auto-fu:var' autoable-function/skipwords \
#   "('|$'|\")*" "^((??)##)"
# # skiplbuffersは実際のコマンドからカーソルまでの文字列と比較されます
# zstyle ':auto-fu:var' autoable-function/skiplbuffers \
#   'rm -[![:blank:]]#' '(cvs|svn) co *'
# # skiplinesは実際のコマンド全体の文字列と比較されます
# zstyle ':auto-fu:var' autoable-function/skiplines \
#   '([[:print:]]##[[:space:]]##|(#s)[[:space:]]#)aptitude [[:print:]]# *'
#
# #zshプロンプトにモード表示####################################
#
# function zle-line-init zle-keymap-select {
#   case $KEYMAP in
#     vicmd)
#     PROMPT="%{$fg[red]%}[%{$reset_color%}%n/%{$fg_bold[red]%}NOR%{$reset_color%}%{$fg[red]%}]%#%{$reset_color%} "
#     ;;
#     main|viins)
#     PROMPT="%{$fg[red]%}[%{$reset_color%}%n/%{$fg_bold[cyan]%}INS%{$reset_color%}%{$fg[red]%}]%#%{$reset_color%} "
#     ;;
#   esac
#   zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
PROMPT='%{$fg[$NCOLOR]%}%c ➤ %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_super_status)%{$reset_color%}'
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
#export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
#export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
#export ZLS_COLORS=$LS_COLORS
#
# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

###
autoload -U compinit; compinit
#export PATH=$PATH:/usr/sbin:~/bin:~/local/bin:~/local/mybin
export PATH=~/local/bin:~/local/mybin:$PATH
export HOSTNAME=hostname
stty stop undef
alias vi=vim
#EDITOR=/usr/bin/vim
EDITOR=/usr/local/bin/vim
alias p=pwd
alias less='less -R'
alias cgdb-arm=cgdb -d $HOME/work/buildroot-2011.02/output/host/usr/bin/arm-linux-gdb
export EDITOR

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#GREP_OPTIONSを設定すると、グローバルにgrepの挙動が変わって、ビルドシステムに
#grepを使っているアプリのビルドに支障をきたすのでやめた。
#GREP_OPTIONS="-n -I -D skip \
#              --exclude-dir=.git --exclude-dir=doxygen --exclude-dir=bin \
#              --exclude-dir=html --exclude-from=$HOME/.grepignore"
#export GREP_OPTIONS

MY_GREP_OPTIONS="-n -I -D skip \
              --exclude-dir=.git --exclude-dir=doxygen --exclude-dir=bin \
              --exclude-dir=html --exclude-from=$HOME/.grepignore"
alias  grepsp="grep $MY_GREP_OPTIONS"
alias fgrepsp="fgrep $MY_GREP_OPTIONS"
alias egrepsp="egrep $MY_GREP_OPTIONS"
# colors付きのまま | less とした時に、color=autoだと色がでないので
# これをつかう。
alias grepsexy='grepsp --color=always'
alias fgrepsexy='fgrepsp --color=always'
alias egrepsexy='egrepsp --color=always'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

zstyle ':completion:*:(processes|jobs)' menu yes select=2

##=============================
## source auto-fu.zsh
##=============================
#function zle-line-init () {
#    auto-fu-init
#}
#zle -N zle-line-init
#zstyle ':completion:*' completer _oldlist _complete

# git completion
#autoload bashcompinit
#source ~/git-completion.bash






################################3

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors

#=============================================================#
# 履歴
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# zsh の開始・終了時刻をヒストリファイルに書き込む
setopt extended_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# シェルのプロセスごとに履歴を共有
setopt share_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

#=============================================================#


# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
#setopt auto_param_slash

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除く
setopt auto_remove_slash

# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt auto_resume

# ビープ音を鳴らさないようにする
setopt NO_beep

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# 内部コマンドの echo を BSD 互換にする
#setopt bsd_echo

# シンボリックリンクは実体を追うようになる
#setopt chase_links

# 既存のファイルを上書きしないようにする
#setopt clobber

# コマンドのスペルチェックをする
#setopt correct

# コマンドライン全てのスペルチェックをする
#setopt correct_all

# =command を command のパス名に展開する
setopt equals

# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control

# 各コマンドが実行されるときにパスをハッシュに入れる
#setopt hash_cmds

# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
setopt NO_hup

# Ctrl+D では終了しないようになる（exit, logout などを使う）
setopt ignore_eof

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# メールスプール $MAIL が読まれていたらワーニングを表示する
#setopt mail_warning

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 補完候補が複数ある時、一覧表示 (auto_list) せず、すぐに最初の候補を補完する
#setopt menu_complete

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
#setopt numeric_glob_sort

# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# 戻り値が 0 以外の場合終了コードを表示する
setopt print_exit_value

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# pushd を引数なしで実行した場合 pushd $HOME と見なされる
setopt pushd_to_home

# rm * などの際、本当に全てのファイルを消して良いかの確認しないようになる
#setopt rm_star_silent

# rm_star_silent の逆で、10 秒間反応しなくなり、頭を冷ます時間が与えられる
#setopt rm_star_wait

# for, repeat, select, if, function などで簡略文法が使えるようになる
setopt short_loops

# デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
#setopt single_line_zle

# コマンドラインがどのように展開され実行されたかを表示するようになる
#setopt xtrace

# 色を使う
setopt prompt_subst

# 文字列末尾に改行コードが無い場合でも表示する
unsetopt promptcr

#コピペの時rpromptを非表示する
setopt transient_rprompt

# cd -[tab] でpushd
setopt autopushd


