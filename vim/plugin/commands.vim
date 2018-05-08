" vim: set foldmethod=marker fdl=1:
if exists('g:cwcommands_loaded')
	finish
endif
let g:cwcommands_loaded = 1

" Commands {{{1
" >>> Shell command @ spf-13 {{{2
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
command! -complete=file -nargs=+ Shell call cw#RunShellCommand(<q-args>)
" >>> Conversion between TABS ans SPACES {{{2
command! Respace :setlocal expandtab | %retab!
command! Retab :setlocal noexpandtab | %retab!
" >>> Reverse lines {{{2
" https://vi.stackexchange.com/questions/2105/how-to-reverse-the-order-of-lines/2107#2107
command! -bar -range=% Reverse <line1>,<line2>global/^/m<line1>-1|nohl
" >>> Set random colorscheme {{{2
command! Rcl call cw#SetRandomColors()
" >>> Set modal cursors {{{2
command! Smc call cw#SetModalCursor()
" >>> UnMinify {{{2
command! UnMinify call cw#UnMinify()
" >>> Clear registers {{{2
command! Clr call cw#ClearRegisters()

" }}}1

