" vim:set noet sts=4 sw=4 ts=4 tw=78 fdm=marker fdl=2:
" THIS IS CHAOS!!1
if exists('g:loaded_chaos')
	finish
endif
let g:loaded_chaos = 1
" My problem is that i really like ✨#Sugar 🍬...
"=================================
" I -- IMPORTANT -- {{{2
"=================================
"
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" = #icantlivewithoutyou = {{{3
" still undecided, it seems i can live with nothing...
inoremap <C-l> <right>
" okay, ↑ this ↑ is pretty crucial

" = Moving around = {{{3
" Easier horizontal scrolling
map zl zL
map zh zH

" screen line scroll - very useful with wrap on
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" auto center {{{4

" Keep search matches in the middle of the window. + unfolds
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
" auto center }}}4

" Comfortable parenthesis jumping
map <M-a> %
" Q is free since *closewindoworbuffer* is disabled
map Q %

" Extremely comfortable traveling to the line ends
" Indipensible in the combos
noremap H ^
noremap L g_
nnoremap gl L
nnoremap gh H

"=================================
"  II -- Quality of life -- {{{2
"=================================

" Yank and Paste {{{3
" easy paste
inoremap <C-v> <C-r><C-p>+
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" fast copy-paste (for non-gVim)
noremap <Leader>y "+y
noremap <leader>Y "+y$
" vnoremap <Leader>y "+y
" vnoremap <Leader>p "+p
noremap <leader>p :set paste<cr>"+]p:set nopaste<cr>
noremap <leader>P :set paste<cr>"+[p:set nopaste<cr>
" toggle paste
noremap <F12> :setl invpaste<CR><bar>:set paste?<CR>

" URL opening, uses plugin {{{3
nmap gxx <Plug>(openbrowser-smart-search)
vmap gxx <Plug>(openbrowser-smart-search)

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
"}}}3

" reselect visual block after indent #superuseful
vnoremap < <gv
vnoremap > >gv

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" Current file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<CR>

" = <s>RIP AND TEAR!</s> Split and join = {{{3

" Join an entire paragraph.
" Useful for writing GitHub comments in actual Markdown
" and then translating it to their bastardized version of Markdown.
nnoremap <leader>J mzvipJ`z

" Keep cursor line in place when joining lines
nnoremap J mzJ`z

nnoremap K m`a<CR><ESC>``
" help me obi vim kenobi... I mean i use K from time to time.
nnoremap <S-F12> K

" unimpaired-style, not as nice as i thought
nnoremap [<CR> m`i<CR><ESC>``
nnoremap ]<CR> m`a<CR><ESC>``

" Sneaky new line
nnoremap <silent> <M-j> m`o<ESC>``
nnoremap <silent> <M-k> m`O<ESC>``
" fallback maps if Alt won't work
nnoremap <silent> <leader>j m`o<ESC>``
nnoremap <silent> <leader>k m`O<ESC>``
nnoremap <silent> <C-CR> o<ESC>
nnoremap <silent> <S-CR> O<ESC>
inoremap <silent> <S-CR> <ESC>O

" = Seek and destroy = {{{3
" from http://twily.info/.vimrc#view
" When you press gv you vimgrep after the selected text
vnoremap <silent> <leader>g :call VisualSelection('gv', '')<CR>
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" Vimgreps in the current file
map <leader>gc :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" vimgrep my last search
nnoremap <silent> <leader>gn :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" grep word under cursor
nnoremap <M-g> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" = -- UI -- = {{{3
" Update!
" nnoremap <leader>w :up<cr>

nnoremap <silent> <leader>r :call cw#Cycle_numbering()<CR>

" toggle little nifty symbols
nnoremap <leader><BS> :set list! list?<cr>

" = <F > keys: = {{{3

nnoremap <F2> :Vex<CR>
nnoremap <F4> :set hlsearch! hlsearch?<cr>
nnoremap <F5> :call cw#SetModalCursor()<cr>

" Word-wrap toggle
nnoremap <F6> :setl wrap!<bar>:set wrap?<CR>
imap <F6> <C-O><F6>

nnoremap <F9> :call cw#SetRandomColors()<CR>
" noremap <F11> :call cw#SwitchTheLight()<cr>
nnoremap <leader><F11> :so $MYVIMRC<CR> :echo "* .vimrc loaded *"<CR>
nnoremap <Leader><F12> :tabnew $MYVIMRC<CR>

" = Buffers = {{{3
" quick buffer open
nnoremap gb :ls<CR>:b
nnoremap <leader>d :ls<CR>:bd
nnoremap <leader><leader> <C-^>

" window killer
" doesn't do what i actually may want:
" nnoremap <silent> Q :call cw#CloseWindowOrKillBuffer()<cr>

" A better way, preserves window, requires a plugin:
nnoremap <leader>q :Bdelete<CR>

" = windows = {{{3
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

" = tabs = {{{3
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>

" = formatting = {{{3
" stylus exclusive: remove all semicolons
nnoremap <leader>f; :call cw#Preserve("%s/;\$//g")<CR>

nnoremap <leader>f= :call cw#Preserve("normal gg=G")<CR>

" most common substitute patterns
nnoremap <leader>f4 :call cw#Preserve("%s/\\s\\+$//e")<CR>
nnoremap <leader>B :s/{/}/g<CR>

nnoremap <expr> <leader>f3 ':%s///g<LEFT><LEFT><LEFT>'
nnoremap <expr> <leader>f5 ':%s/' . @/ . '//g<LEFT><LEFT>'
nnoremap <leader>f6 :%s/\<<c-r><c-a>\>//g<LEFT><LEFT>
xnoremap <leader>f6 y:%s`<c-r>0``g<left><left>

