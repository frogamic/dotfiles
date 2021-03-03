filetype plugin indent on

set grepprg=glep\ -nH\ $*
set smartindent
set tabstop=2
set shiftwidth=2

set spell spelllang=en_au

set noruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set number

syntax enable
" set background=dark
colorscheme default-light
hi clear SpellBad
hi clear SpellLocal
hi SpellBad cterm=underline
hi SpellLocal cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
hi SpellLocal gui=undercurl

autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s

set listchars=tab:▸\ ,trail:·
set list
set foldmethod=syntax
" Open all folds by default
autocmd Syntax * normal zR
" Don't expand comment blocks with [oO]
autocmd FileType * setlocal formatoptions-=o
" Display status line always
set laststatus=2
