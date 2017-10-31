if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
"call dein#add('pangloss/vim-javascript')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('othree/yajs.vim')
call dein#add('vim-scripts/SyntaxComplete')
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('thinca/vim-quickrun')
" GaucheのREPLをVimから使うためのplugin
" slimvと競合しそうなので一旦封印
"call dein#add('aharisu/vim_goshrepl')
"call dein#add('aharisu/vim-gdev')
" VimからLispのREPLを使うためのplugin
call dein#add('kovisoft/slimv')
" Goを使いやすいようにするplugin
call dein#add('fatih/vim-go')

call dein#end()

filetype plugin indent on

"--neocomplete option--
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"--javascript-libraries-syntax option--
let g:used_javascript_libs = 'underscore,react,flux,jasmine'

"-- SyntaxComplete option--
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

"--solarized option--
"有効にできるかも？ 試験運用中
"let g:solarized_bold=0
"let g:solarized_underline=0
"let g:solarized_italic=0
syntax enable
set background=dark
"set background=light
colorscheme solarized
call togglebg#map("<F5>")
"見やすいVimDiffを試行錯誤中
"change diff colors
":h cterm-colors
"NR-16   NR-8    COLOR NAME ~
"0       0       Black
"1       4       DarkBlue
"2       2       DarkGreen
"3       6       DarkCyan
"4       1       DarkRed
"5       5       DarkMagenta
"6       3       Brown, DarkYellow
"7       7       LightGray, LightGrey, Gray, Grey
"8       0*      DarkGray, DarkGrey
"9       4*      Blue, LightBlue
"10      2*      Green, LightGreen
"11      6*      Cyan, LightCyan
"12      1*      Red, LightRed
"13      5*      Magenta, LightMagenta
"14      3*      Yellow, LightYellow
"15      7*      White
"cterm
"bold
"underline
"undercurl not always available
"reverse
"inverse   same as reverse
"italic
"standout
"NONE      no attributes used (used to reset it)
"highlight DiffAdd cterm=reverse
"highlight DiffDelete cterm=reverse
"highlight DiffChange cterm=reverse
"highlight DiffText cterm=reverse

"--quickrun option--
"全てのtypeで出力バッファのウィンドウを最下部に表示し、出力がない場合は出力バッファを閉じる。
"vimprocを使い非同期実行を行う。
let g:quickrun_config = {
      \"_" : {
      \"outputter/buffer/split" : ":botright 8sp",
      \"outputter/buffer/close_on_empty" : 1,
      \"runner" : "vimproc",
      \"runner/vimproc/updatetime" : 60
      \},
      \}
"<C-c>で実行を強制終了させる
"quickrun.vimを実行していない場合には<C-c>を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"実行が成功すればバッファへ、失敗すればquickfixへ出力するコマンドのサンプル
":QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix

"--slimv option--
"SWANKサーバを起動するためのコマンド
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"ccl64 --load ~/.cache/dein/repos/github.com/kovisoft/slimv/slime/start-swank.lisp\""'
let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"ros -s swank -e \\\"(swank:create-server :port 4005 :dont-close t)\\\" wait\""'

"--vim-go option--
"GoInstallBinariesのインストール先を変更する
"let g:go_bin_path = '/Users/supnakamurayoshihisa/.goenv/shims/go'
