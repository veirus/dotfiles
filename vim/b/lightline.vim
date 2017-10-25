Plug 'itchyny/lightline.vim'
set laststatus=2
" This is regular lightline configuration, we just added
" 'linter_warnings', 'linter_errors' and 'linter_ok' to
" the active right panel. Feel free to move it anywhere.
" `component_expand' and `component_type' are required.
"
" For more info on how this works, see lightline documentation.
let g:lightline = {
	  \ 'active': {
	  \   'right': [ [ 'lineinfo' ],
	  \              [ 'percent' ],
	  \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
	  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
	  \ },
	  \ 'component_expand': {
	  \   'linter_warnings': 'LightlineLinterWarnings',
	  \   'linter_errors': 'LightlineLinterErrors',
	  \   'linter_ok': 'LightlineLinterOK'
	  \ },
	  \ 'component_type': {
	  \   'linter_warnings': 'warning',
	  \   'linter_errors': 'error',
	  \   'linter_ok': 'ok'
	  \ },
	  \ }

augroup ale_lint
	au!
	autocmd User ALELint call lightline#update()
augroup END

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction
