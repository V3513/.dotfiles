" ───── Plugin Setup ─────
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-commentary'
call plug#end()
let mapleader = ' '
" ───── Transparency and Highlight Overrides ─────
function! SetTransparentBackground()
  " Core transparency
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE

  " Improve visibility
  highlight LineNr guifg=#A6ADC8 ctermfg=145 guibg=NONE
  highlight Comment guifg=#B0B9D9 ctermfg=146 guibg=NONE

  " Bright red column at 80 chars
  highlight ColorColumn guibg=#4C1A1A ctermbg=52

  " Transparent airline
  highlight AirlineNormal guibg=NONE ctermbg=NONE
  highlight AirlineInsert guibg=NONE ctermbg=NONE
  highlight AirlineVisual guibg=NONE ctermbg=NONE
  highlight AirlineReplace guibg=NONE ctermbg=NONE
  highlight AirlineCommand guibg=NONE ctermbg=NONE
  highlight AirlineInactive guibg=NONE ctermbg=NONE
  highlight AirlineError guibg=NONE ctermbg=NONE
  highlight AirlineWarning guibg=NONE ctermbg=NONE
  highlight AirlineSeparator guibg=NONE ctermbg=NONE
  highlight AirlineLeftSep guibg=NONE ctermbg=NONE
  highlight AirlineRightSep guibg=NONE ctermbg=NONE
  highlight AirlineTabLine guibg=NONE ctermbg=NONE
  highlight AirlineTabLineFill guibg=NONE ctermbg=NONE
  highlight AirlineTabLineSel guibg=NONE ctermbg=NONE
endfunction

function! s:ApplyTransparency() abort
  " Delay transparency until after colorscheme loads
  call timer_start(10, { -> SetTransparentBackground() })
endfunction
" ───── UI Settings ─────
set number
set splitright
set splitbelow
set noshowmode
set title
set wildmenu
let NERDTreeShowHidden=1
set termguicolors
autocmd ColorScheme * call SetTransparentBackground()
" ───── Editor Behavior ─────
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set encoding=utf8
set clipboard=unnamed
set completeopt=menuone,noinsert,noselect
set hlsearch
set incsearch
set hidden
set autoindent
set ttyfast
set smartindent
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set nowritebackup
set noswapfile
set nobackup
set timeoutlen=300
filetype plugin indent on
let g:python_recommended_style = 0
syntax on

" ───── Highlight Important Keywords ─────
syntax keyword CommentTodo TODO FIXME NOTE XXX contained containedin=ALLBUT,CommentTodo
syntax match CommentTodoMatch /\v<(TODO|FIXME|NOTE|XXX)>/ contained containedin=Comment,pythonComment
highlight CommentTodo ctermfg=Red guifg=#FF6C6B gui=bold

" ───── Coc.nvim Highlights ─────
highlight CocErrorHighlight ctermfg=Red guifg=#FF6C6B guibg=NONE
highlight CocWarningHighlight ctermfg=Yellow guifg=#ECBE7B guibg=NONE
highlight CocInfoHighlight ctermfg=Blue guifg=#51AFEF guibg=NONE

" ───── Mappings ─────
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>ss :mksession! ~/.vim/sessions/session.vim<CR>
nnoremap <leader>sl :source ~/.vim/sessions/session.vim<CR>
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <silent><expr> <Down> pumvisible() ? "\<C-p>" : "\<Down>"
inoremap <silent><expr> <Up> pumvisible() ? "\<C-n>" : "\<Up>"
inoremap jj <Esc>
nnoremap <leader>= gg=G``
nnoremap <leader>/ :noh<CR>
nnoremap <leader>P ggVG"_d"+p
nnoremap <leader>t :enew<CR>:NERDTree<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
autocmd FileType python setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufWritePre * :%s/\s\+$//e
