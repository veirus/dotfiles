" vimtest3 config | last edit: 2016-10-15

" Be Improved, mapleader, OS detect, clipboard, rtp and encoding {{{
set nocompatible
set encoding=utf-8
let mapleader    = "\<space>"
let s:is_windows = has('win32') || has('win64')
let s:is_wingui  = has("gui_win32")
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')
let s:is_nvim    = has('nvim')
let s:is_nyaovim = exists('g:nyaovim_version')
let s:is_gui     = has('gui_running')
let s:is_conemu  = !empty($CONEMUBUILD)
let $HOMEDIR     = expand('$HOME/dotfiles')
" let $HOMEDIR     = expand('$VIM/vimfiles')    | " portability shim
set rtp^=$HOMEDIR
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
set undodir=~/.vim/undo
if has('clipboard')
  if has('unnamedplus')         " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else                          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif
" }}}

" Plugin Install {{{
call plug#begin($HOMEDIR.'/plugged/')
" == Already in pack/start dir: == {{{2
" Plug 'KabbAmine/gulp-vim'
" Plug 'digitaltoad/vim-pug', {'for': ['jade','pug']}
" Plug 'justinmk/vim-dirvish' "doesn't work with autochdir
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-surround'
"Plug 'mattn/emmet-vim', {'for': ['html','smarty','pug','php','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','handlebars']} "{{{3
"" let g:user_emmet_install_global = 0
"" autocmd FileType html,css,less EmmetInstall
"" let g:user_emmet_leader_key='<M-,>'
"" let g:user_emmet_settings = {
""  'php' : {
""   \        'extends' : 'html',
""   \        'filters' : 'html,c',
""  },
"" }
"  function! s:zen_html_tab()
"    if !emmet#isExpandable()
"      return "\<plug>(emmet-move-next)"
"    endif
"    return "\<plug>(emmet-expand-abbr)"
"  endfunction
"  autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
"  autocmd FileType html,css,sass,less,scss imap <buffer><expr><tab> <sid>zen_html_tab()
""}}}3

" == Necessity == {{{2
Plug 'matchit.zip' "{{{3
  let b:match_ignorecase = 1

Plug 'mhinz/vim-startify' "{{{3
 nnoremap <F1> :Startify<CR>
 let g:startify_list_order = ['sessions', 'files']
 let g:startify_session_autoload = 1
 let g:startify_session_persistence = 1
 let g:startify_session_delete_buffers = 1
 "}}}3
Plug 'luochen1990/rainbow' "{{{3
  if isdirectory($HOMEDIR."/plugged/rainbow/")
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
  endif "}}}3
" Ag {{{3
Plug 'rking/ag.vim', {'on' :'Ag'} " trying this one instead of all that
" if executable('ag')
"   Plug 'mileszs/ack.vim', {'on' :'Ack'}
"   let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
" elseif executable('ack-grep')
"   let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"   Plug 'mileszs/ack.vim', {'on' :'Ack'}
" elseif executable('ack')
"   Plug 'mileszs/ack.vim', {'on' :'Ack'}
" endif
"}}}3
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'irrationalistic/vim-tasks' " ST's PlainTasks compatible!

" == Colorschemes == {{{2
" Plug 'chriskempson/base16-vim'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'
Plug 'jacoborus/tender'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'KabbAmine/yowish.vim'
Plug 'zeis/vim-kolor'
"{{{3 kolor settings
   let g:kolor_underlined=1
"}}}3
Plug 'vim-scripts/ScrollColors', { 'on': 'SCROLLCOLOR' }
Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
let s:cs_wingui='molokai'
let s:cs_xterm='jellybeans'
let s:cs_nvim='molokai'
let s:cs_cmder='badwolf'

" == new stuff == {{{2
Plug 'skywind3000/asyncrun.vim'
Plug 'konfekt/fastfold'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'osyo-manga/vim-over', {'on':'OverCommandLine'}
Plug 'mbbill/fencview', {'on' : 'FencAutoDetect'}

