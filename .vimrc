" Base 
"==========================================
"swapファイルをまとめて置く場所
set swapfile
set directory=~/.vimswp

"backupファイルをまとめて置く場所
set backup
set backupdir=~/.vimbk

"エラー音の代わりに画面フラッシュを使う
set visualbell t_vb=

"入力モード時、ステータスラインのカラーを変更
" [重いからコメントアウト]
"augroup InsertHook
"autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END

" swpファイルを作らない
set noswapfile

" View
"==========================================
"[重いからコメントアウト]
"syntax on

" ナンバリング
set number

" 編集中にタイトル表示
set title

" ルーラー表示
set ruler

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=tab:»\ ,trail:-,eol:↲

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#AA0000
match ZenkakuSpace /　/


" Indent 
"==========================================
"新しい行のインデントを現在行と同じにする
set autoindent

"タブの代わりに空白文字を挿入する
"set expandtab

"新しい行を作ったときに高度な自動インデントを行う
"set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"vi にはない ステータス行の表示内容を設定する。
"set statusline=%<%f\ %m%r%h%w
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
"set statusline+=%=%l/%L,%c%V%8P


" Util
"==========================================
" 検索時、小文字大文字を無視
set ignorecase

"シフト移動幅
set shiftwidth=4

"インクリメンタルサーチを行う
set incsearch

"クリップボードをWindowsと連携
"set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時ハイライト
set hlsearch

"検索時ハイライト
"setlocal spell

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 矢印キーの無効化
"map <UP> <ESC>
"map! <UP> <ESC>
"map <DOWN> <ESC>
"map! <DOWN> <ESC>
"map <LEFT> <ESC>
"map! <LEFT> <ESC>
"map <RIGHT> <ESC>
"map! <RIGHT> <ESC>

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :noh<CR>

" F5で.vimrcリロード
nmap <F5> :source ~/.vimrc<CR>

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

" Sudjest
inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap ' ''<LEFT>
"inoremap " ""<LEFT>

" Autocmd 
"==========================================
" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/    /ge


" pathogen.vim
"==========================================
"filetype off
"" pathogen.vimによってbundle配下のpluginをpathに加える
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"set helpfile=$VIMRUNTIME/doc/help.txt
"" ファイルタイプ判定をon
"filetype plugin on


" ref.vim
"==========================================
"nmap pman :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path=$HOME."/Dropbox/manual/phpmanual"
"let g:ref_phpmanual_cmd = 'w3m -dump %s'
"let g:ref_phpmanual_cmd = 'elinks -dump -dump-charset utf-8 -no-numbering -no-references %s' " charset is important
""let g:ref_use_vimproc = 0
let g:ref_alc_cmd='lynx -dump -nonumbers %s'


" phpmanual.vim
"==========================================
" PHP マニュアルを設置している場合
"let phpmanual_dir = $HOME."/Dropbox/manual/phpmanual/"
"" マニュアルの拡張子
"let phpmanual_file_ext = 'html'
"" マニュアルのカラー表示
"let phpmanual_color = 1
"" iconv 変換をしない
"let phpmanual_convfilter = ''
"" w3m の表示形式を utf-8 にし、auto detect を on にする
"let phpmanual_htmlviewer = 'w3m -o display_charset=utf-8 -o auto_detect=2 -T text/html'
"" phpmanual.vim を置いているパスを指定
"source $HOME/.vim/bundle/vim-ref/autoload/ref/phpmanual_v1_3.vim
"let g:phpmanual_convfilter = ''


" neocomplcache.vim
" http://vim-users.jp/2010/10/hack177/
" 入力補完
"==========================================
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"command! -nargs=* Nes NeoComplCacheEditSnippets


" サジェストの色変え
"==========================================
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333


" unite.vim
" バッファが一覧表示
"==========================================
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
"nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
"inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <S-Space> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <S-Space> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-space> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-space> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" dd
"nnoremap dd "_dd

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction


" CtrlP.vim
"==========================================
"let g:ctrlp_by_filename         = 1 " フルパスではなくファイル名のみで絞込み
"let g:ctrlp_jump_to_buffer      = 2 " タブで開かれていた場合はそのタブに切り替える
"let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
"let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
"let g:ctrlp_highlight_match     = [1, 'IncSearch'] " 絞り込みで一致した部分のハイライト
"let g:ctrlp_open_new_file       = 1 " 新規ファイル作成時にタブで開く
"let g:ctrlp_open_multi          = '10t' " 複数ファイルを開く時にタブで最大10まで開く
"
"nnoremap <Leader>f :CtrlP<CR>
"nnoremap <Leader>b :CtrlPBuffer<CR>
"nnoremap <Leader>m :CtrlPMRUFiles<CR>



" fuzzyfinder.vim
" (導入に伴い9lというプラグインをインストール)
"==========================================
"nnoremap <unique> <silent> <C-S> :FufBuffer!<CR>
"nnoremap <unique> <silent> ef :FufFile!<CR>
"nnoremap <silent> eff :FufFile!<CR>
"nnoremap <silent> efm :FufMruFile!<CR>
"autocmd FileType fuf nmap <C-c> <ESC>
"let g:fuf_splitPathMatching = ' '
"let g:fuf_patternSeparator = ' '
"let g:fuf_modesDisable = ['mrucmd']
"let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$'
"let g:fuf_mrufile_maxItem = 10000
"let g:fuf_enumeratingLimit = 20


" syntax.vim
" 保存時にシンタックスチェック
"==========================================
let g:syntastic_enable_signs  = 1
let g:syntastic_auto_loc_list = 2


" vimfiler.vim
"==========================================
"imap <C-e> :VimFiler<CR>
"smap <C-e> :VimFiler<CR>
""imap <C-k> <Plug>(neocomplcache_snippets_expand)
""smap <C-k> <Plug>(neocomplcache_snippets_expand)
"call vimfiler#set_execute_file('vim', 'vim')
"call vimfiler#set_execute_file('pdf', 'prev')

" cocoa.vim
" K	カーソルがあるところの単語をドキュメントから検索
" Cmd+Opt+↑	.hファイルと.mファイルのトグル
" Cmd+r	ビルド&実行
" Cmd+b	ビルド
" shift+k	クリーン
" Cmd+0	Xcodeのプロジェクトウィンドウを開く
" Cmd+2	:ListMethods（メソッド一覧）
"==========================================
"com! -buffer lm call ListMethods
"map lm :ListMethods<cr>


" opsplorer.vim
" ファイラー
" http://nanasi.jp/articles/vim/opsplorer_vim.html#id4
"
" コマンド
" :Opsplore
"==========================================
let g:split_width=32
let g:split_minwidth=16


" php-doc.vim
"==========================================
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>-
"let g:pdv_cfg_Type = "string"
"let g:pdv_cfg_ReturnVal = "string"


" benchvimrc-vim
" :BenchVimrc
" :%sort
