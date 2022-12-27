" File: new.vim
" Author: carudo
" Description: Trying new things here
" Last Modified: 2020-12-27 Sun 20:38

" == new stuff == {{{1
" 2021-06-22
Plug 'alok/notational-fzf-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf'} | Plug 'junegunn/fzf.vim'

" 2020-12-20 Ranger-like file manager. Currently in-dev. Doesn't work.
" Plug 'ZhiyuanLck/vim-lf'

" 2020-03-15
" The bang version will try to download the prebuilt binary if cargo does not
" exist.
" nice!
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }


" 2019-10-04 - Nice!
Plug 'zxqfl/tabnine-vim'
" This is the Vim TabNine client, advanced AI based autocomplete for all
" programming languages. TabNine Indexes your entire project by reading your
" .gitignore or others, and determines which files to index.

" 2019-03-24
" breaks `cmap <Tab>`
" disable
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" 2019-04-18

if has('nvim')
    Plug 'meain/vim-package-info', {'do': 'npm install'}
endif

" 2019-03-16
Plug 'romainl/vim-devdocs'

" 2019-03-03
Plug 'junegunn/vim-emoji'

" `ga` on steroids; adds extra info to `ga` output
Plug 'tpope/vim-characterize'

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
" Critically useful when copying data from external sources

" Syntax for plain text files
Plug 'vim-scripts/txt.vim'

" 2017-11-23 {{{3
" Plug 'easymotion/vim-easymotion'
" map s <Plug>(easymotion-prefix)
" To be fair it's good, still considering it over vim-sneak

" 2017-11-22 {{{3
" This plugin highlights the matching HTML tag when the cursor is positioned
" on a tag. It works in much the same way as the MatchParen plugin.
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
