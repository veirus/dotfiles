""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" not a vi
set encoding=utf-8

call plug#begin('$HOME/AppData/Local/nvim/plugged')

" core plugins
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'

" vim main plugins
Plug 'sjl/gundo.vim'
Plug 'bling/vim-airline'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/syntastic.git'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'edsono/vim-matchit'
Plug 'tpope/vim-fugitive'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'rhysd/clever-f.vim'

" togglable panels
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'

" language vundles
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'fatih/vim-go'
Plug 'klen/python-mode'
Plug 'plasticboy/vim-markdown'

Plug 'vim-scripts/c.vim'

" databases
Plug 'vim-scripts/SQLUtilities'
Plug 'NagatoPain/AutoSQLUpperCase.vim'

" autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