nnoremap <expr> <F3> ':g//#<LEFT><LEFT>'

xnoremap <leader>s :sort<cr>

" = folds = {{{3 - folds are awesome
nnoremap zr zr:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zm zm:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zR zR:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zM zM:echo 'foldlevel: ' . &foldlevel<cr>
" *almost* the same:
nnoremap zx zxzz
nnoremap <leader>z zMzvzz
" buggy with multiple fold levels
nnoremap z] :<C-u>silent! normal! zc<CR>zjzo
nnoremap z[ :<C-u>silent! normal! zc<CR>zkzo[z
" }}}3
" = language switching = {{{3
nmap <M-z> a<C-^><Esc>
if exists('g:is') && !g:is.gui
	" lang switch terminal edition
	nmap <C-Space> a<C-^><Esc>
	vmap <silent> <C-Space> <Esc>a<C-^><Esc>gv
endif
" }}}3

"=================================
"  III -- Rare -- {{{2
"=================================

" = WTF?!! = {{{3
" aka "I don't even know what the fuck it is for or how it get into my config"
xnoremap @ :<C-u>call cw#ExecuteMacroOverVisualRange()<CR>
" }}}3 /wtf...
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

nnoremap <M-space> :call UltiSnips#ExpandSnippet()<CR>
inoremap <M-space> <C-R>=UltiSnips#ExpandSnippet()<CR>

" Substitute shortcuts
nnoremap <c-s> :s/
nnoremap <M-s> :%s/
xnoremap <c-s> :s/

" echo highligting groups
nnoremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"
" consistent menu navigation
" https://github.com/jasonlong/dotfiles/blob/master/vimrc

" reselect last paste ( not working recently? )
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Unfuck my screen
nnoremap <leader>R :syntax sync fromstart<cr>:redraw!<cr>

" [sensible.vim] Use <C-L> to clear the highlighting of :set hlsearch.
" NOTE: actually useful but i switched to :nohl
if maparg('<BACKSPACE>', 'n') ==# ''
	nnoremap <silent> <BACKSPACE> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><BACKSPACE>
endif

" Display all lines with keyword under cursor and ask which one to jump to
" NOTE: this is quite nifty really
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"}}}2
"=================================
" new {{{
map g. @:
inoremap ; ;<c-g>u
" ~ toggles ' and " in addition to its normal behaviour
nnoremap <expr> ~ getline('.')[col('.')-1] == "'" ? "r\"l" : getline('.')[col('.')-1] == '"' ? "r'l" : '~'

" get the leader right {{{2
" https://konfekt.github.io/blog/2016/10/03/get-the-leader-right
nnoremap : ,
xnoremap : ,
onoremap : ,

" <CR> is better option! unless buffer is netrw...
nnoremap , :
xnoremap , :
onoremap , :
" }}}2

nnoremap gy :%y<CR>

" Make arrow keys useful
noremap <Up> ddkP
noremap <Down> ddp
noremap <Left> <<
noremap <Right> >>
vmap <Left> <gv
vmap <Right> >gv
" new }}}
