" augroup Python " {{{
"     autocmd!
"     " autocmd BufNewFile *.py call BufNewFile_PY()
"     autocmd BufNewFile *.py[w] call cw#SkeletonPY()
"     " autocmd BufNewFile *.pyw call cw#SkeletonPY()
"     "Перед сохранением вырезаем проwords=if,elif,else,for,while,try,except,finally,def,class
"     autocmd FileType python let python_highlight_all = 1
"     autocmd FileType python nnoremap <buffer> <Leader><F7> :!python %<CR>
"     autocmd FileType python nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<CR>
"     autocmd FileType python echo 'autocmd Python!'
" augroup END " }}}
augroup Python " {{{
    autocmd!
    " autocmd BufNewFile *.py call BufNewFile_PY()
    " autocmd BufNewFile *.pyw call cw#SkeletonPY()
    "Перед сохранением вырезаем пробелы на концах (только в .py файлах)
    autocmd BufWritePre *.py[w] normal! m`:%s/\s\+$//e ``
augroup END "}}}

setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent formatoptions+=croq
"В .py файлах включаем умные отступы после ключевых слов
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
let python_highlight_all = 1
nnoremap <buffer> <Leader><F7> :!python %<CR>
nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<CR>
