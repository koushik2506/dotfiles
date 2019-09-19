"
" .vimrc
" default tab set to 4, no expand
" or modeline
" cscope -> cscope.vim via plugin dir
" vim-go via Plug
" NERDTree via Plug
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set modeline
" Required for line numbers on bottom right corner.
set ruler

" Commenting 110 char coloumn for now.
"set colorcolumn=110
"highlight ColorColumn ctermbg=darkgrey

" gitcommit settings
au FileType gitcommit set tw=72

" Syntax highlighting
syntax on
" Adding .vim/plugin to runtimepath.
" cscope plugin is here
set runtimepath+=",~/.vim/plugin/"

" Some bug in NERDTree causing ^G in names
let g:NERDTreeNodeDelimiter = "\u00a0"

" Plug settings
call plug#begin('~/.vim/plugged')
" vim-go plugin
"Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

"" Highlight and whitespace settings from John
highlight Error ctermbg=red ctermfg=white guibg=red
match Error /\%81v.\+/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"let g:go_autodetect_gopath = 0
"set shell='/bin/sh'
"
"Ignore settings for NERDTree
set wildignore+=*.swp,*.lbc
let NERDTreeRespectWildIgnore=1
