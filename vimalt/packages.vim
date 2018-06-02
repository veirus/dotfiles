if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	packadd matchit
	map Q %
endif

" minpac {{{
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
	finish
endif

" minpac is loaded.
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" tpope {{{2
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rsi')
call minpac#add('tpope/vim-sleuth',     {'type': 'opt'})
call minpac#add('tpope/vim-speeddating')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
call minpac#add('tpope/vim-vinegar')
" Colorschemes {{{2
call minpac#add('croaker/mustang-vim')
call minpac#add('dhruvasagar/vim-railscasts-theme')
call minpac#add('larsbs/vimterial_dark')
" misc {{{2
call minpac#add('ctrlpvim/ctrlp.vim',   {'type': 'opt'})
call minpac#add('hsitz/VimOrganizer',   {'type': 'opt'})
call minpac#add('tommcdo/vim-lion')
call minpac#add('dbmrq/vim-howdy')
call minpac#add('dhruvasagar/vim-dotoo',{'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('dhruvasagar/vim-zoom')
" minpac }}}

