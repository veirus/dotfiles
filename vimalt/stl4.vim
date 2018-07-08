" emacs-like statusline, pretty clean
set statusline=
	\\ %{&filetype!=#''?&filetype:'none'}
	\\ %{&readonly\|\|!&modifiable?&modified?'%*':'%%':&modified?'**':'--'}
	\\ %{&fenc!='utf-8'?&fenc:(&enc!='utf-8'?&enc:'')}
	\\ %{&fileformat!='unix'?'\['.&ff.'\]':''}
	\\ %{&modifiable?(&expandtab?'et':'noet').'»'.&shiftwidth:''}
	\\ %<%{expand('%:~:.')!=#''?expand('%:~:.'):'[No\ Name]'}
	\%=
	\\ C%c%3(%)L%l/%L%2(%)
