function DetachClient()
    let channelId = nvim_list_uis()[0]['chan']
    call chanclose(channelId)
endfunc

""" Options {{{
""" Text seach {{{
set showmatch
set ignorecase
set hlsearch
set incsearch
""" }}}
""" Indentation {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
""" }}}
""" User interface {{{
set laststatus=3
set mouse=a
set number
set relativenumber
set cursorline
set cc="120"
""" set ttyfast
""" }}}
""" Clipboard {{{
set clipboard+="unnamedplus"
""" }}}
""" Auto-completion {{{
set wildmode="longest,list"
""" }}}
""" Vim files location {{{
set nobackup
set directory=/home/hrn/.cache/nvim,/tmp,.
""" }}}
""" }}}

""" Mappings {{{
""" Normal mode {{{
set mouse=a
let mapleader=" "
nnoremap <leader>q :call DetachClient()<CR>
nnoremap <silent>! :w<cr>:noh<cr>
nnoremap L $ 
nnoremap H 0
nnoremap I 0i
nnoremap A $a
nnoremap <C-s>l :rightbelow vnew<cr>
nnoremap <C-s>h :leftabove vnew<cr>
nnoremap <C-s>j :rightbelow new<cr>
nnoremap <C-s>k :leftabove new<cr>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
""" }}}
""" Insert mode {{{
inoremap jk <esc>
inoremap jK <esc>
inoremap JK <esc>
inoremap Jk <esc>
inoremap <C-l> <C-w>l
inoremap <C-h> <C-w>h
inoremap <C-k> <C-w>k
inoremap <C-j> <C-w>j
inoremap <C-s>l <esc>:rightbelow vnew<cr>
inoremap <C-s>h <esc>:leftabove vnew<cr>
inoremap <C-s>j <esc>:rightbelow new<cr>
inoremap <C-s>k <esc>:leftabove new<cr>
inoremap <C-V> <esc>"+p
""" }}}
""" Visual mode {{{
vnoremap JK <esc>
vnoremap <C-c> "+y
vnoremap <C-v> "+p
""" }}}
""" Terminal mode {{{
tnoremap jk <C-\><C-N>
tnoremap jK <C-\><C-N>
tnoremap JK <C-\><C-N>
tnoremap Jk <C-\><C-N>
""" }}}
""" }}}
