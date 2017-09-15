" vim:set noet sts=4 sw=4 ts=4 tw=78 fdm=marker fdl=1:
" Statusline {{{1
set laststatus=2
" Powerline symbols quick ref:
"  > Triangle U+e0b0,  > U+e0b1,  < Triangle U+e0b2,
"  < U+e0b3,  Git U+e0a0,  LN U+e0a1,  Lock U+e0a2
set statusline=
set statusline+=\ %n
set statusline+=%{v:this_session!=''?'\ \ '.fnamemodify(this_session,':t'):''}
set statusline+=\ \ \:%{@:}\ \ %<%.92F\ %{cw#ReadOnly()}
set statusline+=\ %=
set statusline+=\ %#WarningMsg#%k%r%w%m%0*
set statusline+=\ \ %{&ft}
set statusline+=%{&fenc!=?'utf-8'?'\ \ ['.&fenc.']':''}
set statusline+=%{&ff!=?'unix'?'\ \ ['.&ff.']':''} " Fileformat
set statusline+=\ \\ %-3(%{cw#FileSize()}%)       " File size
set statusline+=%7*%3c:%3l/%L
set statusline+=\ %*
" ========================================
function! ALE() abort
	return exists('*ALEGetStatusLine') ? ALEGetStatusLine() : ''
endfunction

function! GUTENTAGSSTATUS() abort
	return exists('*gutentags#statusline()') ? gutentags#statusline() : ''
endfunction

"display a warning if &et is wrong, or we have mixed-indenting
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
hi User7 term=standout gui=standout
hi User8 term=bold gui=bold
hi User9 term=reverse gui=reverse
" }}}1
