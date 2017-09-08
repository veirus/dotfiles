" vim: set sw=2 ts=4 sts=2 et tw=80 foldlevel=1 foldmethod=marker:
" Functions
" Shell command @ spf-13 {{{2
function! cw#RunShellCommand(cmdline)
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
" }}}2
" Cycle through relativenumber + number, number (only), and no numbering. {{{2
" @ wincent aka Greg Hurrell
function! cw#Cycle_numbering() abort
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
endfunction " }}}2
"return '[&et]' if &et is set wrong {{{2
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine @ Martin Grefnel
function! cw#StatuslineTabWarning()
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
endfunction " }}}2
"return '[\s]' if trailing white space is detected {{{2
"return '' otherwise @ Martin Grefnel
function! cw#StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction " }}}2
" Preserve by Jonathan Palardy {{{2
function! cw#Preserve(command)
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
" }}}2
" Window Killer @ bling {{{2
function! cw#CloseWindowOrKillBuffer()
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
endfunction " }}}2
" New Python Buffer Autofill @ jenay.net {{{2
function! cw#BufNewFile_PY()
  0put = '#!/usr/bin/env python3'
  1put = '#-*- coding: utf-8 -*-'
  $put = ''
  normal G
endfunction " }}}2
" Python Autofill using Template File {{{2
function! cw#SkeletonPY()
  exe '0r $HOME\vimfiles\tpl\skeleton.py | norm 2j'
endfunction "}}}2
" Current Buffer Indicator @ VimBuddy {{{2
function! cw#CurBufIndicator(sym)
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
" }}}2
" Statusline colorize {{{2
function! cw#ColorStatusline() abort
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
endfunction " }}}2
" Statusline insert mode indication {{{2
function! cw#InsertModeStatusline(insert) abort
  if a:insert == 0
    hi User1 ctermfg=231 ctermbg=57 guifg=#FFFFFF guibg=#483D8B gui=bold
    hi User7 term=standout ctermfg=57 ctermbg=62 guifg=#483D8B guibg=#6A5ACD
  else
    hi User1 term=reverse ctermbg=5 guifg=black guibg=lavender guisp=Magenta
    hi User7 term=reverse ctermfg=5 ctermbg=62 guifg=lavender guisp=Magenta
  endif
endfunction " }}}2
" Decolorize the statusline {{{2
function! cw#DeColorStatusline() abort
  hi User1 term=bold,reverse cterm=bold ctermfg=231 ctermbg=236 gui=bold guifg=#f8f8f2 guibg=#64666d
  hi User2 ctermfg=15 ctermbg=8 guifg=#666666 guibg=#282a36
  hi User3 term=standout ctermfg=246 ctermbg=235 guifg=#909194 guibg=#44475a
  hi User7 term=standout ctermfg=236 ctermbg=8 guifg=#64666D guibg=#282a36
