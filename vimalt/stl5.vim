" http://marcotrosi.tumblr.com/post/120117928073/vim-statusline
hi slred guifg=#F92672 guibg=#232526 gui=bold
hi slgrn guifg=#A6E22E guibg=#232526 gui=bold
hi slorg guifg=#FD971F guibg=#232526 gui=bold
hi slblu guifg=#66D9EF guibg=#232526 gui=bold

set statusline=%#slorg#CD=%{getcwd()}%=%#slred#\ PERM=%{getfperm(expand('%'))}\ FORMAT=%{&ff}\ TYPE=%Y\ SPELL=%{&spelllang}\ %#slgrn#\ LINE=%l/%L(%p%%)\ COL=%v\ BYTE=%o\ %#slblu#\ DEC=\%b\ HEX=\%B\ 
