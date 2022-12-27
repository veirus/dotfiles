" File: textobj.vim
" Author: carudo
" Description: Custom text objects
" Last Modified: 2018-11-17 Ñá 03:46

" -- text objects -- {{{3

" Plug 'wellle/targets.vim'
" TODO: learn how to use it effectivly. Test string below:
" an avesome ( and really complex (though not really) { but } neat) 'string'!
" and another one test string for fun and [many] profit(s)!

Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'                   " fun fact: may screw up everything unexpectedly
Plug 'kana/vim-textobj-function'              " doesn't work with {js, python}
Plug 'haya14busa/vim-textobj-function-syntax' " extends above plug
Plug 'kana/vim-textobj-fold'                  " quirky, seems can't work with fold levels > 1
Plug 'kana/vim-textobj-indent'                " useful actually, should use it more often
Plug 'jasonlong/vim-textobj-css', { 'for': [ 'css', 'scss', 'less' ] }
Plug 'adriaanzon/vim-textobj-matchit'         " doesn't work :\
" }}}3
