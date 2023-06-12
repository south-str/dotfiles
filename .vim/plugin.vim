" [ plugin.vim ]
if &compatible
  set nocompatible
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set runtimepath+=~/.vim/cache/dein/repos/github.com/Shougo/dein.vim

"let s:dein_dir = expand('~/.vim/cache/dein/')
"let s:toml_dir = expand('~/.vim/')
"if dein#load_state(s:dein_dir)
  "call dein#begin(s:dein_dir)

  "" TOMLファイルのロード
  "let s:toml_file = s:toml_dir . 'plugin.toml'
  "let s:lazy_toml_file = s:toml_dir . 'plugin_lazy.toml'
  "call dein#load_toml(s:toml_file, {'lazy': 0})
  "call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

  "call dein#end()
  "call dein#save_state()
"endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Dein base path (required)
let s:dein_base = '~/.vim/dein'
" Set Dein source path (required)
let s:dein_src = '~/.vim/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

"call dein#add(s:dein_src)

" Your plugins go here:
" TOMLファイルのロード
let s:toml_dir = expand('~/.vim/')
let s:toml_file = s:toml_dir . 'plugin.toml'
let s:lazy_toml_file = s:toml_dir . 'plugin_lazy.toml'
call dein#load_toml(s:toml_file, {'lazy': 0})
call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

" Finish Dein initialization (required)
call dein#end()

"--solarized option--
filetype plugin indent on
syntax enable
