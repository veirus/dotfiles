color github " flatlandia "mustang "railscasts
" matchit {{{1
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	packadd matchit
	map Q %
endif

" minpac commands {{{

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
" misc                        {{{2
Plug 'amiorin/vim-eval'
Plug 'dhruvasagar/vim-dotoo', {'type': 'opt'}
Plug 'dhruvasagar/vim-zoom'
Plug 'honza/vim-snippets'
Plug 'hsitz/VimOrganizer',    {'type': 'opt'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',     {'type': 'opt'}
Plug 'kalekundert/vim-coiled-snake'
Plug 'sirver/UltiSnips'
Plug 'tommcdo/vim-lion'
" minpac }}}

