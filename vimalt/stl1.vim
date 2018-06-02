set statusline=
set statusline+=%2*▓▒░\ %n%H%M%R%W\ ░▒▓%*         " flags and buf no
set statusline+=%<\                               " cut at start
set statusline+=%=%f\                             " path
set statusline+=%1*▓▒░%y░▒▓%*\                    " file type
set statusline+=%(%{&modifiable?'░▒▓\ '.(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}\ ▓▒░%)
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}
set statusline+=\ \[%{&fileformat}\]
set statusline+=%8((%l,%c)%)\                     " line and column
set statusline+=%P                                " percentage of file

" current time, when buffer saved
set statusline+=\ %2*%{'▓▒░\ '.strftime('%R',getftime(expand('%'))).'\ ░▒▓'}
