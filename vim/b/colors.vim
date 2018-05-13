" colors {{{3
if !exists('g:mycolor')
    let g:mycolor = 'dracula'
endif
let s:altcolor = 'challenger_deep'
" let s:altcolor = 'nova'
let g:cs = {
            \ 'xterm':  'jellybeans',
            \ 'nvim':   'molokai',
            \ 'conemu': 'badwolf',
            \ 'wingui': g:is.prostor ? g:mycolor : s:altcolor
            \ }
" ========================================


" -- new themes -- {{{3

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'robertmeta/nofrils'

" 2018-03-10 Colorscheme {{{4
" i supposed to try it maybe
Plug 'fenetikm/falcon'

" boring oldschool for uninspired grumps and idiots like myself {{{4
Plug 'plan9-for-vimspace/acme-colors'

" }}}4

Plug 'archSeer/colibri.vim'
Plug 'cocopon/iceberg.vim'
Plug 'Wutzara/vim-materialtheme'
Plug 'google/vim-colorscheme-primary'
Plug 'ericbn/vim-solarized'

" -- utilitiy -- {{{3
Plug 'vim-scripts/ScrollColors', { 'on': 'SCROLLCOLOR' }
" Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}

" -- bundles -- {{{3

Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'

" -- * * * --- {{{3

Plug 'sickill/vim-monokai' " 2017-03-09 [ monokai ]
Plug 'rakr/vim-one'
Plug 'ajmwagar/vim-deus'
Plug 'sonjapeterson/1989.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'fneu/breezy'
Plug 'kristijanhusak/vim-hybrid-material'
" \ | let g:airline_theme = "hybrid"
" Plug 'jasonlong/lavalamp' " should be installed manually
Plug 'amadeus/vim-evokai'
Plug 'jacoborus/tender'
Plug 'junegunn/seoul256.vim'

" -- * * * * -- {{{3

Plug 'KabbAmine/yowish.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zanglg/nova.vim'

" -- * * * * * -- {{{3

Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
"   let g:kolor_underlined=1

"}}}3
