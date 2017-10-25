" vim:set noet sts=4 sw=4 ts=4 tw=78 fdm=marker fdl=1:
" Statusline {{{1
set laststatus=2
" Powerline symbols quick ref:
"  > Triangle U+e0b0,  > U+e0b1,  < Triangle U+e0b2,
"  < U+e0b3,  Git U+e0a0,  LN U+e0a1,  Lock U+e0a2
set statusline=
set statusline+=%6*\ %n\ %*
set statusline+=%2*%{v:this_session!=''?'\ \ '.fnamemodify(this_session,':t'):''}%*
set statusline+=%3*\ \:%{@:}\ \ %{cw#ReadOnly()}%*
set statusline+=%4*\ %=
set statusline+=%5*\ %#WarningMsg#%k%r%w%m%0*
set statusline+=%6*\ %{&ft}\ %*
set statusline+=%{&fenc!=?'utf-8'?'\ \ ['.&fenc.']':''}
set statusline+=%{&ff!=?'unix'?'\ \ ['.&ff.']':''} " Fileformat
set statusline+=\ \ %-3(%{cw#FileSize()}%)       " File size
set statusline+=%7*%3c:%3l/%L
set statusline+=\ %*
" ========================================
function! ALE() abort
	return exists('*ALEGetStatusLine') ? ALEGetStatusLine() : ''
endfunction

function! GUTENTAGSSTATUS() abort
	return exists('*gutentags#statusline()') ? gutentags#statusline() : ''
endfunction

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{ALE()}
set statusline+=%#incsearch#
set statusline+=%{cw#StatuslineTabWarning()}
set statusline+=%{cw#StatuslineTrailingSpaceWarning()}
set statusline+=%9*%{GUTENTAGSSTATUS()}
set statusline+=%*

" from http://twily.info/.vimrc#view {{{2
" set statusline=\ %{cw#HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" highlighting {{{2
hi User1 guibg=green guifg=white
hi User2 guibg=red guifg=white
hi User3 guibg=blue guifg=white
hi User4 guibg=purple guifg=white
hi User5 guibg=yellow guifg=white
hi User6 guibg=gray guifg=white

hi User7 term=standout gui=standout
hi User8 term=bold gui=bold
hi User9 term=reverse gui=reverse
" }}}1
