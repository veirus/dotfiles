" == new stuff == {{{2
Plug 'vim-scripts/txt.vim'

" 2017-11-23 {{{3
" Plug 'easymotion/vim-easymotion'
" 	map s <Plug>(easymotion-prefix)

" 2017-11-22 {{{3
Plug 'gregsexton/MatchTag'
Plug 'Yggdroot/LeaderF'
	 let g:Lf_StlSeparator = { 'left': '', 'right': '' }
	 let g:Lf_ShortcutF = '<C-P>'

" 2017-11-21 {{{3
Plug 'maralla/completor.vim'
	let g:completor_auto_trigger = 0
	" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
	inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
"}}}3
" repeat motions
Plug 'Houl/vim-repmo'
" TODO: test them motherfucker! Use them you moron!
" Plug 'Shougo/deoplete.nvim'
Plug 'vim-scripts/renamer.vim'
Plug 'moll/vim-bbye'
Plug 'jpalardy/vim-slime'
	let g:slime_target = "conemu"
Plug 'justinmk/vim-gtfo' " this is fucking awesome!
Plug 'sk1418/HowMuch', { 'on': 'HowMuch' }

" 2017-07-26 {{{3
" Plug 'othree/csscomplete.vim'
" augroup css_complete
" 	autocmd!
" 	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" augroup END

" 2017-06-22 [ splitjoin ] {{{3
Plug 'AndrewRadev/splitjoin.vim'
	let g:splitjoin_split_mapping = 'cx'
	let g:splitjoin_join_mapping  = 'cv'

" 2017-06-07 [ vim-searchindex | vim-hier | vim-agrep ] {{{3
Plug 'google/vim-searchindex' " very cool
" Plug 'osyo-manga/vim-agrep'

" 2017-05-17 [supertab] {{{3
" Plug 'ervandew/supertab'

" 2017-03-21 [ hardtime ] {{{3
Plug 'takac/vim-hardtime'
	nnoremap <leader><F1> <Esc>:HardTimeToggle<CR>
	let g:hardtime_default_on = 1
	let g:hardtime_ignore_quickfix = 1
	let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
	let g:list_of_visual_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

