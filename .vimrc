" Download and install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'davidhalter/jedi-vim'
Plug 'dylanaraps/wal.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-rsi'
Plug 'unblevable/quick-scope'
Plug 'valloric/youcompleteme'
call plug#end()

colorscheme wal

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" default macro for extending "%" operator
runtime macros/matchit.vim

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" enable auto pair fly mode
let g:AutoPairsFlyMode = 1

" only display buffer list if more than one buffer
let g:buftabline_show = 1

" splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" number of lines to keep above and below the cursor
set scrolloff=5

" show current line number
set number

" hide current command input in status bar
set noshowcmd

" show relative line numbers
set relativenumber

" make tabs 4 spaceset rulers
set ts=4 sw=4

" expand tabs to spaces
set expandtab

" enter the current millenium
set nocompatible

" ignore search case
set ignorecase

" unless you use capitals
set smartcase


" vim-sensible tpope
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set incsearch
set hlsearch
" use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
set ruler
set wildmenu
set display+=lastline
set encoding=utf-8
set t_Co=256

set path+=**
" allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
cmap d!! w !diff % -

nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

nnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>

set clipboard=unnamedplus

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap Y y$

" make searches always appear in centre of page
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" sensible line changing
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" remove exmode
nnoremap Q <Nop>

" allow for buffers to be opened when there are unsaved changes
set hidden

" move to next buffer with ctrl-n and ctrl-p
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" https://github.com/machakann/vim-sandwich/issues/62
" textobj-sandwich query mappings break sentence text objects
let g:textobj_sandwich_no_default_key_mappings = 1
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ab <Plug>(textobj-sandwich-auto-a)

xmap iq <Plug>(textobj-sandwich-query-i)
omap iq <Plug>(textobj-sandwich-query-i)
xmap aq <Plug>(textobj-sandwich-query-a)
omap aq <Plug>(textobj-sandwich-query-a)