endfunction " }}}2
" Simple re-format for minified Javascript {{{2
" https://coderwall.com/p/lxajqq/vim-function-to-unminify-javascript
function! cw#UnMinify()
  %s/{\ze[^\r\n]/{\r/g
  %s/){/) {/g
  %s/};\?\ze[^\r\n]/\0\r/g
  %s/;\ze[^\r\n]/;\r/g
  %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
  normal ggVG=
endfunction
" }}}2
" Clear registers {{{2
" https://stackoverflow.com/questions/19430200/how-to-clear-vim-registers-effectively
function! cw#ClearRegisters()
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
endfunction "}}}2
" make list-like commands more intuitive {{{2
" by Romain Lafurcade aka romainl
" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
" https://www.reddit.com/r/vim/comments/5g63ar/pushing_builtin_features_beyond_their_limits_by/
function! cw#CCR()
  let cmdline = getcmdline()
  if cmdline =~ '\v\C^(ls|files|buffers)'
    " like :ls but prompts for a buffer command
    return "\<CR>:b"
  elseif cmdline =~ '\v\C/(#|nu%[mber])$'
    " like :g//# but prompts for a command
    return "\<CR>:"
  elseif cmdline =~ '\v\C^(dli|il)'
    " like :dlist or :ilist but prompts for a count for :djump or :ijump
    return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
  elseif cmdline =~ '\v\C^(cli|lli)'
    " like :clist or :llist but prompts for an error/location number
    return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
  elseif cmdline =~ '\C^old'
    " like :oldfiles but prompts for an old file to edit
    set nomore
    return "\<CR>:sil se more|e #<"
  elseif cmdline =~ '\C^changes'
    " like :changes but prompts for a change to jump to
    set nomore
    return "\<CR>:sil se more|norm! g;\<S-Left>"
  elseif cmdline =~ '\C^ju'
    " like :jumps but prompts for a position to jump to
    set nomore
    return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
  elseif cmdline =~ '\C^marks'
    " like :marks but prompts for a mark to jump to
    return "\<CR>:norm! `"
  elseif cmdline =~ '\C^undol'
    " like :undolist but prompts for a change to undo
    return "\<CR>:u "
  else
    return "\<CR>"
  endif
endfunction
" cnoremap <expr> <CR> cw#CCR()
" }}}2
" Heatseeker {{{2
function! cw#HeatseekerCommand(choice_command, hs_args, first_command, rest_command)
  try
    let selections = system(a:choice_command . " | hs " . a:hs_args)
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  let first = 1
  for selection in split(selections, "\n")
    if first
      exec a:first_command . " " . selection
      let first = 0
    else
      exec a:rest_command . " " . selection
    endif
  endfor
endfunction

if has('win32')
  nnoremap <leader>hs :call cw#HeatseekerCommand("dir /a-d /s /b", "", ':e', ':tabe')<CR>
else
  nnoremap <leader>hs :call cw#HeatseekerCommand("find . ! -path '*/.git/*' -type f -follow", "", ':e', ':tabe')<cr>
endif "}}}2
" Fuzzy select a buffer. Open the selected buffer with :b. {{{2
function! cw#HeatseekerBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  let named_buffers = filter(buffers, '!empty(v:val)')
  if has('win32')
    let filename = tempname()
    call writefile(named_buffers, filename)
    call cw#HeatseekerCommand("type " . filename, "", ":b", ":b")
    silent let _ = system("del " . filename)
  else
    call cw#HeatseekerCommand('echo "' . join(named_buffers, "\n") . '"', "", ":b", ":b")
  endif
endfunction

nnoremap <leader>hb :call cw#HeatseekerBuffer()<cr>
"}}}2
" Highlight statusline {{{2
function! cw#ChSlCl()
  " Inverted Error styling, for left-hand side "Powerline" triangle.
  " works only instide the function, constantly recoloring, i guess.
  let l:prefix=has('gui') || has('termguicolors') ? 'gui' : 'cterm'
  let l:fg=synIDattr(synIDtrans(hlID('StatusLine')), 'fg', l:prefix)
  let l:bg=synIDattr(synIDtrans(hlID('TabLineFill')), 'bg', l:prefix)
  exe 'hi! StatusLine ctermfg=005 guifg=goldenrod2 guibg='.l:bg
  execute 'highlight! User4 ' . l:prefix . 'fg=' . l:fg . ' ' . l:prefix . 'bg=' . l:bg
  " execute 'highlight! User5 ' . l:prefix . 'fg=' . l:bg . ' ' . l:prefix . 'bg=' . l:fg
  return ''
endfunction

" Automatically change the statusline color depending on mode {{{2
function! cw#ChangeStatuslineColor()
  " Inverted Error styling, for left-hand side "Powerline" triangle.
  " works only instide the function, constantly recoloring, i guess.
  let l:prefix=has('gui') || has('termguicolors') ? 'gui' : 'cterm'
  let l:fg=synIDattr(synIDtrans(hlID('StatusLine')), 'fg', l:prefix)
  let l:bg=synIDattr(synIDtrans(hlID('TabLineFill')), 'bg', l:prefix)
  execute 'highlight! User4 ' . l:prefix . 'fg=' . l:fg . ' ' . l:prefix . 'bg=' . l:bg
  " execute 'highlight! User5 ' . l:prefix . 'fg=' . l:bg . ' ' . l:prefix . 'bg=' . l:bg
  execute 'highlight! link User5 TabLineFill'
  " ========================================
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008 guifg=RoyalBlue2 guibg='.l:bg
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005 guifg=goldenrod2 guibg=bg'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=chartreuse3 guibg=bg'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=lavender guibg=bg'
  endif

  return ''
endfunction

" Find out current buffer's size and output it. {{{2
function! cw#FileSize()
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

" Readonly {{{2
function! cw#ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
  endfunction
  " Returns true if paste mode is enabled {{{2
  function! cw#HasPaste()
    if &paste
      return 'PASTE MODE '
    en
    return ''
  endfunction
  "}}}2
  " Emmet smart-expando {{{2
  function! cw#zen_html_tab()
    if !emmet#isExpandable()
      return "\<plug>(emmet-move-next)"
    endif
    return "\<plug>(emmet-expand-abbr)"
  endfunction
  " }}}2
  " ExecuteMacroOverVisualRange {{{2
  " Allows you to visually select a section and then hit @ to run a macro on all lines
  " https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
  function! cw#ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction

  " Get Colorscheme Names {{{2
  function! cw#GetColorsNames()
    if !exists('g:mycolors')
      " echo "* Fetching colorschemes..."
      " let g:mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
      let matches = {}
      for fname in split(globpath(&runtimepath, 'colors/*.vim'), '\n')
        let name = fnamemodify(fname, ':t:r')
        let matches[name] = 1
      endfor
      let g:mycolors = sort(keys(matches), 1)
    endif
    return g:mycolors
  endfunction

  " Get Random Colorscheme Name {{{2
  function! cw#GetRandomColors()
    if !exists('g:mycolors')
      call cw#GetColorsNames()
    endif
    let s:randcl = g:mycolors[localtime() % len(g:mycolors)]
    return s:randcl
  endfunction

  " Set Window Title {{{2
  function! cw#SetGvimTitle()
    if has('title')
      set titlelen=99
      set titlestring=%t%(\ %M%)\ -%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{g:colors_name}
      " set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ -\ %{g:colors_name} titlelen=99
    endif
  endfunction

  " Set Random Colorscheme Name {{{2
  function! cw#SetRandomColors()
    let s:color = cw#GetRandomColors()
    exe 'colorscheme ' . s:color
    call cw#SetGvimTitle()
    redraw
    echo "* color: " g:colors_name
  endfunction

  " Enforce highlighting for Mode aware cursor hack {{{2
  function! cw#SetModalCursor()
    " http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
    " https://github.com/blaenk/dots/blob/9843177fa6155e843eb9e84225f458cd0205c969/vim/vimrc.ln#L49-L64
    set gcr=a:block

    " mode aware cursors
    set gcr+=o:hor50-Cursor
    set gcr+=n:Cursor
    set gcr+=i-ci-sm:InsertCursor
    set gcr+=r-cr:ReplaceCursor-hor20
    set gcr+=c:CommandCursor
    set gcr+=v-ve:VisualCursor

    " do not blink
    set gcr+=a:blinkon0

    hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
    hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
    hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
    hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
  endfunction

  " Automagical colorscheme assigning :) "{{{2
  function! cw#SetColors()
    if has('vim_starting')
      " echom '*** vim starting ***'
      if !has('syntax')
        return '*ERROR*: set syntax before colorscheme'
      endif

      for [k,v] in items(g:is)
        if v && has_key(g:cs, k)
          " echom 'detected: '.k
          " echom 'has key: '.k
          execute 'colorscheme '.get(g:cs, k)
        endif
      endfor
      unlet k v
    endif

    return 'SetColors END'
  endfunction
  " Toggle bg between light and dark {{{2
  function! cw#SwitchTheLight()
    exe { 'light': 'set bg=dark', 'dark': 'set bg=light' }[&bg]
  endfunction
