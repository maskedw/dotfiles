setlocal textwidth=80
setlocal fileencoding=utf-8
setlocal fileformat=unix

if ! empty(neobundle#get('jedi-vim'))
    setlocal omnifunc=jedi#completions
    setlocal completeopt-=preview
endif
