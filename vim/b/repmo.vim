" File: repmo.vim
" Author: carudo
" Description: Repeat motions. Fucking addictive. Wanna in vanilla vim.
" Last Modified: 2018-11-17 Ñá 03:41

" repmo.vim: {{{2
Plug 'Houl/vim-repmo'

" I messed up everything with `noremap`
" using `map` or `noremap` here is critical
" TODO: look up docs and fix it, it's good!
" map a motion and its reverse motion:
noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj`, you can keep that:
noremap <expr> j repmo#Key('gj', 'gk')|sunmap j
noremap <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
noremap <expr> ; repmo#LastKey(';')|sunmap ;
noremap <expr> : repmo#LastRevKey(',')|sunmap :
" orig:
" map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;` or `,`:
" noremap <expr> f repmo#ZapKey('f')|sunmap f
" noremap <expr> F repmo#ZapKey('F')|sunmap F
" noremap <expr> t repmo#ZapKey('t')|sunmap t
" noremap <expr> T repmo#ZapKey('T')|sunmap T

" repeat scroll commands:
noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')

" vim-sneak:
noremap  <expr> ; repmo#LastKey('<Plug>Sneak_;')|sunmap ;
noremap  <expr> : repmo#LastRevKey('<Plug>Sneak_,')|sunmap :

noremap  <expr> s repmo#ZapKey('<Plug>Sneak_s')|ounmap s|sunmap s
noremap  <expr> S repmo#ZapKey('<Plug>Sneak_S')|ounmap S|sunmap S
onoremap <expr> z repmo#ZapKey('<Plug>Sneak_s')
onoremap <expr> Z repmo#ZapKey('<Plug>Sneak_S')
noremap  <expr> f repmo#ZapKey('<Plug>Sneak_f')|sunmap f
noremap  <expr> F repmo#ZapKey('<Plug>Sneak_F')|sunmap F
noremap  <expr> t repmo#ZapKey('<Plug>Sneak_t')|sunmap t
noremap  <expr> T repmo#ZapKey('<Plug>Sneak_T')|sunmap T

" }}}2
