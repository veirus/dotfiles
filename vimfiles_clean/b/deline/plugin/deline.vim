if !exists("g:Deline_DefaultDefinitions")
    """If non-zero, define statusline by deline's settings.
    let g:Deline_DefaultDefinitions = 1
endif

if !exists("g:Deline_Powerful")
    """If non-zero, define statusline by deline's powerful settings.
    """It requires a powerline font. like 
    let g:Deline_Powerful = 0
endif

call deline#_init()

"""Define |'statusline'| with |deline-functions|.
"""
"""Example: >
"""    call Deline([
"""        \ "mode:",
"""        \ deline#mode(),
"""        \ deline#rightalign(),
"""        \ deline#modified('+ ', ''),
"""        \ deline#file(':p:h:t/:p:t'),
"""        \ ])
"""<
"""    ______________________________________ 
"""    mode:NORMAL         + mydir/myfile.txt 
"""    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
function! Deline(list)
    call deline#_set(a:list)
endfunction

"""Configure Deline settings.
"""
"""Example: >
"""    call DelineConfig({
"""        \ "no_name": "*NAME_NOT_DEFINED*",
"""        \
"""        \ "mode_c": {
"""        \ "": " COMMAND ",
"""        \ "guifg": "#000000",
"""        \ "guibg": "#ffffff",
"""        \ },
"""        \ })
"""<
"""
"""KEY		DESCRIPTION ~
"""
"""hl_1		highlight group User1: textual part
"""hl_3		highlight group User3: separator
"""hl_4		highlight group User4: cautious
"""hl_mode_	highlight group User2: mode `"hl_mode_" . mode()`
"""no_name		fallback name of |deline#file()|
"""		default: [No Name]
"""interval	throttling interval of re-evaluating of
"""		dynamic functions in second.
"""		default: 0.5
function! DelineConfig(config)
    call deline#_config(a:config)
endfunction

function! DelineConfigGet(key, defvalue)
    return deline#_config_get(a:key, a:defvalue)
endfunction

if g:Deline_DefaultDefinitions 
    if g:Deline_Powerful
        call deline#example#powerful()
    else
        call deline#example#simple()
    endif
endif

augroup Deline
autocmd!
autocmd VimEnter * call deline#_initHighlight()
autocmd BufEnter,ColorScheme,VimResized * call deline#_apply() | call deline#_initHighlight()
autocmd User DelineRefresh call deline#_apply() | call deline#_initHighlight()
augroup END