Plug 'nathanaelkane/vim-indent-guides' "{{{3
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_color_change_percent=3
  if !has('gui_running')
    let g:indent_guides_auto_colors=0
    function! s:indent_set_console_colors()
      hi IndentGuidesOdd ctermbg=235
      hi IndentGuidesEven ctermbg=236
    endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
  endif
" }}}3

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } "{{{3
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  xmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap <Leader>a <Plug>(EasyAlign)
" }}}3

Plug 'tpope/vim-markdown', {'for': ['markdown', 'md', 'mdown', 'mkd', 'mkdn']}
Plug 'elzr/vim-json', { 'for': ['json', 'javascript', 'js', 'html'] }
  let g:vim_json_syntax_conceal = 0

" == < webdev \> == {{{2
Plug 'hail2u/vim-css3-syntax', {'for': ['css','html','scss','sass']}
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'html'] }
Plug 'gorodinskiy/vim-coloresque', {'for': ['html', 'css', 'less', 'php']} " *^* This
" Plug 'ap/vim-css-color', {'for': ['html', 'css', 'less', 'php']} " Trying *^* instead of this colorizer
" == Nyaovim == {{{2
if s:is_nyaovim
    " echom "nyaovim version: ".g:nyaovim_version
    Plug 'rhysd/nyaovim-popup-tooltip'
    Plug 'rhysd/nyaovim-markdown-preview', {'for': 'markdown'}
    Plug 'rhysd/nyaovim-mini-browser'
    " Plug 'rhysd/nyaovim-running-gopher'
    " Plug 'rhysd/nyaovim-tree-view'
    Plug 'MaxMEllon/nyaovim-nicolive-comment-viewer', {'do': 'npm install -g nicolive@0.0.4'}
endif
"}}}2
call plug#end() " required }}}

" General {{{
" Список кодировок для автоматического определения, в порядке предпочтения
" взято с http://jenyay.net/Programming/Vim
set fileencodings=utf-8,cp1251,utf-16le,cp866,koi8r,ucs-2le
if &termencoding == ""
  let &termencoding = &encoding
else
  set termencoding=utf-8                      " set terminal encoding
endif
set fileencoding=utf-8                      " set save encoding
scriptencoding utf-8
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
set keymap=russian-jcukenwin
set iminsert=0                  " раскладка по умолчанию для ввода - английская
set imsearch=0                  " раскладка по умолчанию для поиска - английская

set ssop-=options         " do not store global and local values in a session
filetype plugin indent on " Automatically detect file types.
set autochdir             " Автопереключение рабочей папки.
set hidden                " Allow buffer switching without saving
set nobackup              " Отключить создание файлов бекапа
set nowritebackup
set noswapfile            " и свапа
set history=100
"}}}

" Formatting {{{
  set nowrap
  set textwidth=0                " Don't automatically insert linebreaks
  set formatoptions-=t           " don't automatically wrap text when typing
  set autoindent
  set shiftround
  set linebreak
  let &showbreak='↪ '
  set tabstop=4                  " размер табов
  set softtabstop=4
  set shiftwidth=4               " размер отступов
  set smarttab
  set noexpandtab
  " set expandtab
  set nojoinspaces               " Prevents inserting two spaces after punctuation on a join (J)
  set backspace=indent,eol,start " Backspace for dummies
" }}}

" UI {{{1
" New Optimized Statusline {{{2
" Modelist {{{3
let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '' : 'S·Block ',
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

" Automatically change the statusline color depending on mode {{{3
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

" Find out current buffer's size and output it. {{{3
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

" Readonly {{{3
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

" Static hilight doesn't work? {{{3
" hi User1 ctermfg=007 guifg=#ffdad8  guibg=#880c0e
" hi User2 ctermfg=008 guifg=#292b00  guibg=#f4f597
" hi User3 ctermfg=008 guifg=#112605  guibg=#aefe7B
" hi User4 ctermfg=008 guifg=#051d00  guibg=#7dcc7d
" hi User5 ctermfg=008 guifg=#ffffff  guibg=#880c0e gui=bold
" hi User7 ctermfg=008 guifg=RoyalBlue2  guibg=RoyalBlue2
" hi User8 ctermfg=008 guifg=#ffffff  guibg=#810085
" hi User9 ctermfg=007 guifg=#ffffff  guibg=#094afe

