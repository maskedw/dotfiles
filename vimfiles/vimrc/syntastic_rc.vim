""============================================================
"" @syntastic
"" ソースコードの構文チェック
""============================================================
"let g:syntastic_debug = 1
"let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_check_on_open = 0
let g:syntastic_loc_list_height = 5
let s:c_include_path = VimPath2CincludePath(&path)
let g:syntastic_cpp_compiler = "gcc"
let g:syntastic_c_compiler_options   = s:c_include_path
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++0x " . s:c_include_path
let g:default_syntastic_c_compiler_options   = g:syntastic_c_compiler_options
let g:default_syntastic_cpp_compiler_options = g:syntastic_cpp_compiler_options
"let g:syntastic_cpp_checkers=['g++']
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore="E221"'
