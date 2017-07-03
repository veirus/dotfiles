" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=0 foldmethod=marker fmr={{{,}}}:
"==================================================
"**************************************************
" Tips and tricks and vimscript examples
" ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
" that i don't need or not fully understand,
" but i want to remember them anyway because
" they may come in handy in future,
" and it is a waste to store them in my vimrc
"**************************************************
"==================================================
" _vimrc - Links to the vimrc in the vimfiles directory
runtime vimrc
"==================================================
" Encoding @ jenyay.net {{{

" set encoding=utf-8
" Список кодировок для автоматического определения, в порядке предпочтения
" взято с http://jenyay.net/Programming/Vim
" set fileencodings=utf-8,cp1251,utf-16le,cp866,koi8r,ucs-2le
" set fileencoding=utf-8    " set save encoding
" ========================================
" v2:
" if &termencoding == ""
"   let &termencoding = &encoding
" else
"   set termencoding=utf-8  " set terminal encoding
" endif

" }}}
"==================================================
" Python stuff {{{

autocmd FileType python set omnifunc=python3complete#Complete

let g:jedi#force_py_version = 3
" This moved into python autocommand
nnoremap <Leader>p :!python %<CR>
nnoremap <F7> :exec '!python' shellescape(@%, 1)<CR>
"}}}
"==================================================
" Autocomplete {{{1
" Авто комплит по табу {{{2
  function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
    else
          return "\<c-p>"
    endif
  endfunction

  imap <tab> <c-r>=InsertTabWrapper()<cr>
  inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
  inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
"}}}2
" Ctrl-пробел для автодополнения
  inoremap <C-space> <C-x><C-o>
"}}}1
"==================================================
" Emmet settings: {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css,less EmmetInstall
let g:user_emmet_leader_key='<M-,>'
let g:user_emmet_settings = {
 'php' : {
  \        'extends' : 'html',
  \        'filters' : 'html,c',
 },
}
"}}}
"==================================================
" russian langmap for hotkeys to work in both kb layouts
  set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
  set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"==================================================
" settings autoreload
  augroup myvimrc
      au!
      au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
  augroup END
"==================================================
" WTF? {{{
highlight lCursorxE guifg=NONE guibg=Cyan

