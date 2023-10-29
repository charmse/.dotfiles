
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set noswapfile
set termencoding=utf-8
set encoding=utf-8

syntax on

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
" Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mikelue/vim-maven-plugin'
Plug 'rayes0/blossom.vim'
" Plug 'vim-scripts/CSApprox'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" set term=xterm-256color
" set t_Co=256
" set termguicolors
" colorscheme blossom
" colorscheme peachpuff
" highlight Comment ctermfg=green

" if executable('rg')
" let g:rg_derive_root='true'
" endif

" let loaded_matchparen = 1
let mapleader = " "

" let g:netrw_browse_split = 2
" let g:vrfr_rg = 'true'
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
xnoremap p pgvy

" FZF
" Layout
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" Open FZF search in vim
map <C-f> <Esc><Esc>:Files!<CR>
map <C-g> <Esc><Esc>:GFiles! --exclude-standard --others --cached<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
let $FZF_DEFAULT_COMMAND='find . -not -path "*/\.git*" -type f -print'

" NERDtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Sweet Sweet FuGITive
" nmap <leader>gh :diffget //3<CR>
" nmap <leader>gu :diffget //2<CR>
" nmap <leader>gs :G<CR>

" fun! TrimWhitespace()
"   let l:save = winsaveview()
"  keeppatterns %s/\s\+$//e
"  call winrestview(l:save)
" endfun

" autocmd BufWritePre * :call TrimWhitespace()
