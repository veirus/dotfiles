" == new stuff == {{{2
" 2017-07-26 [ leader-f ] {{{3
Plug 'othree/csscomplete.vim'
augroup css_complete
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup END
Plug 'Yggdroot/LeaderF'
" 2017-07-10 {{{3
" currently incompatible with my present todo files, disabling
" Plug 'aserebryakov/vim-todo-lists'
" [ vim 8 syntax | ctrlp-swoop ] {{{3
Plug 'vim-jp/syntax-vim-ex' " for vim 8.0 syntax
Plug 'mattn/ctrlp-swoop'
" 2017-06-30 [ polyglot ] {{{3
Plug 'sheerun/vim-polyglot'
" 2017-06-26 [ php indenting ] {{{3
Plug '2072/PHP-Indenting-for-VIm'
" 2017-06-23 [ md todo ] {{{3
Plug 'rlue/vim-getting-things-down'
" 2017-06-22 [ splitjoin ] {{{3
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_split_mapping = 'cx'
let g:splitjoin_join_mapping  = 'cv'
" 2017-06-07 [ vim-searchindex | vim-hier | vim-agrep ] {{{3
Plug 'google/vim-searchindex' " very cool
Plug 'osyo-manga/vim-agrep'
" 2017-05-23 [ gutentags ] {{{3
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_ctags_exclude=['node_modules']
" 2017-05-17 [supertab] {{{3
Plug 'ervandew/supertab'
" 2017-03-21 [ hardtime ] {{{3
Plug 'takac/vim-hardtime'
nnoremap <leader><F1> <Esc>:HardTimeToggle<CR>
let g:hardtime_ignore_quickfix = 1
" 2017-02-22 [ showmap ] {{{3
Plug 'fcpg/vim-showmap'
" 2017-02-06 [ ale ] {{{3
Plug 'w0rp/ale'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format = [' ✖ %d ', ' ! %d ', '']
" }}}3
" 2017-07-07 [ clever-f ] {{{3
" Doesn't work with cyrillic
" Plug 'rhysd/clever-f.vim'
" }}}3
