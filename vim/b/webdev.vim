" == < webdev \> == {{{2
" General
" Emmet {{{3
let emmetlist = ['html','smarty','pug','php','xml','xsl','xslt','xsd','css',
      \ 'sass','scss','less','styl','stylus','mustache','handlebars']
Plug 'mattn/emmet-vim', {'for': emmetlist }
let g:user_emmet_settings = {
      \ 'php': {
      \     'snippets': {
      \         'php':  "<?php |; ?>",
      \         'tf':   "<?php the_field('|', 'options'); ?>",
      \         'tsf':  "<?php the_sub_field('|'); ?>",
      \         'if':   "<?php if(|${child}): ?>",
      \         'hr':   "<?php if( have_rows('${cursor}', 'option') ): ?>\n\t<?php while( have_rows('${cursor}', 'option')): the_row(); ?>\n\t${2}\n\t<?php endwhile; ?>\n<?php endif; ?>",
      \         'els':  "<?php elseif(|): ?>",
      \         'wh':   "<?php while(|${child}): ?>",
      \         'ei':   "<?php endif; ?>",
      \         'ew':   "<?php endwhile; ?>",
      \         'echo': "<?php echo |; ?>",
      \         },
      \     },
      \ }
let g:user_emmet_leader_key = '\'
" autocmd FileType stylus,html,css,less,sass,scss imap <buffer><expr><C-Space> <sid>cw#zen_html_tab()
autocmd FileType {ht,x,xs}ml,php,pug,s\\\{-\}[ac]ss,less,stylus imap <buffer><expr> <C-Space> emmet#expandAbbrIntelligent("\<C-Space>")
" autocmd FileType stylus,html,css,less,sass,scss imap <buffer><expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"}}}3
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

