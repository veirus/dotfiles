" start vundler
set nocompatible
filetype off
set rtp+=$HOME/nvim/bundle/Vundle.vim/
"call vundle#rc()
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" core plugins
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'

" vim main plugins
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'scrooloose/syntastic.git'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-fugitive'
Bundle 'henrik/vim-indexed-search'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rhysd/clever-f.vim'

" togglable panels
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-vinegar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'

" language vundles
Bundle 'pangloss/vim-javascript'
Bundle 'marijnh/tern_for_vim'
Bundle 'othree/javascript-libraries-syntax.vim'

Bundle 'fatih/vim-go'
Bundle 'klen/python-mode'
Bundle 'plasticboy/vim-markdown'

Bundle 'vim-scripts/c.vim'

" databases
Bundle 'vim-scripts/SQLUtilities'
Bundle 'NagatoPain/AutoSQLUpperCase.vim'

" autocomplete
Bundle 'Valloric/YouCompleteMe'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
call vundle#end()
" enable all the plugins
filetype plugin indent on


