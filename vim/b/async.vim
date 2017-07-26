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

