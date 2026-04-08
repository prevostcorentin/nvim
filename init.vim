function DetachClient()
    let channelId = nvim_list_uis()[0]['chan']
    call chanclose(channelId)
endfunc

""" Options {{{
""" Text search {{{
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
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=3
set mouse=a
set number
set relativenumber
set cursorline
set cc="120"
set nowrap
""" set ttyfast
""" }}}
""" Clipboard {{{
set clipboard+="unnamedplus"
""" }}}
""" Auto-completion {{{
set wildmenu
set wildchar=<Tab>
set wildmode=lastused:full
set completeopt=menuone,menu,preview,popup,fuzzy,noselect
""" }}}
""" Vim files location {{{
set nobackup
set directory=$HOME/.cache/nvim//,/tmp//,$HOME/AppData/Local/nvim-data/cache//,.
""" }}}
""" }}}

""" Mappings {{{
""" Normal mode {{{
set mouse=a
let mapleader=" "
nnoremap <leader>q :call DetachClient()<CR>
nnoremap <silent>! :noh<cr>:w<cr>
nnoremap L $ 
nnoremap H 0
nnoremap I 0i
nnoremap A $a
nnoremap <C-s>l :rightbelow vnew<cr>
nnoremap <C-s>h :leftabove vnew<cr>
nnoremap <C-s>j :rightbelow new<cr>
nnoremap <C-s>k :leftabove new<cr>
nnoremap <leader>b :buffers<cr>:b
""" }}}
""" Insert mode {{{
inoremap jk <esc>
inoremap jK <esc>
inoremap JK <esc>
inoremap Jk <esc>
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
vnoremap L $h
""" }}}
""" Terminal mode {{{
tnoremap jk <C-\><C-N>
tnoremap jK <C-\><C-N>
tnoremap JK <C-\><C-N>
tnoremap Jk <C-\><C-N>
""" }}}
""" }}}

""" LSP {{{
nnoremap grn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap gra <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap grr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap gri <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap grt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap gO  <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap grd <cmd>lua vim.diagnostic.open_float()<cr>

augroup lsp_global
    autocmd!
    autocmd CursorHold  * lua vim.diagnostic.open_float()
    autocmd CursorHoldI * lua vim.diagnostic.open_float()
augroup END
""" }}}

""" Debug Adapter Protocol {{{
nnoremap <leader>dl <cmd>LoadDAP<cr>
nnoremap <leader>dc <cmd>DapContinue<cr>
nnoremap <leader>dt <cmd>DapTerminate<cr>
nnoremap <leader>dp <cmd>DapTerminate<cr>
nnoremap <leader>dr <cmd>DapToggleRepl<cr>
nnoremap <leader>db <cmd>DapToggleBreakpoint<cr>
nnoremap <leader>dB <cmd>DapClearBreakpoints<cr>
nnoremap <leader>do <cmd>DapStepOut<cr>
nnoremap <leader>dO <cmd>DapStepOver<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>df <cmd>DapShowFramesFloatingWindow<cr>
nnoremap <leader>ds <cmd>DapShowScopesSidebar<cr>
""" }}}

""" Commenting lines {{{
augroup filetypes
    autocmd!
    autocmd FileType python nnoremap <leader>c I#<esc>
    autocmd FileType go nnoremap <leader>c I//<esc>
augroup END
"""

""" netrw {{{
let g:netrw_keepdir=0
let g:netrw_banner=0
let g:netrw_fastbrowse=2
let g:netrw_browse_split=4
let g:netrw_http_cmd="elinks"
let g:netrw_http_xcmd="-source >"
let g:netrw_list_hide='^\..*'
let g:netrw_menu=0
let g:netrw_use_errorwindow=3

""" netrw immediately activate when using nvim without any filenames,
""" showing the current directory
augroup VimStartup
    au!
	au VimEnter * if expand("%") == "" | e . | endif
augroup END
""" }}}

colorscheme catppuccin
