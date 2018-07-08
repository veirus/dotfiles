" emacs-like statusline, pretty clean
set statusline=
	\\ %{&filetype!=#''?&filetype:'none'}
	\\ %{&readonly\|\|!&modifiable?&modified?'%*':'%%':&modified?'**':'--'}
	\\ %{expand('%:~:.')!=#''?expand('%:~:.'):'[No\ Name]'}
	\%=
	\%<\ C%c%3(%)L%l/%L%2(%)
	\%6(%p%%\ %)
