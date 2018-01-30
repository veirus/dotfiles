" Перед сохранением вырезаем пробелы на концах
augroup Python_strip_trailing_spaces " {{{
	autocmd!
	autocmd BufWritePre *.py[w] normal! m`:%s/\s\+$//e ``
augroup END "}}}

autocmd! BufNewFile *.py[w]\\\{-\} call cw#SkeletonPY()

setlocal smartindent formatoptions+=croq
"	↓↓↓ this already set in the $VIMRUNTIME/ftplugin/python.vim
"	\ expandtab shiftwidth=4 tabstop=4 softtabstop=4

" В .py файлах включаем умные отступы после ключевых слов
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

let python_highlight_all = 1
nnoremap <buffer> <Leader><F7> :!python %<CR>
nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<CR>
