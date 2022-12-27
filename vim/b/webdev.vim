" File: webdev.vim
" Author: carudo
" Description: stuff for web development
" Last Modified: 2020-12-27 Sun 20:36

" == < webdev \> == {{{2

let g:vim_json_syntax_conceal = 0

" prettier, great code /uglifier/
" ale should be enough
" Plug 'prettier/vim-prettier', {
"             \ 'do': 'yarn install',
"             \ 'for': ['javascript', 'typescript', 'css', 'less',
"             \        'scss', 'json', 'graphql', 'markdown', 'vue'] }

" 2017-06-30 [ polyglot ] {{{3
Plug 'sheerun/vim-polyglot'

" misc {{{3
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-scripts/closetag.vim', {'for': ['html', 'php', 'tpl']}
Plug 'stephenway/postcss.vim'
Plug 'KabbAmine/gulp-vim', {'on': ['Gulp','GulpExt']} " oh wow this is actually usefull!
" Plug 'gko/vim-coloresque', {'for': ['html', 'css', 'less', 'sass', 'stylus', 'php']}
" the below one is messing with html and Emmet
Plug 'ap/vim-css-color', {'for': ['css', 'less', 'sass', 'stylus']}
" buggy, inconvenient switch off (2019-03-29)
" Plug 'RRethy/vim-hexokinase'


" 2017-02-06 [ ale ] {{{3
Plug 'w0rp/ale'
	" let g:ale_lint_on_save = 1
	" let g:ale_lint_on_text_changed = 0
	let g:ale_lint_on_insert_leave = 1
	let g:ale_statusline_format = [' ✖ %d ', ' ! %d ', '']
	let g:ale_fixers = {
				\   'javascript': ['eslint','prettier'],
				\   'css': ['prettier','stylelint'],
				\}
	let g:ale_fix_on_save = 0
" }}}3

" 2017-11-02 [ PHP ] {{{3
Plug 'captbaritone/better-indent-support-for-php-with-html', {'for': 'php'}

" 2017-10-30 [ php completion ] {{{4
" XXX: hangs vim (and nvim) when opening php file
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" 2017-06-26 [ php indenting ] {{{4 it doesn't fucking work!
" Plug '2072/PHP-Indenting-for-VIm'

" ===============================
" Replaced with [ poliglot ] {{{3
" ===============================
"
" Plug 'othree/html5.vim',       {'for': ['html', 'php', 'tpl']}
" Plug 'JulesWang/css.vim',      {'for': ['css', 'html', 'scss', 'sass', 'less']}
" Plug 'hail2u/vim-css3-syntax', {'for': ['css','html','scss','sass','less']}
" ---------------
" Pre HTML
"
" Plug 'digitaltoad/vim-pug', {'for': ['jade','pug']}
" Plug 'tpope/vim-markdown', {'for': ['markdown', 'md', 'mdown', 'mkd', 'mkdn']}
" ---------------
" Pre CSS
"
" Plug 'cakebaker/scss-syntax.vim', {'for': ['sass', 'scss']}
" Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'wavded/vim-stylus', {'for': ['styl', 'stylus']}

" 2017-04-14
" Plug 'rstacruz/vim-hyperstyle' " requires python27
" ---------------
" Js
"
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'html'] }
Plug 'mxw/vim-jsx'
" Plug 'elzr/vim-json', { 'for': ['json', 'javascript', 'js', 'html'] }
" Plug 'moll/vim-node', {'for': [ 'js', 'javascript' ]} " 2017-03-09
" }}}3 replaced with [ polyglot ] "

" 2017-02-06
" Plug 'ternjs/tern_for_vim', {'for': [ 'js', 'javascript' ]}
" 	let g:tern_map_keys = 1
" Plug 'itspriddle/vim-jquery', {'for': [ 'js', 'js.jquery', 'javascript' ]}
"
" ===============================
