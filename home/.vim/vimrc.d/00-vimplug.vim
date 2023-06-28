call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-yank', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'joenye/coc-cfn-lint', { 'do': 'npm ci && npm run prepare' }
Plug 'fannheyward/coc-sql', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'josa42/coc-sh', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'klaaspieter/coc-sourcekit', { 'do': 'yarn install --frozen-lockfile && npm run prepare' }
Plug 'coc-extensions/coc-powershell', { 'do': 'npm ci && npm run compile' }
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/eleline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'pprovost/vim-ps1'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'Konfekt/FastFold'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install --frozen-lockfile' }
Plug 'LnL7/vim-nix'
Plug 'yasuhiroki/github-actions-yaml.vim'
Plug 'github/copilot.vim'

call plug#end()
