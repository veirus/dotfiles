" Command mode mappings. ( stolen shamelessly from Greg Hurrel )
if exists('g:loaded_commandmaps')
	finish
endif
let g:loaded_commandmaps = 1

" => vim-rsi
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
set wildcharm=<C-z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" => vim-rsi
" These rely on Option-Left and Option-Right being set to send these escape
" sequences in the iTerm2 preferences. See `:help tcsh-style`.
" cnoremap <Esc>b <S-Left>
" cnoremap <Esc>f <S-Right>
