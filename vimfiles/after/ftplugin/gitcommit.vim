if &modifiable
    setlocal fileencoding=utf-8
    "" git commit message のときは折りたたまない(diff で中途半端な折りたたみになりが
    "" ち)
    "" setlocal nofoldenable
endif
