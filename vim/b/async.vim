" 2017-05-18 [ asyncomplete.vim ] {{{3
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'whitelist': ['*'],
"     \ 'blacklist': ['go'],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ }))

Plug 'prabirshrestha/asyncomplete-emoji.vim'
" call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
"     \ 'name': 'emoji',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('asyncomplete#sources#emoji#completor'),
"     \ }))

Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
" call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"         \ 'name': 'ultisnips',
"         \ 'whitelist': ['*'],
"         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"         \ }))

Plug 'prabirshrestha/asyncomplete-tags.vim'
" call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"     \ 'name': 'tags',
"     \ 'whitelist': ['c'],
"     \ 'completor': function('asyncomplete#sources#tags#completor'),
"     \ }))

Plug 'yami-beta/asyncomplete-omni.vim'
augroup asynccomplete
	au!
	au User asyncomplete_setup call asyncomplete#register_source(
		\ asyncomplete#sources#omni#get_source_options({
			\ 'name': 'omni',
			\ 'whitelist': ['*'],
			\ 'completor': function('asyncomplete#sources#omni#completor')
			\  })
	\ )
augroup END

let g:asyncomplete_auto_popup = 0
