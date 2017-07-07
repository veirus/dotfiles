" Mappings {{{1 THIS IS CHAOS!!1
"========================================
" I -- IMPORTANT -- {{{2
" = #icantlivewithoutyou =
"========================================
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" = Moving around = {{{2
" Easier horizontal scrolling
map zl zL
map zh zH

" screen line scroll - very useful with wrap on
" nnoremap <silent> j gj
" nnoremap <silent> k gk
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" auto center {{{3
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
" Keep search matches in the middle of the window. + unfolds
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
"}}}3

inoremap <C-l> <right>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Comfy warm fluffy and lampy parenthesis jumping
nnoremap á %
vnoremap á %
nnoremap <M-a> %
vnoremap <M-a> %

noremap H ^
noremap L g_
nnoremap gl L
nnoremap gh H

"=================================
"  II -- Quality of life -- {{{2
"=================================

" Yank and Paste {{{3
" easy paste
inoremap <C-q> <C-r><C-p>+
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" fast copy-paste
noremap <Leader>y "+y
noremap <leader>Y "+y$
" vnoremap <Leader>y "+y
" vnoremap <Leader>p "+p
noremap <leader>p :set paste<cr>"+]p:set nopaste<cr>
noremap <leader>P :set paste<cr>"+[p:set nopaste<cr>
" toggle paste
noremap <F12> :setl invpaste<CR><bar>:set paste?<CR>

" URL opening :\ {{{3
" https://sts10.github.io/blog/2016/02/16/one-solution-to-a-problem-with-vims-gx-command/
nnoremap <silent> gx :normal viugx<CR>
nmap gk <Plug>(openbrowser-smart-search)
vmap gk <Plug>(openbrowser-smart-search)

" Insert date on <F8> and <S-F8> {{{3
nnoremap <F8> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
inoremap <F8> <C-R>=strftime("%Y-%m-%d")<CR>
vnoremap <F8> da<C-R>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <S-F8> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <S-F8> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
vnoremap <S-F8> da<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" sane regex {{{3
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v
"}}}3

" reselect visual block after indent #superuseful
vnoremap < <gv
vnoremap > >gv

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Unfuck my screen
nnoremap <leader>R :syntax sync fromstart<cr>:redraw!<cr>
" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Current file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<CR>

" = <s>RIP AND TEAR!</s> Split and join = {{{3
" Keep cursor line in place when joining lines
nnoremap J mzJ`z
" = Seek and destroy = {{{3

" Sneaky new line
nnoremap <silent> <M-j> m`o<ESC>``
nnoremap <silent> <M-k> m`O<ESC>``
" Handy line split: before and after cursor
" fallback maps if Alt won't work
nnoremap <silent> <leader>j m`o<ESC>``
nnoremap <silent> <leader>k m`O<ESC>``
nnoremap <silent> <C-CR> o<ESC>
nnoremap <silent> <S-CR> O<ESC>
inoremap <silent> <S-CR> <ESC>O
" unimpaired-style, not as sleek as above
" ...or maybe you motherfucker just increase the ttimeoutlen?
nnoremap [<CR> m`i<CR><ESC>``
nnoremap ]<CR> m`a<CR><ESC>``

nnoremap K m`a<CR><ESC>``
" help me obi vim kenobi...
nnoremap <S-F12> K

" vimgrep my last search
nnoremap <silent> <leader><F3> :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" from http://twily.info/.vimrc#view {{{3
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.*<left><left><left><left><left><left><left>
" Vimgreps in the current file
map <leader>/ :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" = WTF?!! = {{{2
xnoremap @ :<C-u>call cw#ExecuteMacroOverVisualRange()<CR>

nnoremap <M-space> :call UltiSnips#ExpandSnippet()<CR>
inoremap <M-space> <C-R>=UltiSnips#ExpandSnippet()<CR>
" Substitute
" nnoremap <c-s> :s/
" nnoremap <M-s> :%s/
" vnoremap <c-s> :s/

" echo highligting groups
nnoremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Browse current dir
nnoremap <silent> <F11> :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>

