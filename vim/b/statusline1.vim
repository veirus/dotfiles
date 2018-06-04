" vim:fdm=marker fdl=1:
" Statusline {{{1
set laststatus=2
" Powerline symbols quick ref:
"  > Triangle U+e0b0,  > U+e0b1,  < Triangle U+e0b2,
"  < U+e0b3,  Git U+e0a0,  LN U+e0a1,  Lock U+e0a2
func! StlEcho(sym) abort
	return a:sym
endfunction

if g:is.nvim
	let lsep = '|'
	let rsep = '|'
else
	let lsep = ''
	let rsep = ''
endif

set statusline=
set statusline+=\ %n
set statusline+=%{v:this_session!=''?'\ '.fnamemodify(this_session,':t'):''}
set statusline+=\ %{StlEcho(lsep)}
" set statusline+=\ \:%{@:}
" set statusline+=\ %{StlEcho(lsep)}
set statusline+=\ %<%.92F
set statusline+=\ %{cw#ReadOnly()}
set statusline+=\ %=
set statusline+=\ %#WarningMsg#%k%r%w%m%0*
set statusline+=\ %{StlEcho(rsep)}\ %{&ft}
set statusline+=%{&fenc!=?'utf-8'?'\ \ ['.&fenc.']':''}
set statusline+=%{&ff!=?'unix'?'\ \ ['.&ff.']':''}
set statusline+=\ %{StlEcho(rsep)}\ %-3(%{cw#FileSize()}%)
set statusline+=%7*%3c:%3l/%L
set statusline+=\ %*
" ========================================
function! ALE() abort
	let l:counts = ale#statusline#Count(bufnr(''))

	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors

	return l:counts.total == 0 ? '' : printf(
				\   '%dW %dE',
				\   all_non_errors,
				\   all_errors
				\)
endfunction

function! GUTENTAGSSTATUS() abort
	return exists('*gutentags#statusline()') ? gutentags#statusline() : ''
endfunction

"display a warning if &et is wrong, or we have mixed-indenting
" TODO: chech for pluging presence, to not fuck up rest of statusline
set statusline+=%#error#
set statusline+=%{ALE()}
set statusline+=%#incsearch#
set statusline+=%{cw#StatuslineTabWarning()}
set statusline+=%{cw#StatuslineTrailingSpaceWarning()}
set statusline+=%9*%{GUTENTAGSSTATUS()}
set statusline+=%*

" highlighting {{{2
hi User7 term=standout gui=standout
hi User8 term=bold gui=bold
hi User9 term=reverse gui=reverse
" }}}1
