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

"" Highlight and whitespace settings from John
highlight Error ctermbg=red ctermfg=white guibg=red
match Error /\%81v.\+/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Some bug in NERDTree causing ^G in names
let g:NERDTreeNodeDelimiter = "\u00a0"

" Plug settings
call plug#begin('~/.vim/plugged')
" vim-go plugin
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'leafgarland/typescript-vim'
Plug 'Yggdroot/indentLine'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'vim-syntastic/syntastic'
Plug 'psf/black', {'branch': 'stable' }
Plug 'mileszs/ack.vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-packer'
Plug 'dense-analysis/ale'
Plug 'DanBradbury/copilot-chat.vim', {'branch': 'main'}
call plug#end()

"" Autorun black on save for Python
augroup black_on_save
    autocmd!
    autocmd BufWritePre *.py Black
augroup end

"" typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"" js pretty template
""autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

"" syntastic check for tsuquyomi
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:ale_virtualtext_cursor = 'disabled'

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

"let g:go_autodetect_gopath = 0
"set shell='/bin/sh'
"
"Ignore settings for NERDTree
set wildignore+=*.swp,*.lbc
let NERDTreeRespectWildIgnore=1
