set encoding=utf-8
scriptencoding utf-8

"--basic option--
"内容が変更されたら自動的に再読み込み
set autoread
"クリップボードを使用する
set clipboard+=unnamed
"バッファを保存しなくても他のバッファを表示できるようにする
set hidden
"コマンドライン補完を便利に
set wildmenu
"移動コマンドを使った時、行頭に移動しない
set nostartofline
"オートインデント
set autoindent
"オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする
set backspace=indent,eol,start
"画面の端で折り返さない
set nowrap

"--look and feel--
"入力中のコマンド(yyなど)を表示する
set showcmd
"行を強調表示
set cursorline
"列を強調表示
set cursorcolumn
"不可視文字を表示する
set list
"不可視文字の表示記号を指定する
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
"検索語を強調表示(<C-l>で強調解除)
set hlsearch
"ルーラー表示
set ruler
"ビープの代わりにビジュアルベルを使う
set visualbell
"コマンドラインの高さを2行に
set cmdheight=2
"行番号を表示する
set number
"vimdiffの色を設定する
highlight DiffAdd cterm=reverse
highlight DiffDelete cterm=reverse
highlight DiffChange cterm=reverse
highlight DiffText cterm=reverse
"インデントによる自動折りたたみを生成する
set foldmethod=indent
"折り畳み表示カラム列数
set foldcolumn=4
"折り畳みするのに最低必要な行数。値は+1される。既定値の1なら2行になる
set foldminlines=2
"折り畳みを閉じておく量
set foldlevel=1

"--statusline--
"ステータスラインを常に表示
set laststatus=2
"ステータスラインのフォーマット
set statusline=%F%m%r%h%w\ 
set statusline+=[ENCODE=%{&fileencoding}]\ 
set statusline+=[FORMAT=%{&ff}]\ 
set statusline+=[TYPE=%Y]%=
"set statusline+=[ASCII=\%03.3b]\ 
"set statusline+=[HEX=\%02.2B]\ 
set statusline+=[ROW=%04l,COL=%04c][%p%%]\ 
set statusline+=[LEN=%L]

"--indentation options--
"ファイル中の<Tab>文字を、画面上の見た目で何文字分に展開するかを指定する
set tabstop=2
"vimが挿入するインデント(cindent)やシフトオペレータ(<<,>>)で挿入/削除されるインデントの幅を画面上の見た目で何文字分であるかを指定する
set shiftwidth=2
"キーボードで<Tab>キーを押した時に挿入される空白の量
set softtabstop=2
"タブをスペースに置き換える
set expandtab

"--key mapping--
"Yの動作をDやCと同じにする
map Y y$
"<C-l>で検索語の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

"--encoding options--
set fileencodings=utf-8,cp932,iso-2022-jp,sjis,euc-jp
set fileformats=unix,mac,dos

"--other options--
"特殊文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"--window options--
"ウィンドウの水平分割時に新しいウィンドウを下に開く
set splitbelow
"ウィンドウの垂直分割時に新しいウィンドウを右に開く
set splitright

"--auto command--
if has("autocmd")
  "html閉じタグ補完
  augroup XML_Complete
    "groupを指定しているが、指定しない場合は現在のgroupが指定される(ので無くてもいい)
    autocmd! XML_Complete
    autocmd FileType xml inoremap <buffer> </ </<C-x><C-o>
    autocmd FileType html inoremap <buffer> </ </<C-x><C-o>
  augroup END

  "ファイル編集開始時に最後のカーソル位置までジャンプする
  "(see `:h restore-cursor` or `:h last-position-jump`)
  "元々はdefault.vimに記述されている？
  "以下のコードはamazon linuxからコピーして少し改変したもの
  augroup remindCursorPosition
    autocmd! remindCursorPosition
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END
endif

"--plugin--
source ~/.vim/plugin.vim
