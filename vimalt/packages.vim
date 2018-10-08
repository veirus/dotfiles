color tempus_autumn " flatlandia "mustang "railscasts

" plugin settings {{{1

map Q <plug>(matchup-%)

" Use fd for ctrlp. {{{2
if executable('fd')
	let g:ctrlp_user_command = 'fd -c never "" "%s"'
	let g:ctrlp_use_caching = 0
endif

" FZF {{{2
" To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :History<CR>
nnoremap <C-p> :FZF<CR>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
" complete path doesn't work on Windows:
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" autocommands {{{1
if has("autocmd")
" vim-dotoo  {{{2
augroup p_vimDotoo
	autocmd!
	autocmd BufEnter *.dotoo packadd vim-dotoo
	autocmd BufRead, BufNewFile, BufEnter *.dotoo filetype plugin indent on
	autocmd BufRead, BufNewFile, BufEnter *.dotoo syntax on
augroup END

" vim organizer {{{2
let g:ft_ignore_pat = '\.org'
augroup p_VimOrganizer
	autocmd!
	" autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
	autocmd BufEnter *.org filetype plugin indent on
	autocmd BufEnter *.org syntax on
	autocmd BufEnter *.org packadd VimOrganizer
	autocmd BufEnter *.org call org#SetOrgFileType()
augroup END
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()
endif

" minpac commands {{{1

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! -nargs=+ -bar Plug call minpac#add(<args>)

" quick add plugins for a minpac {{{1
function! AddPacFromCb(arg) abort
	if v:version >= 801 || (v:version == 800 && has("patch1630"))
		let l:cb = trim(@+)
	else
		" do oldschool way to trim all spaces and whatnot
		let l:cb = substitute(@+,'\v^\s*(.{-})\s*\n$','\1','')
	endif
	let l:cb = substitute(l:cb, '\v^https://github.com/','','')
	if a:arg
		put = 'Plug ''' . l:cb . ''''
	else
		" without the `Plug` command
		put = 'call minpac#add(''' . l:cb . ''')'
	endif
endfunction
nnoremap <leader>v :call AddPacFromCb(1)<CR>

" minpac {{{1
if !exists('*minpac#init')
	finish
endif

" minpac is loaded.
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" tpope                       {{{2
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sleuth',      {'type': 'opt'}
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired',  {'type': 'opt'}
Plug 'tpope/vim-vinegar'
" Colorschemes                {{{2
Plug 'endel/vim-github-colorscheme'
Plug 'jordwalke/flatlandia'
Plug 'croaker/mustang-vim'
Plug 'dhruvasagar/vim-railscasts-theme'
Plug 'larsbs/vimterial_dark'
Plug 'neutaaaaan/iosvkem'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
" orgmode.vim                 {{{2
Plug 'dhruvasagar/vim-dotoo', {'type': 'opt'}
Plug 'hsitz/VimOrganizer',    {'type': 'opt'}
" fuzzy search                {{{2
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" python                      {{{2
Plug 'kalekundert/vim-coiled-snake'
" snippets                    {{{2
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
" split management            {{{2
Plug 'dhruvasagar/vim-zoom'
Plug 'andymass/vim-tradewinds'
" misc                        {{{2
Plug 'amiorin/vim-eval'
Plug 'junegunn/goyo.vim',     {'type': 'opt'}
Plug 'tommcdo/vim-lion'
Plug 'veirus/vim-devdocs',    {'branch': 'windows'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/VOoM'
Plug 'idbrii/vim-gogo'
Plug 'vim-utils/vim-troll-stopper'
" Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" minpac }}}1

" matchit {{{1
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	packadd matchit
	map Q %
endif
