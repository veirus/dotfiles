" statusline {{{2

set statusline=
set statusline+=%#StatusLineTerm#\ %n%H%M%R%W\ %*            " flags and buf no
set statusline+=%<\                                          " cut at start
set statusline+=%=%f\                                        " path
set statusline+=%y\                                          " file type
set statusline+=%(%{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ %{&fenc!='utf-8'?&fenc:(&enc!='utf-8'?&enc:'')}
set statusline+=\ %{&fileformat!='unix'?'\['.&ff.'\]':''}
set statusline+=%8((%l,%c)%)\                                " line and column
set statusline+=%P                                           " percentage of file

" current time, when buffer saved
set statusline+=\ %#ToolbarLine#%{'\ '.strftime('%R',getftime(expand('%'))).'\ '}

" statusline }}}2

