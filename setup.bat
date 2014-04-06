@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION

set PWD=%CD%
set TARGET=.vimrc .gvimrc .vsvimrc
set TARGET=%TARGET% .gdbinit .ctags .gitignore

for %%f in (%TARGET%) do (
    if exist %%f echo %%f
    mklink %HOME%\%%f %PWD%\%%f
)

set TARGET=.gitconfig.win64
for %%f in (%TARGET%) do (
    set f=%%f
    if exist !f! echo !f!
    mklink %HOME%\!f:.win64=! %PWD%\!f!
)