" Only for Dracula colorscheme: {{{3
if exists('g:colors_name') && g:colors_name ==# 'dracula'
" hi! link FoldColumn User8
  hi FoldColumn term=standout ctermfg=61 ctermbg=235 guifg=#6272a4 guibg=#282a36 gui=None
endif

" Statusline {{{3
" Powerline symbols quick ref: , , , , , , 
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%0*\ %n
set statusline+=\ %8*\ %<%F\ %{ReadOnly()}
set statusline+=\ %0*%=                                  " Space
set statusline+=\ %8*%k%m%r%w
set statusline+=%0*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%0*\ %{(&fenc!=#'utf-8'?&fenc:'')}
set statusline+=%{&ff!=#'unix'?'['.&ff.']':''}           " Encoding & Fileformat
set statusline+=\ %0*col:%3c
set statusline+=\ %2*\ :%4l/%L\ %0*
set statusline+=\ %2p%%\ %*
" ========================================
"display a warning if &et is wrong, or we have mixed-indenting {{{3
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*
" }}}2

set laststatus=2
" execute "set colorcolumn=".join(range(80,335), ',')|   "Discolor every column past column 80
set colorcolumn=+1
" already set below in GUI block
" set vb t_vb=                                   " Turn off blinking and sounds
set noeb
set lazyredraw
set scrolloff=3                                " Minimum lines to keep above and below cursor
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set shortmess+=amroOtT                           " a doesn't add m and r despite what docs says
" set shortmess+=filmnrxoOtT                     " Abbrev. of messages (avoids 'hit enter')
set cursorline
" set linespace=0                                " No extra spaces between rows
set number                                     " Line numbers on
set relativenumber
set numberwidth=5
set showmatch                                  " Show matching brackets/parenthesis
set matchtime=2                                " tens of a second to show matching parentheses
set incsearch                                  " Find as you type search
set hlsearch                                   " Highlight search terms
set winminheight=0                             " Windows can be 0 line high
set ignorecase                                 " Case insensitive search
set smartcase                                  " Case sensitive when uc present
set wildmenu                                   " Show list instead of just completing
set wildmode=list:longest,full                 " Command <Tab> completion, list matches, then longest common part, then all.
" set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set foldenable                                 " Auto fold code
set foldcolumn=2
" set foldopen=all                             " Автооткрытие сверток при заходе в них
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:⋅ " Highlight problematic whitespace
" set listchars=tab:▷⋅,trail:⋅,nbsp:⋅          " Alternative settings

set splitright                                 " Puts new vsplit windows to the right of the current
set splitbelow                                 " Puts new split windows to the bottom of the current

syntax on                                      " must be before colorscheme!
" /UI }}}1

" GUI & Terminal settings {{{
if s:is_gui
  if s:is_macvim
    set guifont=Consolas:h15
  " Win GUI settings {{{
  elseif s:is_wingui
    set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cRUSSIAN
    " Меню выбора кодировки текста (utf8, cp1251, koi8-r, cp866)
    menu Кодировка.utf-8 :e ++enc=utf8<CR>
    menu Кодировка.windows-1251 :e ++enc=cp1251<CR>
    menu Кодировка.utf-16le :e ++enc=utf-16le<CR>
    menu Кодировка.cp866 :e ++enc=cp866<CR>
    menu Кодировка.koi8-r :e ++enc=koi8-r<CR>
    execute 'colorscheme '.s:cs_wingui
  endif " }}}
  " echom "^General GUI block^" {{{
  " currently is go=gmtch
  if s:is_conemu
    set guioptions+=h
    set guioptions-=b
    set guioptions-=r
    set guioptions-=R
  endif
  set guioptions+=c       " Use console dialogs
  set guioptions-=e       " Disable fancy tabline (repositions vim on tab in Win32)
  set guioptions-=L       " Disable left scrollbar (repositions vim on vsplit in Win32)
  set guioptions-=T       " No toolbar
  set noshowmode
  set ballooneval
  autocmd GUIEnter * set vb t_vb= lines=40 columns=103 linespace=0
  " }}}
else
  set vb t_vb=
  set ttimeout
  set ttimeoutlen=100
  " neovim {{{
  if s:is_nvim
    let s:editor_root=expand("~/AppData/Local/nvim")
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
    if exists('g:GuiFont')

      " WTF?! Doesn't work?
      " let g:Guifont="DejaVu Sans Mono for Powerline:h13"

      " Works and even looks nice, however reports bad fixed pitch metrics
      " Also it's risky to install patched version on Windows
      " GuiFont Consolas:h12

      " Warning: bad fixed pitch metrics?!
      " GuiFont Anonymice Powerline:h12

      "is not fixed pitch font?!
      " GuiFont Arimo for Powerline:h12

      " is not fixed pitch font?!
      " GuiFont DejaVu Sans Mono for Powerline:h13

      " Sluggish unaliased look
      " GuiFont Droid Sans Mono for Powerline:h12

      " Sluggish unaliased look
      " GuiFont Fira Mono Medium for Powerline:h12

      " is not fixed pitch font?!
      " GuiFont Literation Mono Powerline:h12

      " A little better look than Droid Sans and Fira
      GuiFont monofur for Powerline:h14

      " is not fixed pitch font?!
      " GuiFont Roboto Mono for Powerline:h13

      " is not fixed pitch font?!
      " GuiFont Tinos for Powerline:h12

      " Unknown font
      " GuiFont Ubuntu Mono derivative Powerline:h12
    endif
    execute 'colorscheme '.s:cs_nvim
  endif " }}}

  " ConEmu terminal settings {{{
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
  " }}}
  " Disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  if &term =~ '256color'
    set t_ut=
  endif
endif

"}}}

" Functions {{{

" Shell command @ spf-13 {{{2
  function! s:RunShellCommand(cmdline)
      botright new

      setlocal buftype=nofile
      setlocal bufhidden=delete
      setlocal nobuflisted
      setlocal noswapfile
      setlocal nowrap
      setlocal filetype=shell
      setlocal syntax=shell

      call setline(1, a:cmdline)
      call setline(2, substitute(a:cmdline, '.', '=', 'g'))
      execute 'silent $read !' . escape(a:cmdline, '%#')
      setlocal nomodifiable
      1
  endfunction

  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }}}
