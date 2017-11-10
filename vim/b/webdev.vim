" == < webdev \> == {{{2
" General
" 2017-06-30 [ polyglot ] {{{3
Plug 'sheerun/vim-polyglot'
" 2017-11-02 {{{3
Plug 'captbaritone/better-indent-support-for-php-with-html'
" 2017-10-30 [ php completion ] {{{3 hangs vim when opening php file
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" 2017-06-26 [ php indenting ] {{{3 doesn't fucking work!
" Plug '2072/PHP-Indenting-for-VIm'
" Replaced with [ poliglot ] {{{3
" Plug 'othree/html5.vim',       {'for': ['html', 'php', 'tpl']}
" Plug 'JulesWang/css.vim',      {'for': ['css', 'html', 'scss', 'sass', 'less']}
" }}}3
Plug 'hail2u/vim-css3-syntax', {'for': ['css','html','scss','sass','less']}
Plug 'closetag.vim',           {'for': ['html', 'php', 'tpl']}
" ---------------
" Pre HTML
Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'digitaltoad/vim-pug', {'for': ['jade','pug']} " replaced with [ polyglot ] {{{3
" Plug 'tpope/vim-markdown', {'for': ['markdown', 'md', 'mdown', 'mkd', 'mkdn']}
" }}}3
" ---------------
" Pre CSS
" replaced with [ polyglot ] {{{3 "
" Plug 'cakebaker/scss-syntax.vim', {'for': ['sass', 'scss']}
" Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'wavded/vim-stylus', {'for': ['styl', 'stylus']}
" }}} replaced with [ polyglot ] "
" 2017-04-14
" Plug 'rstacruz/vim-hyperstyle' "requires python27
" ---------------
" Post CSS
Plug 'csscomb/vim-csscomb', {'on': 'CSScomb'}
" 2017-04-17 [ postcss syntax ]
Plug 'stephenway/postcss.vim'
" ---------------
" Js
" replaced with [ polyglot ] {{{3 "
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'html'] }
" Plug 'elzr/vim-json', { 'for': ['json', 'javascript', 'js', 'html'] }
" Plug 'moll/vim-node', {'for': [ 'js', 'javascript' ]} " 2017-03-09
" }}} replaced with [ polyglot ] "
let g:vim_json_syntax_conceal = 0
" 2017-02-06
Plug 'ternjs/tern_for_vim', {'for': [ 'js', 'javascript' ]}
	let g:tern_map_keys = 1
Plug 'itspriddle/vim-jquery', {'for': [ 'js', 'js.jquery', 'javascript' ]}
" ---------------
Plug 'KabbAmine/gulp-vim', {'on': ['Gulp','GulpExt']} " oh wow this is actually usefull!
Plug 'gko/vim-coloresque', {'for': ['html', 'css', 'less', 'sass', 'stylus', 'php']} " *^* This
" Plug 'ap/vim-css-color', {'for': ['html', 'css', 'less', 'php']} " Trying *^* instead of this colorizer

" 2017-02-06 [ ale ] {{{3
Plug 'w0rp/ale'
	" let g:ale_lint_on_save = 1
	" let g:ale_lint_on_text_changed = 0
	let g:ale_lint_on_insert_leave = 1
	let g:ale_statusline_format = [' ✖ %d ', ' ! %d ', '']
" }}}3
