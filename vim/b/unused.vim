" == unused == {{{2

"------------------------------
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
"------------------------------

" 2017-07-07 [ clever-f ] {{{3
" Doesn't work with cyrillic
Plug 'rhysd/clever-f.vim'
" 2017-07-10 {{{3
" currently incompatible with my present todo files, disabling
Plug 'aserebryakov/vim-todo-lists'
" 2017-07-12 [ lightline ]
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-operator-user'
Plug 'samsonw/vim-task'
Plug 'osyo-manga/vim-trip'
Plug 'osyo-manga/vim-over'
Plug 'osyo-manga/vim-jplus'
Plug 'dbmrq/vim-chalk'
Plug 'fisadev/FixedTaskList.vim'
Plug 'mattn/benchvimrc-vim'
" 2017-05-22 [ scratch.vim ] {{{3
Plug 'mtth/scratch.vim'
" 2017-07-21 {{{3
Plug 'jlanzarotta/bufexplorer'
Plug 'jceb/vim-hier'
" 2017-05-22 [ scratch.vim ] {{{3
Plug 'mtth/scratch.vim'
" 2017-04-26 [ wordpress.vim ? ] {{{3
" I'm not sure what it is doing.
" It seems it doesn't work, disabling 2017-07-07
Plug 'dsawardekar/wordpress.vim'
" 2017-05-25 [denite] {{{3
Plug 'Shougo/denite.nvim'
" 2017-03-31 [ fzf ] {{{3
Plug 'junegunn/fzf', { 'dir': '~\.fzf'} | Plug 'junegunn/fzf.vim'
nmap <leader><tab> <plug>(fzf-maps-n)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" fzf + ripgrep config {{{3
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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
let g:fzf_launcher = 'cmd.exe /c %CMDER_INSTALL_DIR%\Cmder.exe /START "%v"'
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
