@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION

set PWD=%CD%
set TARGET=.vimrc .gvimrc .vsvimrc
set TARGET=%TARGET% .gdbinit .ctags .gitignore .gitconfig.common

for %%f in (%TARGET%) do (
    if exist %%f echo %%f
    mklink %HOME%\%%f %PWD%\%%f
)

set TARGET=.gitconfig.win
for %%f in (%TARGET%) do (
    set f=%%f
    if exist !f! echo !f!
    mklink %HOME%\!f:.win=! %PWD%\!f!
)

set TARGET=.neosnippets vimfiles
for %%f in (%TARGET%) do (
    if exist %%f echo %%f
    mklink /D %HOME%\%%f %PWD%\%%f
)
