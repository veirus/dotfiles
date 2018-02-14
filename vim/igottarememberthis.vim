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
if has('vim_starting')
  " TODO: write something you want execute only on vim startup
endif
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

" New Python Buffer Autofill @ jenay.net {{{2
function! cw#BufNewFile_PY()
  0put = '#!/usr/bin/env python3'
  1put = '#-*- coding: utf-8 -*-'
  $put = ''
  normal G
endfunction " }}}2

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
nnoremap <silent> <leader>fq :call cw#Preserve("normal gwip")<CR>
" ========================================
" Meta keys test {{{1
" works in terminal:
map <M-F5> :echo 'whoa f5'<cr>
" ==============================
" doesn't work in terminal:
map <silent> <M-1> :echo 'whoa1'<cr>
map <M-`> :echo 'cool!'<cr>
map <M-space> :echo 'lol i can map it'<cr>
nnoremap <C-@> :echo 'heyheyhey'<cr>
map <C-k5> :echo 'yup:c5'<cr>
" =============== }}}1
" ========================================
" Browse current dir
" ( Actually pretty useful, but i'm currently on dirvish )
nnoremap <silent> <F11> :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>
" ========================================
" buffer killer: open next and kill previous {{{1
nnoremap <leader>q :bn<bar>sp<bar>bp<bar>bd<cr>
" much simpler version than above (requires at least 2 buffers)
nnoremap <leader>q :b#\|bd#<CR>
" also can be written like this:
nnoremap <leader>Q :b#<bar>bd#<cr>
" }}}1
" ========================================
" consistent menu navigation
" https://github.com/jasonlong/dotfiles/blob/master/vimrc
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
" ========================================
" open previous buffer and kill next {{{
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>
" and shorter alternative (requires at least 2 buffers)
nnoremap <leader>Q :b#<bar>bd#<cr>
" }}}
" ========================================
" from Konfekt's leader key post {{{
" not as useful as "emacs" binding as it appears
nnoremap : ,
nnoremap , :
" }}}
" ========================================
" Highlighting {{{
hi User8 ctermfg=235 guifg=#483D8B guibg=#A2A3A3

" Only for Dracula colorscheme: {{{2
if exists('g:colors_name') && g:colors_name ==# 'dracula'
" hi! link FoldColumn User8
  hi FoldColumn term=standout ctermfg=61 ctermbg=235 guifg=#6272a4 guibg=#282a36 gui=None
endif
" }}}2
" }}}
" ========================================
" URL opening, uses 100500 plugins :\ {{{1
" https://sts10.github.io/blog/2016/02/16/one-solution-to-a-problem-with-vims-gx-command/
nnoremap <silent> gx :normal viugx<CR>
" }}}1
" ========================================
" matchit fix for (Jinja2 syntax plugin)[https://github.com/Glench/Vim-Jinja2-Syntax] {{{
" stolen from https://vimtalk.slack.com/archives/C1E0WNMJQ/p1488487832001029
" nvm, found it, in vim's ftplugin/html.vim, its got:
" ```
" HTML:  thanks to Johannes Zellner and Benji Fisher.
if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
                \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
                \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
                \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif
" ```
" }}}
" ========================================
" renderoptions working example {{{
if !(is.nvim)
	set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
endif
"}}}
" ========================================
" repmo.vim: {{{1
" map a motion and its reverse motion:
noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj`, you can keep that:
noremap <expr> j repmo#Key('gj', 'gk')|sunmap j
noremap <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
map <expr> ; repmo#LastKey(';')|sunmap ;
map <expr> : repmo#LastRevKey(',')|sunmap :
" orig:
" map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;` or `,`:
" noremap <expr> f repmo#ZapKey('f')|sunmap f
" noremap <expr> F repmo#ZapKey('F')|sunmap F
" noremap <expr> t repmo#ZapKey('t')|sunmap t
" noremap <expr> T repmo#ZapKey('T')|sunmap T

" repeat scroll commands:
noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')

" vim-sneak:
map  <expr> ; repmo#LastKey('<Plug>Sneak_;')|sunmap ;
map  <expr> : repmo#LastRevKey('<Plug>Sneak_,')|sunmap :

map  <expr> s repmo#ZapKey('<Plug>Sneak_s')|ounmap s|sunmap s
map  <expr> S repmo#ZapKey('<Plug>Sneak_S')|ounmap S|sunmap S
omap <expr> z repmo#ZapKey('<Plug>Sneak_s')
omap <expr> Z repmo#ZapKey('<Plug>Sneak_S')
map  <expr> f repmo#ZapKey('<Plug>Sneak_f')|sunmap f
map  <expr> F repmo#ZapKey('<Plug>Sneak_F')|sunmap F
map  <expr> t repmo#ZapKey('<Plug>Sneak_t')|sunmap t
map  <expr> T repmo#ZapKey('<Plug>Sneak_T')|sunmap T

" }}}1
" ========================================
" Probably very useful vimgrep commands {{{1
" (not on Windows though - vimgrep is *INFERNALLY* slow there)
" from http://twily.info/.vimrc#view 
" When you press gv you vimgrep after the selected text
vnoremap <silent> <leader>gv :call VisualSelection('gv', '')<CR>
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" Vimgreps in the current file
map <leader>gc :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" vimgrep my last search
nnoremap <silent> <leader>gn :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
"}}}1
" ========================================
" Highlight Word {{{
" (from Steve Losh's vimrc)
" https://bitbucket.org/sjl/dotfiles/src/1cd90a0458e45ddfcb5b8b988133bf02a29f84c7/vim/vimrc?fileviewer=file-view-default#vimrc-3091
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
	" Save our location.
	normal! mz

	" Yank the current word into the z register.
	normal! "zyiw

	" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
	let mid = 86750 + a:n

	" Clear existing matches, but don't worry if they don't exist.
	silent! call matchdelete(mid)

	" Construct a literal pattern that has to match at boundaries.
	let pat = '\V\<' . escape(@z, '\') . '\>'

	" Actually match the words.
	call matchadd("InterestingWord" . a:n, pat, 1, mid)

	" Move back to our original location.
	normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}
" }}}
" ========================================

