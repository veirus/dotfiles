" == new stuff == {{{1

" `ga` on steroids; adds extra info to `ga` output
Plug 'tpope/vim-characterize'
" prettier, great code /uglifier/
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" 2018-02-02
" Displays function signatures from completions in the command line.
" Requires configuring
" Doesn't work, /obviosly/
Plug 'Shougo/echodoc.vim'

" Promising replacement for gutentags
" Actually needs testing
" I DON'T SEE IT WORKS
" Though...
" It doesn't craploads a whole core like gutentags did
Plug 'jsfaint/gen_tags.vim'

" 2018-01-16
" highlights ambigous characters, e.g. M and russian M
" Practically highlights everything that's not english
" making it's kinda useless and obtuse
" Plug 'vim-utils/vim-troll-stopper'
" That's why it's disabled, but still here for some emergency

" Syntax for plain text files
Plug 'vim-scripts/txt.vim'

" 2017-11-23 {{{3
" Plug 'easymotion/vim-easymotion'
" map s <Plug>(easymotion-prefix)
" To be fair it's good, still considering it over vim-sneak

" 2017-11-22 {{{3
Plug 'gregsexton/MatchTag'
" Nice replacement for a CtrlP, requires /addiction/
" yes, that's how google translate said, 'addiction'
Plug 'Yggdroot/LeaderF'
    let g:Lf_StlSeparator = { 'left': '', 'right': '' }
    let g:Lf_ShortcutF = '<C-P>'
    let g:Lf_IndexTimeLimit = 60
    let g:Lf_DefaultExternalTool = 'rg'
    let g:Lf_StlColorscheme = 'powerline'

" 2017-11-21 {{{3
" 2018-02-09: can't properly config it
Plug 'maralla/completor.vim'
" let g:completor_auto_trigger = 0
" inoremap <expr> <C-`> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
"}}}3

" Clean and lean buffer killing, without butchering Mah Splits!
Plug 'moll/vim-bbye'

" Really useful stuff but I rarely use it {{{3
" Renaming files without unnecessary moves
Plug 'vim-scripts/renamer.vim'
" Terminal stuff
Plug 'jpalardy/vim-slime'
    let g:slime_target = "conemu"
" Opening files and folders in shell and Explorer, nice and sexy
Plug 'justinmk/vim-gtfo'
" Excel for poor man. Arithmetic operations on rows and collumns of digits
Plug 'sk1418/HowMuch', { 'on': 'HowMuch' }

" 2017-07-26 {{{3
" IIRC it was messing with my other plugins, despite being actually useful
" Plug 'othree/csscomplete.vim'
" augroup css_complete
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" augroup END

" 2017-06-22 [ splitjoin ] {{{3
Plug 'AndrewRadev/splitjoin.vim'
    " Just adding these two lines turns this plugin from garbage to a Gem!
    " considering adding it to the *CORE*
    let g:splitjoin_split_mapping = 'cx'
    let g:splitjoin_join_mapping  = 'cv'

" 2017-06-07 [ vim-searchindex | vim-hier | vim-agrep ] {{{3
" adds search match count under statusline
" somewhat better than a similar plug from japanese friends
Plug 'google/vim-searchindex'
" Plug 'osyo-manga/vim-agrep'

" 2017-05-17 [supertab] {{{3
" I'm not even sure what it is doing here
" Plug 'ervandew/supertab'