" Cycle through relativenumber + number, number (only), and no numbering. {{{
" @ wincent aka Greg Hurrell
function! Cycle_numbering() abort
    if exists('+relativenumber')
        execute {
                    \ '00': 'set relativenumber   | set number',
                    \ '01': 'set norelativenumber | set number',
                    \ '10': 'set norelativenumber | set nonumber',
                    \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
    else
        " No relative numbering, just toggle numbers on and off.
        set number!<CR>
    endif
endfunction " }}}
"return '[&et]' if &et is set wrong {{{
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine @ Martin Grefnel
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indent]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction " }}}
"return '[\s]' if trailing white space is detected {{{
"return '' otherwise @ Martin Grefnel
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction " }}}
" Preserve by Jonathan Palardy {{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" }}}
" Window Killer @ bling {{{
function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

    " never bdelete a nerd tree
    if matchstr(expand("%"), 'nerd') == 'nerd'
        wincmd c
        return
    endif

    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction " }}}
" New Python Buffer Autofill @ jenay.net {{{
function! BufNewFile_PY()
    0put = '#!/usr/bin/env python3'
    1put = '#-*- coding: utf-8 -*-'
    $put = ''
    normal G
endfunction " }}}
function! SkeletonPY() "{{{
  exe '0r $HOME\vimfiles\skeleton.py | norm 2j'
endfunction "}}}
" Current Buffer Indicator @ VimBuddy {{{
function! CurBufIndicator(sym)
  if !exists('g:actual_curbuf')
    let g:actual_curbuf = bufnr("%")
  endif
  if g:actual_curbuf != bufnr("%")
    " Not my buffer, sleeping
    return ""
  else
    return a:sym
  endif