" Meta keys test {{{3
" works in terminal:
map <M-F5> :echo 'whoa f5'<cr>
" doesn't work in terminal:
" ==============================
map <silent> <M-1> :echo 'whoa1'<cr>
map <M-`> :echo 'cool!'<cr>
" map <M-space> :echo 'lol i can map it'<cr>
nnoremap <C-@> :echo 'heyheyhey'<cr>
map <C-k5> :echo 'yup:c5'<cr>

" =============== }}}3
" from Konfekt's leader key post
" nnoremap : ,
" nnoremap , :
" }}}2 /wtf...
" = -- UI -- = {{{2
" Update!
nnoremap <leader>w :up<cr>
" toggle little nifty symbols
nnoremap <leader><BS> :set list! list?<cr>

" <F#> keys: {{{3
" Word-wrap toggle
nnoremap <F6> :setl wrap!<bar>:set wrap?<CR>
imap <F6> <C-O><F6>
map <F9> :call cw#SetRandomColors()<CR>

" [sensible.vim] Use <C-L> [backspace] to clear the highlighting of :set hlsearch.
" actually useful but i switched to :nohl
if maparg('<BACKSPACE>', 'n') ==# ''
  nnoremap <silent> <BACKSPACE> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><BACKSPACE>
endif

nnoremap <silent> <leader>r :call cw#Cycle_numbering()<CR>
nnoremap <leader><F11> :so $MYVIMRC<CR> :echo "* .vimrc loaded *"<CR>
nnoremap <Leader><F12> :tabnew $MYVIMRC<CR>

" Buffers {{{3
" quick buffer open
nnoremap gb :ls<CR>:b<space>
nnoremap <leader><leader> <C-^>

" window killer
nnoremap <silent> Q :call cw#CloseWindowOrKillBuffer()<cr>
" buffer killer: open next and kill previous
" nnoremap <leader>q :bn<bar>sp<bar>bp<bar>bd<cr>
" much simpler version than above (requires at least 2 buffers)
nnoremap <leader>bd :b#\|bd#<CR>
" nnoremap <leader>Q :b#<bar>bd#<cr>

" shortcuts for windows {{{3
nnoremap <leader>= <C-w>=
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>vsa :vert sba<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Split resize
map <M-.> 4<C-W><
map <M-,> 4<C-W>>
map <M-=> <C-w>+
map <M--> <C-w>-

" shortcuts for tabs {{{3
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" formatting shortcuts
nmap <leader>f; :call cw#Preserve("%s/;\$//g")<CR>
nmap <leader>f= :call cw#Preserve("normal gg=G")<CR>
nmap <leader>f4 :call cw#Preserve("%s/\\s\\+$//e")<CR>
nmap <expr> <leader>f5 ':%s/' . @/ . '//g<LEFT><LEFT>'
nmap <expr> <leader>f3 ':%s///g<LEFT><LEFT><LEFT>'
nmap <expr> <F3> ':g//#<LEFT><LEFT>'
vmap <leader>s :sort<cr>

" folds {{{3
nnoremap zr zr:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zm zm:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zR zR:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zM zM:echo 'foldlevel: ' . &foldlevel<cr>
" show me only THIS fold #icantlivewithoutthis
nnoremap <leader>z zMzvzz
" too radikal4me!!1
" nnoremap zj :<C-u>silent! normal! zc<CR>zjzo
" nnoremap zk :<C-u>silent! normal! zc<CR>zkzo[z
" }}}3

" = language switching = {{{2
nmap <M-z> a<C-^><Esc>
if !g:is_gui
  " lang switch terminal edition
  nmap <C-Space> a<C-^><Esc>
  vmap <silent> <C-Space> <Esc>a<C-^><Esc>gv
endif
" }}}2
"=================================
"  III -- Rare -- {{{2
"=================================
nnoremap <F2> :Vex<CR>
nnoremap <F4> :set hlsearch! hlsearch?<cr>
" consistent menu navigation
" https://github.com/jasonlong/dotfiles/blob/master/vimrc
" }}}2
" reselect last paste ( not working recently? )
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Join an entire paragraph.
" Useful for writing GitHub comments in actual Markdown
" and then translating it to their bastardized version of Markdown.
nnoremap <leader>J mzvipJ`z

" Unfuck my screen
nnoremap <leader>R :syntax sync fromstart<cr>:redraw!<cr>

" [sensible.vim] Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<BACKSPACE>', 'n') ==# ''
	nnoremap <silent> <BACKSPACE> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><BACKSPACE>
endif

" reselect last paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Browse current dir
nnoremap <silent> <F11> :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>

" Easier formatting
nnoremap <silent> <leader>fq :call cw#Preserve("normal gwip")<CR>

nnoremap <silent> <leader>r :call cw#Cycle_numbering()<CR>

nnoremap [<CR> m`i<CR><ESC>``
nnoremap ]<CR> m`a<CR><ESC>``
map <M-=> <C-w>+
map <M--> <C-w>-

" shortcuts for tabs
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

"}}}2
"=================================
" }}}1
