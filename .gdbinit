##########################################################################
# gdbの初期化ファイル。１行目を空行にすると読み込まれないようなので注意
##########################################################################

##########################################################################
# デバッグ対象が子プロセスを生成した時に、どちらのプロセスを
# デバッグ対象にするか選択する
##########################################################################
set follow-fork-mode parent
#set follow-fork-mode child

##########################################################################
# デバッグ対象のスレッドのうち、デバッグ対象外のスケジューリングを制限する
##########################################################################
# 全てのスレッドが実行され、他のスレッドがデバッガに割り込める(breakポイント
# に達した、シグナルが送信されたなど)
#set scheduler-locking off
# カレントスレッドだけが実行される
#set scheduler-locking on
# シングルステップ時のみスケジューラがロックされる。
#set scheduler-locking step


##########################################################################
# C/C++ 共通
##########################################################################
# 構造体表示を1メンバ１行で見やすく表示する。
set print pretty on
# 配列を１要素１行で表示する/しない
set print array  off
# 共用体を表示する。
set print union  on
# 配列を表示する時の上限を設定する。0は無制限
set print elements 0
# 最初にNULLが検出された時点で、文字配列の表示を停止させる
set print null-stop
# 8ビット文字を表示する。
set print sevenbit-strings off
# シンボル表示をする時、ソースファイル名と行番号も表示する
# ただし、ローカル変数は除く
set print symbol-filename on
# 構造体等の定義と参照が別ファイルにあるとき、検索をする
set opaque-type-resolution on

##########################################################################
# C++ 専用
##########################################################################
# C++ オブジェクトの仮想クラスで実際のクラスを表示する
set print object on
# C++ オブジェクトの静的メンバを表示する
set print static-members on
# オーバーロードされた関数をGDBから呼び出す際に、シグネチャと
# 引数の型がマッチするものを検索する
set overload-resolution on
# C++の仮想関数テーブルを綺麗に表示する。
set print vtbl   on
# C++のマングリングされた名前をソース通りに表示する。
set print demangle on
set print asm-demangle on
set demangle-style auto

##########################################################################
# その他
##########################################################################
#historyをsaveする。
set history save on
set history size 10000
set history filename ~/.gdb_history
# コマンドの非同期実行時に完了通知を有効にする
set exec-done-display on
# オブジェクトファイル中の読み込み専用セクションが本当に読み込み専用
# であることをGDBに支持する。これにより、ターゲットプログラムからで
# なくオブジェクトファイルのセクションから値を取得することができる。
# デフォルトはoffだが組込み系ではこの設定で効率が上がることがあるそうだ。
set trust-readonly-sections on
#数値の入出力のデフォルト基数を10進数にする
set input-radix  10
set output-radix 10
#時間のかかるコマンドの実行中に情報を表示する。この表示によりGDBが異常な
#状態になっていないか確認できる。
set verbose on
# GDBコマンド実行時に確認表示をしない。(breakポイントの削除時等)
set confirm off

#define bsave
#    save breakpoints ./.gdbbreakpoints
#end
#
#define brestore
#    source ./.gdbreakpoints
#end

define bsave
    shell rm -f brestore.txt
    set logging file brestore.txt
    set logging on
    info break
    set logging off
    # reformat on-the-fly to a valid gdb command file
    shell perl -n -e 'print "break $1\n" if /^\d+.+?(\S+)$/g' brestore.txt > brestore.gdb
end 
document bsave
  store actual breakpoints
end

define brestore
  source brestore.gdb
end
document brestore
  restore breakpoints saved by bsave
end

define local
    info args
    info locals
end
define lo
    local
end
define var
    if $argc == 0
        info variables
    end
    if $argc == 1
        info variables $arg0
    end
    if $argc > 1
        help var
    end
end
document var
Print all global and static variable names (symbols), or those matching REGEXP.
Usage: var <REGEXP>
end

define threads
    info threads
end
document threads
Print threads in target.
end

define th
    info threads
end

# __________hex/ascii dump an address_________
define ascii_char
    if $argc != 1
        help ascii_char
    else
        # thanks elaine :)
        set $_c = *(unsigned char *)($arg0)
        if ($_c < 0x20 || $_c > 0x7E)
            printf "."
        else
            printf "%c", $_c
        end
    end
end
document ascii_char
Print ASCII value of byte at address ADDR.
Print "." if the value is unprintable.
Usage: ascii_char ADDR
end


define hex_quad
    if $argc != 1
        help hex_quad
    else
        printf "%02X %02X %02X %02X %02X %02X %02X %02X", \
               *(unsigned char*)($arg0), *(unsigned char*)($arg0 + 1),     \
               *(unsigned char*)($arg0 + 2), *(unsigned char*)($arg0 + 3), \
               *(unsigned char*)($arg0 + 4), *(unsigned char*)($arg0 + 5), \
               *(unsigned char*)($arg0 + 6), *(unsigned char*)($arg0 + 7)
    end
end
document hex_quad
Print eight hexadecimal bytes starting at address ADDR.
Usage: hex_quad ADDR
end


define hexdump
    if $argc == 1
        hexdump_aux $arg0
	else
		if $argc == 2
			set $_count = 0
			while ($_count < $arg1)
				set $_i = ($_count * 0x10)
				hexdump_aux $data_addr+$_i
				set $_count++
			end
		else
			help hexdump
		end
    end
end
document hexdump
Display a 16-byte hex/ASCII dump of memory starting at address ADDR.
Optional parameter is the number of lines to display if you want more than one. 
Usage: hexdump ADDR [nr lines]
end


define hexdump_aux
    if $argc != 1
        help hexdump_aux
    else
        echo \033[1m
        if ($64BITS == 1)
            printf "0x%016lX : ", $arg0
        else
            printf "0x%08X : ", $arg0
        end
        echo \033[0m
        hex_quad $arg0
        echo \033[1m
        printf " - "
        echo \033[0m
        hex_quad $arg0+8
        printf " "
        echo \033[1m
        ascii_char $arg0+0x0
        ascii_char $arg0+0x1
        ascii_char $arg0+0x2
        ascii_char $arg0+0x3
        ascii_char $arg0+0x4
        ascii_char $arg0+0x5
        ascii_char $arg0+0x6
        ascii_char $arg0+0x7
        ascii_char $arg0+0x8
        ascii_char $arg0+0x9
        ascii_char $arg0+0xA
        ascii_char $arg0+0xB
        ascii_char $arg0+0xC
        ascii_char $arg0+0xD
        ascii_char $arg0+0xE
        ascii_char $arg0+0xF
        echo \033[0m
        printf "\n"
    end
end
document hexdump_aux
Display a 16-byte hex/ASCII dump of memory at address ADDR.
Usage: hexdump_aux ADDR
end
