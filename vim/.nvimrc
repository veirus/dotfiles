" Neovim-qt Guifont command, to change the font
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>")
" command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
" command -nargs=? GuiFont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:GuiFont="DejaVu Sans Mono for Powerline:h13"
" Set font on start
" let g:Guifont="DejaVu Sans Mono for Powerline:h13"
Guifont Consolas:h12
call GuiWindowMaximized(1)
" exe 'Guifont Consolas:h12'
