" File: help.vim
" Author: amadeus
" Description: stolen from https://github.com/amadeus/vim-misc
" Last Modified: Февраль 25, 2019

" TESTING: Improved help navigation
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
