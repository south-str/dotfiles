set encoding=utf-8
scriptencoding utf-8

"--basic option--
"内容が変更されたら自動的に再読み込み
set autoread
"クリップボードを使用する
set clipboard+=unnamed
"ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on
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

"--look&feel--
"入力中のコマンド(yyなど)を表示する
set showcmd
"シンタックスハイライトを有効にする
syntax on
"行を強調表示
set cursorline
"highlight CursorLine term=reverse cterm=reverse
"列を強調表示
set cursorcolumn
"不可視文字を表示する
set list
"不可視文字の表示記号を指定する
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
"検索語を強調表示(<C-L>で強調解除)
set hlsearch
"ルーラー表示
set ruler
"ビープの代わりにビジュアルベルを使う
set visualbell
"コマンドラインの高さを2行に
set cmdheight=2
"行番号を表示する
set number

"--statusline--
"ステータスラインを常に表示
set laststatus=2
"ステータスラインのフォーマット
set statusline=%F%m%r%h%w\ 
set statusline+=[FORMAT=%{&ff}]\ 
set statusline+=[TYPE=%Y]%=
"set statusline+=[ASCII=\%03.3b]\ 
"set statusline+=[HEX=\%02.2B]\ 
set statusline+=[ROW=%04l,COL=%04c][%p%%]\ 
set statusline+=[LEN=%L]

"--indentation options--
set shiftwidth=2
set softtabstop=2
set expandtab

"--Mapping--
"Yの動作をDやCと同じにする
map Y y$
"<C-L>で検索語の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

"--Encoding options--
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif

"特殊文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"--Plugin--
source ~/plugin.vim
