" == Necessity == {{{2
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides' "{{{3
" <leader>ig
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
Plug 'ctrlpvim/ctrlp.vim' "{{{3
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <Leader>o :CtrlPMRUFiles<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
Plug 'mhinz/vim-startify' "{{{3
nnoremap <F1> :Startify<CR>
let g:startify_list_order = ['bookmarks', 'files', 'sessions']
let g:startify_bookmarks = [
      \ {'o': '~\prostor.todo.md'},
      \ {'p': '~\PROSTOR.todo'},
      \ {'r': '~\_vimrc'},
      \ {'t': '~\onetab.txt'} ]
let g:startify_update_oldfiles = 1
" let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
"}}}3
Plug 'rking/ag.vim', {'on' :'Ag'}
" 2017-03-13 [ ultisnips ] {{{3
" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Snippets are separated from the engine. Add this if you want them: Plug 'honza/vim-snippets'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}3
" * * * * *
" -- open url in browser -- {{{3
Plug 'tyru/open-browser.vim'
" }}}3
" -- parenthesis -- {{{3
" Plug 'Raimondi/delimitMate'
"   let delimitMate_expand_cr = 1
" Plug 'jiangmiao/auto-pairs' " overrides cyrilic letters on [ and ]
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
Plug 'matchit.zip'
let b:match_ignorecase = 1
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer' " 2017-04-14
"}}}3
" -- hotkeys {{{3
Plug 'tpope/vim-rsi'
" Plug 'romainl/vim-qf'
" Plug 'tpope/vim-unimpaired'
" -- repeat {{{3
Plug 'tpope/vim-repeat'
" Plug 'kana/vim-repeat'
" -- comment {{{3
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
" Plug 'tyru/caw.vim'
"   let g:caw_operator_keymappings = 1
" }}}3
" -- gist-vim {{{3
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
" }}}3
" -- utils -- {{{3
Plug 'justinmk/vim-dirvish' "doesn't work with autochdir
Plug 'skywind3000/asyncrun.vim' ", {'on':['Gulp','GulpExt']}
" Plug 'mbbill/fencview', {'on' : 'FencAutoDetect'}
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
" let g:sneak#streak=1
Plug 'konfekt/fastfold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:html_folding = 1
let g:perl_fold = 1
" ST's PlainTasks compatible!
Plug 'irrationalistic/vim-tasks'