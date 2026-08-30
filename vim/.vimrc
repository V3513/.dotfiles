let mapleader = ' '
" ───── UI Settings ─────
set number
set splitright
set splitbelow
set noshowmode
set title
set wildmenu
set termguicolors
" ───── Editor Behavior ─────
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
syntax on
" ───── Highlight Important Keywords ─────
syntax keyword CommentTodo TODO FIXME NOTE XXX contained containedin=ALLBUT,CommentTodo
syntax match CommentTodoMatch /\v<(TODO|FIXME|NOTE|XXX)>/ contained containedin=Comment,pythonComment
highlight CommentTodo ctermfg=Red guifg=#FF6C6B gui=bold
" ───── Mappings ─────
nnoremap <leader>ss :mksession! ~/.vim/sessions/session.vim<CR>
nnoremap <leader>sl :source ~/.vim/sessions/session.vim<CR>
inoremap jj <Esc>
nnoremap <leader>= gg=G``
nnoremap <leader>/ :noh<CR>
nnoremap <leader>P ggVG"_d"+p
nnoremap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
autocmd FileType python setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufWritePre * :%s/\s\+$//e
