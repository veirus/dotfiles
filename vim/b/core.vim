" File: core.vim
" Author: carudo
" Description: plugins i can't live without
" Last Modified: 2018-11-17 Ñá 03:22

" == Code == {{{2

Plug 'nathanaelkane/vim-indent-guides' "{{{3
" default: <leader>ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent=3

if !has('gui_running')
    " let g:indent_guides_auto_colors=0
    function! s:indent_set_console_colors()
        hi IndentGuidesOdd ctermbg=235
        hi IndentGuidesEven ctermbg=236
    endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
endif
" }}}3

" 2017-05-23 [ gutentags ] {{{3
" Plug 'ludovicchabant/vim-gutentags' ", {'for': ['php','vim','python','javascript','javascript.jsx','js','jsx','html','make']}
" let g:gutentags_ctags_exclude=['node_modules', '.git']
" let g:gutentags_cache_dir = $DOTVIMDIR.'/gutentags'

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } "{{{3
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
xmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>a <Plug>(EasyAlign)

Plug 'mhinz/vim-startify' "{{{3
nnoremap <F1> :Startify<CR>
let g:startify_list_order = ['bookmarks', 'files', 'sessions']
let g:startify_bookmarks = [
            \ {'r': '~\vimfiles\vimrc'},
            \ {'c': '~\vimfiles\b\colors.vim'},
            \ {'o': '~\bigjulytasks.todo'},
            \ {'p': '~\PROSTOR.todo'},
            \ {'y': '~\jrnl.todo' },
            \ {'u': '~\jrnl.org' },
            \ ]
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles = 1
let g:startify_session_sort = 1
let g:startify_session_autoload = 0
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_enable_unsafe = 0
"}}}3

" 2017-03-13 [ ultisnips ] {{{3
" Snippets are separated from the engine.
" Add this if you want them: Plug 'honza/vim-snippets'
" If you want :UltiSnipsEdit to split your window.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsEditSplit           = "vertical"
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsListSnippets        = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" -- parenthesis -- {{{3
" Plug 'Raimondi/delimitMate'
" let delimitMate_expand_cr = 1
" Plug 'jiangmiao/auto-pairs' " overrides cyrilic letters on [ and ]
" Plug 'junegunn/rainbow_parentheses.vim'

Plug 'luochen1990/rainbow'
" 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

if has('packages')
    if !has('nvim')
        packadd! matchit
    endif
else
    source $VIMRUNTIME/macros/matchit.vim
endif
" Plug 'tmhedberg/matchit' " custom matchit, allegedly has some improvements
let b:match_ignorecase = 1

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer' " 2017-04-14 - closes brackets

" -- hotkeys {{{3
Plug 'tpope/vim-rsi'
" Plug 'romainl/vim-qf' " did i really nead that? Requires config apparently
Plug 'tpope/vim-unimpaired'

" -- repeat {{{3
Plug 'tpope/vim-repeat'
" Plug 'kana/vim-repeat'

" -- comments {{{3
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
" Plug 'tyru/caw.vim'
" let g:caw_operator_keymappings = 1

" -- misc {{{3
Plug 'justinmk/vim-dirvish' " doesn't work with autochdir
Plug 'skywind3000/asyncrun.vim', {'on' : ['AsyncRun', 'Gulp', 'GulpExt']} " i don't use it
" Plug 'mbbill/fencview', {'on' : 'FencAutoDetect'}
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
" Deprecated by maintaners. Use ack.vim [ 2018-08-11 ]
" Plug 'rking/ag.vim', {'on' :'Ag'}
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
Plug 'tyru/open-browser.vim'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'

Plug 'justinmk/vim-sneak'
let g:sneak#streak=1
let g:sneak#label = 1

