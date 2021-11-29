if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein/')
let s:toml_dir = expand('~/.vim/')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOMLファイルのロード
  let s:toml_file = s:toml_dir . 'plugin.toml'
  let s:lazy_toml_file = s:toml_dir . 'plugin_lazy.toml'
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

"--solarized option--
syntax enable
