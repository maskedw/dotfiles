@echo OFF
setlocal ENABLEDELAYEDEXPANSION

set PWD=%CD%
set TARGET=.vimrc .gvimrc .vsvimrc
set TARGET=%TARGET% .gdbinit .ctags .gitignore .gitconfig.common
set TARGET=%TARGET% .inputrc
set TARGET=%TARGET% .minttyrc
set TARGET=%TARGET% .grepignore
set TARGET=%TARGET% .bash_profile
set TARGET=%TARGET% .nyagos
set TARGET=%TARGET% .shrc .zshrc .tmux.conf

for %%f in (%TARGET%) do (
    if exist %HOME%\%%f del %HOME%\%%f
    mklink %HOME%\%%f %PWD%\%%f
)

set TARGET=.gitconfig.win .bashrc.win
for %%f in (%TARGET%) do (
    set f=%%f
    REM ���̂����exist = false�ɂȂ�B���̕����ł͂����Ă�̂ɂȂ��H
    REM ������u�����Ă邩��H
    REM if exist %HOME%\!f:.win=! echo %HOME%\!f:.win=!
    REM �����s���Ȃ̂łƂ肠�����������폜����B
    del %HOME%\!f:.win=!
    mklink %HOME%\!f:.win=! %PWD%\!f!
)

set TARGET=.neosnippets vimfiles
for %%f in (%TARGET%) do (
    if exist %HOME%\%%f rd %HOME%\%%f
    mklink /D %HOME%\%%f %PWD%\%%f
)