endfunction
" }}}
" Statusline colorize {{{
function! ColorStatusline() abort
  hi User1 ctermfg=231 ctermbg=57 guifg=#FFFFFF guibg=#483D8B gui=bold
  hi User2 term=None ctermfg=231 ctermbg=62 guifg=#cccccc guibg=#6A5ACD gui=None
  hi User3 ctermfg=16 ctermbg=99 guifg=#cccccc guibg=#7B68EE gui=None
  hi User4 term=bold,reverse cterm=bold ctermfg=231 ctermbg=236 gui=bold guifg=#f8f8f2 guibg=#64666d
  hi User5 ctermfg=15 ctermbg=8 guifg=#666666 guibg=#282a36
  hi User6 term=standout ctermfg=246 ctermbg=235 guifg=#909194 guibg=#44475a
  hi User7 term=standout ctermfg=57 ctermbg=62 guifg=#483D8B guibg=#6A5ACD
  hi User8 ctermfg=235 guifg=#483D8B
  " hi! link FoldColumn User8
  " Only for Dracula colorscheme:
  " if exists('g:colors_name') && g:colors_name ==# 'dracula'
  "   hi FoldColumn term=standout ctermfg=61 ctermbg=235 guifg=#6272a4 guibg=#282a36
  " endif
endfunction " }}}
" Statusline insert mode indication {{{
function! InsertModeStatusline(insert) abort
  if a:insert == 0
    hi User1 ctermfg=231 ctermbg=57 guifg=#FFFFFF guibg=#483D8B gui=bold
    hi User7 term=standout ctermfg=57 ctermbg=62 guifg=#483D8B guibg=#6A5ACD
  else
    hi User1 term=reverse ctermbg=5 guifg=black guibg=lavender guisp=Magenta
    hi User7 term=reverse ctermfg=5 ctermbg=62 guifg=lavender guisp=Magenta
  endif
endfunction " }}}
" Decolorize the statusline {{{
function! DeColorStatusline() abort
    hi User1 term=bold,reverse cterm=bold ctermfg=231 ctermbg=236 gui=bold guifg=#f8f8f2 guibg=#64666d
    hi User2 ctermfg=15 ctermbg=8 guifg=#666666 guibg=#282a36
    hi User3 term=standout ctermfg=246 ctermbg=235 guifg=#909194 guibg=#44475a
    hi User7 term=standout ctermfg=236 ctermbg=8 guifg=#64666D guibg=#282a36
endfunction " }}}

" }}}

" Autocommands {{{
" --- Vim ---
" autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- php ---
autocmd FileType smarty,tpl setlocal commentstring=<!--\ %s\ -->

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Relative numbers in the active window {{{
augroup active_relative_number
    autocmd!
    autocmd WinEnter * :setlocal number relativenumber
    autocmd WinLeave * :setlocal norelativenumber
augroup END
" }}}
" Focus~ cursorline in the active window {{{
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter,FocusGained * :setlocal cursorline
    autocmd WinLeave,FocusLost  * :setlocal nocursorline
augroup END
" }}}
" Focus~ Statusline {{{
" augroup focus_statusline
"     autocmd!
"     autocmd BufEnter,FocusGained,VimEnter,WinEnter * call ColorStatusline()
"     autocmd BufLeave,FocusLost,WinLeave * call DeColorStatusline()
" augroup END
"}}}
" Insert mode statusline indication (from vimwiki) {{{
" augroup statusline_mode
"   autocmd!
"   autocmd InsertEnter * call InsertModeStatusline(1)
"   autocmd InsertLeave * call InsertModeStatusline(0)
" augroup END " }}}
" Autosource for _vimrc {{{
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost _vimrc,init.vim nested source $MYVIMRC
    " Alternative, not working very well, so disabled:
    " autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
    " autocmd bufwritepost $HOME/_vimrc execute "normal! :source ~/_vimrc"
augroup END " }}}
augroup Python " {{{
    autocmd!
    " autocmd BufNewFile *.py call BufNewFile_PY()
    autocmd BufNewFile *.py call SkeletonPY()
    autocmd BufNewFile *.pyw call SkeletonPY()
    "Перед сохранением вырезаем пробелы на концах (только в .py файлах)
    autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
                \ formatoptions+=croq softtabstop=4 smartindent
    "В .py файлах включаем умные отступы после ключевых слов
    autocmd BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python let python_highlight_all = 1
    autocmd FileType python nnoremap <buffer> <Leader><F7> :!python %<CR>
    autocmd FileType python nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<CR>
