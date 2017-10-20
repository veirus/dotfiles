" Emmet {{{3
let emmetlist = ['html','smarty','pug','php','xml','xsl','xslt','xsd','css',
            \ 'sass','scss','less','styl','stylus','mustache','handlebars',
            \ 'jinja']
Plug 'mattn/emmet-vim', {'for': emmetlist }
" let g:user_emmet_settings = {
"       \ 'php': {
"       \     'snippets': {
"       \         'php':  "<?php |; ?>",
"       \         'tf':   "<?php the_field('|', 'options'); ?>",
"       \         'tsf':  "<?php the_sub_field('|'); ?>",
"       \         'if':   "<?php if(|${child}): ?>",
"       \         'hr':   "<?php if( have_rows('${cursor}', 'option') ): ?>\n\t<?php while( have_rows('${cursor}', 'option')): the_row(); ?>\n\t${2}\n\t<?php endwhile; ?>\n<?php endif; ?>",
"       \         'els':  "<?php elseif(|): ?>",
"       \         'wh':   "<?php while(|${child}): ?>",
"       \         'ei':   "<?php endif; ?>",
"       \         'ew':   "<?php endwhile; ?>",
"       \         'echo': "<?php echo |; ?>",
"       \         },
"       \     },
"       \ }
let g:user_emmet_leader_key = '\'
augroup emmet_maps
    autocmd!
    " autocmd FileType stylus,html,css,less,sass,scss imap <buffer><expr><C-Space> <sid>cw#zen_html_tab()
    autocmd FileType {ht,x,xs}ml,php,pug,s\\\{-\}[ac]ss,less,stylus,jinja imap <buffer><expr> <C-Space> emmet#expandAbbrIntelligent("\<C-Space>")
    " autocmd FileType stylus,html,css,less,sass,scss imap <buffer><expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup END
"}}}3
" vim: se et:
