nnoremap <C-g> <Esc>
vnoremap <C-g> <Esc>gV
onoremap <C-g> <Esc>
inoremap <C-g> <Esc>`^
let mapleader=","
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#show_call_signatures = "1"
set number " Show current line number
set relativenumber " Show relative line numbers
set ts=4 sw=4 " Make tabs 4 spaces
" enter the current millenium
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set incsearch
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" Display all matching files when we tab complete
set wildmenu
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
cmap d!! w !diff % -
noremap <Leader>y "+y
noremap <Leader>p "+p

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
nnoremap Y y$

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