augroup END " }}}
" }}}

" Commands {{{1
" >>> Conversion between TABS ans SPACES {{{2
command! Respace :setlocal expandtab | %retab!
command! Retab :setlocal noexpandtab | %retab!
" }}}1

" Mappings {{{1
" General leader maps
nnoremap <leader>w :w<cr>
nnoremap <leader>l :set list! list?<cr>
nnoremap <silent> <leader>r :call Cycle_numbering()<CR>
" nnoremap <leader><F5> :wa<cr> :mksession! ~/vimtest3/lsession.vim<cr>
" nnoremap <leader><F9> :so ~/vimtest3/lsession.vim<cr> :echo '* Session restored! *'<cr>
nnoremap <leader><F11> :so $MYVIMRC<CR> :echo "* .vimrc loaded *"<CR>
nnoremap <Leader><F12> :vsp $MYVIMRC<CR>
" compile LESS
nnoremap <Leader>mm :w <BAR> !lessc % > %:t:r.css<CR><space>
" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" fast copy-paste | do i really need it? #2016-07-21
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

" <F#> keys:
nnoremap <F4> :set hlsearch! hlsearch?<cr>

" toggle paste
map <F12> :set invpaste<CR>:set paste?<CR>

" -- Hacks --
" https://sts10.github.io/blog/2016/02/16/one-solution-to-a-problem-with-vims-gx-command/
nnoremap <silent> gx :normal viugx<CR><CR>
" sane regex {{{
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v
"}}}
" visual paste without losing the copied content
" xnoremap p "0p
" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
" Word-wrap toggle
nmap <F6> :setl wrap!<bar>:set wrap?<CR>
imap <F6> <C-O><F6>

" Sneaky new line
nmap <M-m> O<Esc>j
nmap <C-m> o<Esc>k
nnoremap <M-j> a<CR><Esc>k$

" Fast bracketing
" inoremap {{ {<CR>}<ESC>kA| "}} because it's parsed as foldmarker :\

" Insert date on <F3> and <S-F3> {{{
nnoremap <F3> i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
inoremap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
vnoremap <F3> di<C-R>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <S-F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <S-F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
vnoremap <S-F3> di<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" }}}

" window killer
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

" shortcuts for windows {{{
nnoremap <leader>= <C-w>=
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>vsa :vert sba<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><leader> <C-^>
" nnoremap <C-TAB> <C-^>
"}}}

" shortcuts for tabs
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" buffer scroll
nnoremap <M-h> :bprev<CR>
nnoremap <M-l> :bnext<CR>

" quick buffer open
nnoremap gb :ls<cr>:e #
nnoremap <leader>b :ls<CR>:b<space>

" formatting shortcuts
" nmap <leader>f4 :call StripTrailingWhitespace()<CR>
nmap <leader>f4 :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
vmap <leader>s :sort<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Easier horizontal scrolling
map zl zL
map zh zH

" -- Unused -- {{{
" Easier formatting
" nnoremap <silent> <leader>q gwip

" smash escape
" inoremap ,, <esc>
" }}}

" change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
" easy paste
inoremap <C-q> <C-r><C-p>+

" folds {{{
nnoremap zr zr:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zm zm:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zR zR:echo 'foldlevel: ' . &foldlevel<cr>
nnoremap zM zM:echo 'foldlevel: ' . &foldlevel<cr>
" }}}

" screen line scroll - very useful with wrap on
nnoremap <silent> j gj
nnoremap <silent> k gk

" auto center {{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz
"}}}

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" reselect last paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" language switching
" cmap <silent> <leader>6 <C-^>
" nmap <M-s> a<C-^><Esc>
nmap <C-Space> a<C-^><Esc>
vmap <silent> <C-Space> <Esc>a<C-^><Esc>gv
" }}}1

" vim: set sw=2 ts=4 sts=2 et tw=80 foldlevel=0 foldmethod=marker:
