let g:quickrun_config = {}
let g:quickrun_config['cpp'] = {
\       'command': 'g++',
\       'cmdopt' : '-std=c++11 -I c:/home/src/boost_1_54_0 -I c:/home/workspace/hew/maskedwTokudenBoard/maskedw',
\       'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\       'tempfile': '%{tempname()}.cpp',
\       'hook/sweep/files': '%S:p:r',
\       "hook/add_include_option/enable" : 1,
\   }

