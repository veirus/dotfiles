" == new stuff == {{{2
" 2017-07-10 {{{3
" currently incompatible with my present todo files, disabling
" Plug 'aserebryakov/vim-todo-lists'
" [ vim 8 syntax | ctrlp-swoop ] {{{3
Plug 'vim-jp/syntax-vim-ex' " for vim 8.0 syntax
Plug 'mattn/ctrlp-swoop'
" 2017-06-30 [ polyglot ] {{{3
Plug 'sheerun/vim-polyglot'
" 2017-06-26 [ php indenting ] {{{3
Plug '2072/PHP-Indenting-for-VIm'
" 2017-06-23 [ md todo ] {{{3
Plug 'rlue/vim-getting-things-down'
" 2017-06-22 [ splitjoin ] {{{3
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_split_mapping = 'cx'
let g:splitjoin_join_mapping  = 'cv'
" 2017-06-07 [ vim-searchindex | vim-hier | vim-agrep ] {{{3
Plug 'google/vim-searchindex' " very cool
Plug 'jceb/vim-hier'
Plug 'osyo-manga/vim-agrep'
" 2017-05-25 [denite] {{{3
" Plug 'Shougo/denite.nvim'
" 2017-05-23 [ gutentags ] {{{3
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_ctags_exclude=['node_modules']
" 2017-05-22 [ scratch.vim ] {{{3
Plug 'mtth/scratch.vim'
" 2017-05-18 [ asyncomplete.vim ] {{{3
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'whitelist': ['*'],
"     \ 'blacklist': ['go'],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ }))
" call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
"     \ 'name': 'emoji',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('asyncomplete#sources#emoji#completor'),
"     \ }))
" call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"         \ 'name': 'ultisnips',
"         \ 'whitelist': ['*'],
"         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"         \ }))
" call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"     \ 'name': 'tags',
"     \ 'whitelist': ['c'],
"     \ 'completor': function('asyncomplete#sources#tags#completor'),
"     \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
      \ 'name': 'omni',
      \ 'whitelist': ['*'],
      \ 'completor': function('asyncomplete#sources#omni#completor')
      \  }))
let g:asyncomplete_auto_popup = 0

" 2017-05-17 [supertab] {{{3
Plug 'ervandew/supertab'
" 2017-04-26 [ wordpress.vim ? ] {{{3
" I'm not sure what it is doing.
" It seems it doesn't work, disabling 2017-07-07
" Plug 'dsawardekar/wordpress.vim'
" 2017-03-31 [ fzf ] {{{3
Plug 'junegunn/fzf', { 'dir': '~\.fzf'} | Plug 'junegunn/fzf.vim'
nmap <leader><tab> <plug>(fzf-maps-n)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" fzf + ripgrep config {{{4
" https://elliotekj.com/2016/10/30/using-ripgrep-and-fzf-instead-of-the-silver-searcher-and-ctrlp-in-vim/
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" let g:fzf_launcher = 'cmd.exe /c %CMDER_INSTALL_DIR%\Cmder.exe /START "%v"'
" Let’s take a look at those flags:
" --files: Makes ripgrep print each file that would be searched, but prevents
"  ripgrep from actually searching it.
" --hidden: Makes ripgrep search hidden directories and files.
" --smartcase: Makes ripgrep search case-insensitively if the pattern is all
"  lowercase, however if there is a capital the search becomes case-sensitive.
" --glob: (with an exclamation mark) makes ripgrep ignore directories matching
"  the passed patterns. In this case, we want to ignore the .git folder.
" One flag that I haven’t included, but which you may want to use is
" --no-ignore, which will tell ripgrep to search files and directories listed in
"  .gitignore, .ignore, etc. By default, files that are set to be ignored in
"  those files are ignored by ripgrep.
" 2017-03-21 [ hardtime ] {{{3
Plug 'takac/vim-hardtime'
nnoremap <leader><F1> <Esc>:HardTimeToggle<CR>
let g:hardtime_ignore_quickfix = 1
" 2017-02-22 [ showmap ] {{{3
Plug 'fcpg/vim-showmap'
" 2017-02-06 [ ale ] {{{3
Plug 'w0rp/ale'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format = [' ✖ %d ', ' ! %d ', '']
" }}}3
" 2017-07-07 [ clever-f ] {{{3
" Doesn't work with cyrillic
" Plug 'rhysd/clever-f.vim'
" }}}3
