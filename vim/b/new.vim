" == new stuff == {{{2
Plug 'jpalardy/vim-slime'
	let g:slime_target = "conemu"
Plug 'justinmk/vim-gtfo'
" Plug 'sk1418/HowMuch', { 'on': 'HowMuch' }

" 2017-07-26 {{{3
Plug 'othree/csscomplete.vim'
augroup css_complete
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup END

" [ vim 8 syntax | ctrlp-swoop ] {{{3
" Plug 'vim-jp/syntax-vim-ex' " for vim 8.0 syntax
" Plug 'mattn/ctrlp-swoop'

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
" Plug 'fcpg/vim-showmap'

" 2017-02-06 [ ale ] {{{3
Plug 'w0rp/ale'
	" let g:ale_lint_on_save = 1
	" let g:ale_lint_on_text_changed = 0
	let g:ale_statusline_format = [' ✖ %d ', ' ! %d ', '']
" }}}3