" wtf:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
"==================================================
" Statusline examples {{{1
"==================================================
" Statusline and highligting example:{{{2
highlight User1   gui=NONE guifg=#ff0000 guibg=#d0d0e0
set statusline=%<%f%=\ [%1*%M%*%{','.&ff}%{&fenc!=''?','.&fileencoding:''}%R%Y][%6l,%4c%V]\ %3b=0x%02B\ %P
"==================================================
" Display current mode [n], [i], etc. {{{2
set statusline+=\ [%{mode()}]
" Fold method
set statusline+=\ %{&foldmethod}
" Current buffer '*' indicator (bugs if nerdtree or netrw is opened)
set statusline+=%1*\ \ %n%{g:actual_curbuf!=bufnr('%')?'':'*'}\ \ %2*
"==================================================
"at first only return something visual if an error found {{{2
set statusline=
set statusline+=\ %1*%r "set color + RO flag
set statusline+=%{&ff!='unix'?'['.&ff.']':''} "display ONLY if &ff != unix
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''} "display ONLY if NOT utf-8
" set statusline+=\ %{&fenc!=''?','.&fenc:''}\ %3* " alternative fenc
set statusline+=%{&bomb?'[!]':''}
set statusline+=%{StatuslineTabWarning()} "returns mixed, !et, tabs
set statusline+=%{&paste?'[paste]':''} "paste"
set statusline+=%{&modified?'+':''}\ "modified, constant OUTPUT starts here
"==================================================
" {{{2 reset color, filename
set statusline+=%*%-40t\ "reset color, filename
"==================================================
"{{{2 highlight search, incremental search, smarttab, tab/shiftwidth
set statusline+=[%{&hls?'h':'-'} "highlight search?
set statusline+=%{&is?'i':'-'} "incremental search
set statusline+=%2*%{&sta?'s':'-'} "smarttab
set statusline+=%3*%{&ts}%*%{&sw} "tab/shiftwidth
set statusline+=%4*%{&ai?'a':'-'}%{&si?'i':'-'}%{&cin?'c':'-'} "indent values
set statusline+=%5*%{&wrap?'<':'>'}%6*%{&tw}%*] "wrap/textwidth
set statusline+=%(\ %{VisualSelectionSize()}%)
set statusline+=%=%([%l,%c%)][%L:%p%%]\ "current line
"==================================================
" My Statusline {{{2
" Powerline symbols quick ref: , , , , , , 
set statusline=                               | " clear the statusline for when vimrc is reloaded
set statusline+=%1*\ %n
set statusline+=\ %7*%{CurBufIndicator('')}%<%2*
set statusline+=\ %{&ff}\ %3*
set statusline+=\ %{&fenc!=#''?&fenc:&enc} " from Lightline plugin
set statusline+=\ %#Directory#\ %{&ft!=''?','.&ft:'empty'}
" set statusline+=\ %#SignColumn#\ %{&ft!=''?','.&ft:'empty'}
set statusline+=\ %{CurBufIndicator('')}%#Directory#
set statusline+=\ %{&mod?'[+]':''}
set statusline+=\ %-.69f%=
set statusline+=\ %k\ %m%r%w
set statusline+=\ %3*\ col:%3c
set statusline+=\ %2*\ :%4l/%L\ %1*
set statusline+=\ %2p%%\ %*
" }}}2
"==================================================
" {{{2 Statusline from ahmedelgabri/dotfiles
" https://github.com/ahmedelgabri/dotfiles/blob/c4f40c27b295ecfb7673bd29d373cab26b93379b/vim/vimrc.local

let g:currentmode={
	\ 'n'  : 'N ',
	\ 'no' : 'N·Operator Pending ',
	\ 'v'  : 'V ',
	\ 'V'  : 'V·Line ',
	\ '^V' : 'V·Block ',
	\ 's'  : 'Select ',
	\ 'S'  : 'S·Line ',
	\ '^S' : 'S·Block ',
	\ 'i'  : 'I ',
	\ 'R'  : 'R ',
	\ 'Rv' : 'V·Replace ',
	\ 'c'  : 'Command ',
	\ 'cv' : 'Vim Ex ',
	\ 'ce' : 'Ex ',
	\ 'r'  : 'Prompt ',
	\ 'rm' : 'More ',
	\ 'r?' : 'Confirm ',
	\ '!'  : 'Shell ',
  \ 't'  : 'Terminal '
	\}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
	exe 'hi! StatusLine ctermfg=008 guifg=RoyalBlue2 guibg=fg'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
	exe 'hi! StatusLine ctermfg=005 guifg=goldenrod2 guibg=bg'
  elseif (mode() ==# 'i')
	exe 'hi! StatusLine ctermfg=004 guifg=chartreuse3 guibg=bg'
  else
	exe 'hi! StatusLine ctermfg=006 guifg=lavender guibg=bg'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
	let bytes = getfsize(expand('%:p'))
	if (bytes >= 1024)
		let kbytes = bytes / 1024
	endif
	if (exists('kbytes') && kbytes >= 1000)
		let mbytes = kbytes / 1000
	endif

	if bytes <= 0
		return '0'
	endif

	if (exists('mbytes'))
		return mbytes . 'MB '
	elseif (exists('kbytes'))
		return kbytes . 'KB '
	else
		return bytes . 'B '
	endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
	return ''
  else
	return ''
endfunction

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)

" }}}2
"==================================================
"/ Statusline examples }}}1
"==================================================
" here are many ways to open a new buffer with no name, the simplest of which is :new. {{{1
:new " will create a split window with an unnamed buffer.
:enew " will open one in the current window.
:vnew " will open one in a vertically split window.
:tabnew " will open one in a new tab.
" }}}1
"==================================================
" GUI settings {{{1
" Maximize GUI window (requires external dll) {{{2
  autocmd GUIEnter * set vb t_vb= lines=40 columns=103 linespace=0
          \ | call libcallnr('maximize', 'Maximize', 1)
" ========================================
" Guioptions example {{{2
if has("win32")
    set guioptions=   " disable all UI options
    set guioptions-=e " Disable fancy tabline (repositions vim on tab in Win32)
    set guioptions-=L " Disable left scrollbar (repositions vim on vsplit in Win32)
endif
" }}}1
"==================================================
" GUI & Terminal settings {{{
if s:is_gui
  if has("gui_macvim")
    set guifont=Consolas:h15
  " Win GUI settings {{{2
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cRUSSIAN
    " Меню выбора кодировки текста (utf8, cp1251, koi8-r, cp866)
    menu Кодировка.utf-8 :e ++enc=utf8<CR>
    menu Кодировка.windows-1251 :e ++enc=cp1251<CR>
    menu Кодировка.utf-16le :e ++enc=utf-16le<CR>
    menu Кодировка.cp866 :e ++enc=cp866<CR>
    menu Кодировка.koi8-r :e ++enc=koi8-r<CR>
    execute 'colorscheme '.s:cs_wingui
  endif " }}}2
  " echom "^General GUI block^" {{{2
  set guioptions+=c       " Use console dialogs
  set guioptions-=e       " Disable fancy tabline (repositions vim on tab in Win32)
  set guioptions-=L       " Disable left scrollbar (repositions vim on vsplit in Win32)
  set guioptions-=T       " No toolbar
  set guicursor+=a:blinkon0 " disable blinking cursor
  set noshowmode
  set ballooneval
  autocmd GUIEnter * set vb t_vb= lines=40 columns=103 linespace=0
  " }}}2
else
  " terminal stuff {{{2
  " i commented most of this shit
  " because it fucks up windows console badly
  " and also cursor stop showing up in conemu/cmder
  " while spf-13 config has no this kind of problems in cmder and zsh
  " Surprise! Surprise! echom makes cursor invisible in conemu!
  " echom "*2* >> This is not a GUI"
  " set noerrorbells novisualbell t_vb=
  " above doesn't work for some reason, below version is ok in most terminals
  set vb t_vb=
  if s:is_nvim
    execute 'colorscheme '.s:cs_nvim
  endif
  " after [not nvim] if, everything below is being executed on windows
  " if !s:is_nvim
  "   echom "*3* >> &if not nvim, set term to xterm&"
  "   set term=xterm
  " endif
  " if &term == 'xterm' || &term == 'screen'
  "   echom "*4* >> if xterm, set 256 colors*"
  "   echom "Enable 256 colors to stop the CSApprox warning and make xterm vim shine"
  "   set t_Co=256
  "   execute 'colorscheme '.s:cs_xterm
  " endif
  " if has('termguicolors')
  " " for some reason it shows wrong colors in conemu
  "   set termguicolors
  " endif
  " set t_ut= " setting for looking properly in tmux
  " " it's the same as 'set t_Co=256'?
  " " let &t_Co = 256
  " echom "(here should be let t_Co=256)"
  " if s:is_windows
  "   " trick to support 256 colors and scroll in conemu
  "   " for some reason it makes vim's cursor invisible in conemu/cmdr
  "   " this is fucking strange because almost the same block below works ok
  "   echom "#Win Terminal - badwolf#"
  "   let &t_AF="\e[38;5;%dm"
  "   let &t_AB="\e[48;5;%dm"
  "   inoremap <esc>[62~ <c-x><c-e>
  "   inoremap <esc>[63~ <c-x><c-y>
  "   nnoremap <esc>[62~ 3<c-e>
  "   nnoremap <esc>[63~ 3<c-y>
  "   execute 'colorscheme '.s:cs_cmder
  " endif
  " }
  " ConEmu terminal settings {{{2
  if s:is_conemu
    " it's already set above
    " set vb t_vb=
    set term=xterm
    set termencoding=utf8
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    execute 'colorscheme '.s:cs_cmder
  endif
  " }}}2
endif

"}}}
" ConEmu terminal settings {{{
" really working!
if !empty($CONEMUBUILD) && !has('gui_running')
  set vb t_vb=
  set term=xterm
  set termencoding=utf8
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  execute 'colorscheme '.s:cs_cmder
endif
" }}}
"==================================================
" Clear all registers command @ romainl: {{{
" https://stackoverflow.com/questions/19430200/how-to-clear-vim-registers-effectively
let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"' | let i=0 | while (i<strlen(regs)) | exec 'let @'.regs[i].'=""' | let i=i+1 | endwhile | unlet regs
" It is possible to set a value for each used register, similar to romainl's approach:
function! ClearRegisters()
   redir => l:register_out
   silent register
   redir end
   let l:register_list = split(l:register_out, '\n')
   call remove(l:register_list, 0) " remove header (-- Registers --)
   call map(l:register_list, "substitute(v:val, '^.\\(.\\).*', '\\1', '')")
   call filter(l:register_list, 'v:val !~ "[%#=.:]"') " skip readonly registers
   for elem in l:register_list
      execute 'let @'.elem.'= ""'
   endfor
endfunction "}}}
" another version 0 upvotes though by Luc Hermitte {{{
" Since that venerable answer on the mailing list, linked by @romainl, we have
" setreg('a', []) that clears the register.
" Thus, the code could become:
let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor
"}}}
"==================================================
" Mappings: backup {{{

set pastetoggle=<F12>        " pastetoggle (sane indentation on pastes)

" Fast bracketing
inoremap {{ {<CR>}<ESC>kA| "}} because it's parsed as foldmarker :\

" Handy line split: before and after cursor v.2.0
nnoremap <silent> <leader>h i<CR><ESC>
nnoremap <silent> <leader>l a<CR><Esc>k$
nnoremap <M-h> m`i<CR><ESC>``
nnoremap <M-l> m`a<CR><ESC>``
" Sneaky new line (and linesplit v.1.0)
nnoremap <silent> <leader><CR> i<CR><ESC>
nnoremap <silent> <leader>j a<CR><Esc>k$
nnoremap <silent> <leader>o m`o<ESC>``
nnoremap <silent> <leader>O m`O<ESC>``
nnoremap <silent> <C-CR> m`o<ESC>``
nnoremap <silent> <S-CR> m`O<ESC>``
" Improved version
" Sneaky new line V.2.0
nnoremap <silent> <M-j> m`o<ESC>``
nnoremap <silent> <M-k> m`O<ESC>``
" Guard maps if Alt won't work
nnoremap <silent> <leader>j m`o<ESC>``
nnoremap <silent> <leader>k m`O<ESC>``

" language switching
cmap <silent> <leader>6 <C-^>
nmap <M-s> a<C-^><Esc>

" https://konfekt.github.io/blog/2016/10/03/get-the-leader-right
" Actually they cause some inconsistencies, for example
" there's a need to remap commands that rely on : key
" from Konfekt's leader key post
nnoremap : ,
nnoremap , :
" }}}
"==================================================
" vim-plug bootstrap {{{1
" 1). For neovim: {{{2
let s:plugins = filereadable(expand($HOME . '/.config/nvim/autoload/plug.vim', 1))
if !s:plugins
  silent call mkdir(expand($HOME . '/.config/nvim/autoload', 1), 'p')
  exe '!curl -fLo '.expand($HOME . '/.config/nvim/autoload/plug.vim', 1)
        \ .' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" 2). From vim-plug wiki: {{{2
if empty(glob($HOMEDIR . '/autoload/plug.vim'))
  silent !curl -fLo $HOMEDIR/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" 3). From reddit (?) {{{2
" if empty(glob('~/.vim/autoload/plug.vim'))
if empty(glob(g:homedir.'/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif "}}}2
" }}}1
" ========================================
" ack.vim settings {{{
if executable('ag')
  Plug 'mileszs/ack.vim', {'on' :'Ack'}
  let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  Plug 'mileszs/ack.vim', {'on' :'Ack'}
elseif executable('ack')
  Plug 'mileszs/ack.vim', {'on' :'Ack'}
endif
" }}}
" ========================================
" http://freneticarray.com/quick-compile-in-vim/ {{{
function! MakeIfAvailable()  
if filereadable("./makefile")
    make
elseif (&filetype == "cpp")
    execute("!clang++ -std=c++14" + bufname("%"))
    execute("!./a.out")
elseif (&filetype == "c")
    execute("!clang -std=c11" + bufname("%"))
    execute("!./a.out")
elseif (&filetype == "tex")
    execute("!xelatex" + bufname("%"))
    execute("!open" + expand(%:r) + ".pdf")
endif
endfunction
augroup spaces
    autocmd!
    autocmd FileType c nnoremap <leader>r :call MakeIfAvailable()<cr>
    autocmd FileType cpp nnoremap <leader>r :call MakeIfAvailable()<cr>
    autocmd FileType tex nnoremap <leader>r :call MakeIfAvailable()<cr>
    autocmd FileType python nnoremap <leader>r :exec '!python' shellescape(@%, 1)<cr>
    autocmd FileType perl nnoremap <leader>r :exec '!perl' shellescape(@%, 1)<cr>
    autocmd FileType sh nnoremap <leader>r :exec '!bash' shellescape(@%, 1)<cr>
    autocmd FileType swift nnoremap <leader>r :exec '!swift' shellescape(@%, 1)<cr>
    nnoremap <leader>R :!<Up><CR>
augroup END  "}}}
" ========================================
" echo highligting groups {{{
nnoremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" ========================================
" Substitute {{{
nnoremap <c-s> :s/
nnoremap <M-s> :%s/
vnoremap <c-s> :s/
" 1}}} "
" ========================================
" compile LESS
nnoremap <Leader>mm :w <BAR> !lessc % > %:t:r.css<CR><space>
" ========================================
" Easier formatting
nnoremap <silent> <leader>q gwip
" ========================================
" consistent menu navigation
" https://github.com/jasonlong/dotfiles/blob/master/vimrc
" ========================================
" open previous buffer and kill next {{{
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>
" and shorter alternative (requires at least 2 buffers)
nnoremap <leader>Q :b#<bar>bd#<cr>
" }}}
" ========================================
" from Konfekt's leader key post {{{
" not as useful as emacs binding as it appears
nnoremap : ,
nnoremap , :
" }}}
" ========================================