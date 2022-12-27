" Перед сохранением вырезаем пробелы на концах
" Заменено ALEFix
" augroup Python_strip_trailing_spaces " {{{
" augroup py_strip_spaces "{{{
" 	autocmd!
" 	autocmd BufWritePre *.py[w] normal! m`:%s/\s\+$//e ``
" augroup END "}}}

augroup py_skeleton "{{{
    autocmd! BufNewFile *.py[w]\\\{-\} call cw#SkeletonPY()
augroup END "}}}

setlocal smartindent formatoptions+=croq
"	↓↓↓ this already set in the $VIMRUNTIME/ftplugin/python.vim
"	\ expandtab shiftwidth=4 tabstop=4 softtabstop=4

" В .py файлах включаем умные отступы после ключевых слов
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

let python_highlight_all = 1

let g:ale_fixers = [
            \ 'add_blank_lines_for_python_control_statements',
            \ 'black',
            \ 'isort',
            \ 'remove_trailing_lines',
            \ 'trim_whitespace',
            \]

        " unused, may cause some bugs:
            " \ 'yapf',
            " \ 'reorder-python-imports',
            " \ 'autopep8',
            " \ 'ale#fixers#generic_python#BreakUpLongLines',
            "
nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

" Quick run
nnoremap <buffer> <Leader><F7> :!python %<CR>
nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<CR>

" Quick run via <F5>
" http://liuchengxu.org/posts/use-vim-as-a-python-ide/
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
        exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
        exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
        " exec "AsyncRun! time python %"
        exec "AsyncRun! python %"
    endif
endfunction

" asyncrun now has an option for opening quickfix automatically
" this is height in lines
let g:asyncrun_open = 8

" disable annoying 'line too long' messages
let g:pymode_lint_ignore = "E501,W"
