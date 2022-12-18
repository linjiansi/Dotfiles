call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set termguicolors

set rtp+=/usr/local/opt/fzf

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" NERDTree Settings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree Git Plugin settings
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Dirty'     :'✗',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Unknown'   :'?',
  \ }

" fzf settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='deus'
let g:airline_deus_bg = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

