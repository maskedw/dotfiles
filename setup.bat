@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION

set PWD=%CD%
set TARGET=.vimrc .gvimrc .vsvimrc
set TARGET=%TARGET% .gdbinit .ctags .gitignore .gitconfig.common
set TARGET=%TARGET% .inputrc

for %%f in (%TARGET%) do (
    if exist %HOME%\%%f del %HOME%\%%f
    mklink %HOME%\%%f %PWD%\%%f
)

set TARGET=.gitconfig.win .bash_profile.win
for %%f in (%TARGET%) do (
    set f=%%f
    if exist %HOME%\!f:.win=! del %HOME%\!f:.win=!
    mklink %HOME%\!f:.win=! %PWD%\!f!
)

set TARGET=.neosnippets vimfiles
for %%f in (%TARGET%) do (
    if exist %HOME%\%%f del %HOME%\%%f
    mklink /D %HOME%\%%f %PWD%\%%f
)
