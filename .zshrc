if [ -e "$HOME/.shrc" ]; then
    source $HOME/.shrc
fi
if type pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi
if [ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
    eval "$(pyenv virtualenv-init -)"
fi
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# ##################################################
# # System設定
# ##################################################
# # セグフォの時にコアダンプを出力するための設定
# ulimit -c unlimited
#
# # 日本語設定をした後に、CUIで起動すると文字化けしてしまう。この時の環境変数TERM
# # はlinuxなので、この時は英語表記に設定する。
# # http://iwamocchan11.hatenadiary.jp/entry/2015/04/26/014616
# case $TERM in
#       linux) LANG=C ;;
#       *)     LANG=ja_JP.UTF-8;;
# esac
#
# # SSH接続時にX11Forwardingのディスプレイ設定を行う
# if [ -n "$SSH_CLIENT" ] ; then
#     export DISPLAY=`echo $SSH_CLIENT | awk '{print $1}'`:0.0
# fi

##################################################
# zsh-core-settings
##################################################

# プロンプトに色を付ける
autoload -U colors; colors

# プロンプトの設定
#
# 記号の意味は下記のURLが詳しい。
# https://wiki.archlinuxjp.org/index.php/Zsh
#
# 現在使用している記号の意味は以下の通り
# %m            | ホスト名               | localhost
# %n            | ユーザ名               | root
# %#            | ユーザ種別             | #（rootの場合）%（root以外）
# %c            | カレントディレクトリ   | currentdir($PWD=$HOMEの場合は~）
PROMPT='%{$fg_bold[green]%}[%m:%n:%c] %{$reset_color%}
%# '

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

##################################################
# zsh-completions
##################################################
# 補完機能を有効にする
# autoload -Uz compinit
# compinit -C

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Windowsのドライブ補完
# http://qiita.com/from_kyushu/items/4e32b3c6137ec8b7f435
drives=$(mount | sed -rn 's#^[A-Z]: on /([a-z]).*#\1#p' | tr '\n' ' ')
zstyle ':completion:*' fake-files /: "/:$drives"
unset drives

##################################################
# zsh-options
##################################################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+D ではzshを終了しないようになる（exit, logout などを使う）
setopt ignore_eof

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# cd したら自動的にpushdする
setopt auto_pushd

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除く
setopt auto_remove_slash

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# zsh の開始・終了時刻をヒストリファイルに書き込む
setopt extended_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs

# 戻り値が 0 以外の場合終了コードを表示する
setopt print_exit_value

# pushd を引数なしで実行した場合 pushd $HOME と見なされる
setopt pushd_to_home

# rm * などの際、本当に全てのファイルを消して良いかの確認しないようになる
#setopt rm_star_silent

# for, repeat, select, if, function などで簡略文法が使えるようになる
setopt short_loops

# コマンドラインがどのように展開され実行されたかを表示するようになる
#setopt xtrace

# 色を使う
setopt prompt_subst

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

#=============================================================#

##################################################
# zsh-keybinds
##################################################
# キーバインドはviモード
bindkey -v

# Ctrl-PとCtrl-Nで前方一致検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# インクリメンタルヒストリ検索 ('*'によるワイルドカードとかも使用可)
bindkey "^r" history-incremental-pattern-search-backward
bindkey "^s" history-incremental-pattern-search-forward

##################################################
# zsh-alias
##################################################
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# -2オプションをつけないと、Vimの色設定が崩れる。よくわからん。
alias tmux='tmux -2'


# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

##################################################
# zsh-plugins
##################################################

if [ -f ~/.zplug/init.zsh ]; then

    source ~/.zplug/init.zsh

    # bundleやgem、vagrantといった代表的なコマンドに対する候補を表示するようになります。
    zplug 'zsh-users/zsh-completions'

    # プロンプトのコマンドを色づけするプラグイン。
    # 実行可能とそうでないもの（コマンド名のタイポなど）で色が変わるため、操作性が大きく向上します。
    zplug 'zsh-users/zsh-syntax-highlighting'

    # 簡単にgitルートへcdするやつ。
    zplug "mollifier/cd-gitroot"

    zplug "felixr/docker-zsh-completion"

    # cd を強化する
    zplug "b4b4r07/enhancd", use:init.sh

    # # pecoのようなインタラクティブフィルタツールのラッパ。
    # # コマンド履歴の検索や、ghqで管理しているディレクトリへの移動などの便利なシェルが
    # # 定義されているため、自分でこれらを管理する必要がなくなります。
    # # もちろん、pecoなどをインストールしておく必要があります

    # zplug 'mollifier/anyframe'

    # # 有名なインタラクティブフィルタの一つ
    # zplug "peco/peco", as:command, from:gh-r

    # # # 有名なインタラクティブフィルタの一つ
    # # # またファイル名が fzf-bin となっているので file:fzf としてリネームする
    # zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

    # zplug "junegunn/fzf-bin", \
    #     from:gh-r, \
    #     as:command, \
    #     rename-to:fzf

    # # # ターミナル上でゴミ箱チックなことをする。fzfに依存している
    # zplug "b4b4r07/zsh-gomi"

    # インストールする
    if ! zplug check --verbose; then
      printf 'Install? [y/N]: '
      if read -q; then
        echo; zplug install
      fi
    fi

    zplug load
    # zplug load --verbose
fi
# [peco で man を絞り込み検索する](http://qiita.com/Linda_pp/items/9ff801aa6e00459217f7)
function peco-man-list-all() {
    local parent dir file
    local paths=("${(s/:/)$(man -aw)}")

    # 無理やり日本語のmanページも検索対象に含めるようにした
    for parent in $paths; do
    # for parent in $paths "/usr/share/man/ja"; do
        for dir in $(/bin/ls -1 $parent); do
            local p="${parent}/${dir}"
            if [ -d "$p" ]; then
                IFS=$'\n' local lines=($(/bin/ls -1 "$p"))
                for file in $lines; do
                    echo "${p}/${file}"
                done
            fi
        done
    done
}

function peco-man() {
    local selected=$(peco-man-list-all | peco --prompt 'man >')
    if [[ "$selected" != "" ]]; then
        man -L ja "$selected"
    fi
}
zle -N peco-man
# bindkey -M viins '^ m' peco-man
