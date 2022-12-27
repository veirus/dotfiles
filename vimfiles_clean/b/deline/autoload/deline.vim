"""change highlight {hlname}.
function! deline#hl(hlname)
    if type(a:hlname) == 0
        return "%" . string(a:hlname) . "*"
    else
        return "%#" . a:hlname . "#"
    endif
endfunction

"""evaluates {expr} and returns {t} or {f}
function! deline#if(expr,t,f)
    return "%{" . a:expr . "?'" . a:t . "':'" . a:f . "'}"
endfunction

"""evaluated vim expr
function! deline#expr(expr)
    return "%{" . a:expr . "}"
endfunction

"""simply joins {list}
function! deline#serial(list)
    return join(a:list, '')
endfunction

"""comment (simply ignored as statusline)
function! deline#comment(text)
    return ""
endfunction

"""|system()|
function! deline#system(cmd)
    return "%{system('" . a:cmd . "')}"
endfunction

"""|strftime()|
function! deline#strftime(fmt)
    return "%{strftime('" . a:fmt . "')}"
endfunction

"""' '
function! deline#space()
    return ' '
endfunction

"""|
function! deline#bar()
    return '|'
endfunction

"""%=
function! deline#rightalign()
    return '%='
endfunction

"""file name
"""
""" {fmt} consists of expand-expr and slice-expr.
""" expand-expr: see |expand()|
""" slice-expr: [{number}] or [:{number}] sets max length
""" Example: :p:t:h[2] ==> 'myfolder' -> 'myf'
function! deline#file(fmt)
    return "%{deline#fileInner('" . a:fmt . "')}"
endfunction

"""returns {t} if &modified, else {f}
function! deline#modified(t,f)
    return "%{&modified?'" . a:t . "':'". a:f . "'}"
endfunction

"""returns {t} if &readonly, else {f}
function! deline#readonly(t,f)
    return "%{&readonly||!(&modifiable)?'" . a:t . "':'". a:f . "'}"
endfunction

"""%h
function! deline#helpfile()
    return "%h"
endfunction

"""%w
function! deline#preview()
    return "%w"
endfunction

"""%q
function! deline#quickfix()
    return "%q"
endfunction

"""%k
function! deline#keymap()
    return "%k"
endfunction

"""%n
function! deline#bufnr()
    return "%n"
endfunction

"""%b
function! deline#char()
    return "%b"
endfunction

"""%B
function! deline#charhex()
    return "%B"
endfunction

"""%o
function! deline#offset()
    return "%o"
endfunction

"""%O
function! deline#offsethex()
    return "%O"
endfunction

"""%N
function! deline#page()
    return "%N"
endfunction

"""%l
function! deline#line()
    return "%4l"
endfunction

"""%L
function! deline#numlines()
    return "%4L"
endfunction

"""%c
function! deline#column()
    return "%3c"
endfunction

"""%v
function! deline#columnv()
    return "%3v"
endfunction

"""%V
function! deline#columnvoptional()
    return "%V"
endfunction

"""%p
function! deline#linepercent()
    return "%p"
endfunction

"""%P
function! deline#winpercent()
    return "%P"
endfunction

"""%a
function! deline#argpos()
    return "%a"
endfunction

"""&filetype
function! deline#filetype()
    return "%{&filetype}"
endfunction

"""&fileformat
function! deline#fileformat()
    return "%{&fileformat}"
endfunction

"""&fileencoding
function! deline#fileencoding()
    return "%{&fileencoding}"
endfunction

"""the name of mode 'NORMAL', ...
function! deline#mode()
    return "%{deline#modeInner()}"
endfunction

"""DEPLICATED. use |deline#defHLMode|
function! deline#modeHL(hlname)
    return deline#defHLMode(a:hlname)
endfunction

"""re-define highlight as {hlname}
function! deline#defHLMode(hlname)
    let hlname = a:hlname
    if hlname == ""
        let hlname = "User2"
    endif

    return "%{deline#defHLModeInner('" . hlname . "')}"
endfunction

""" define highlight {hlname} with "attr=value attr=value ..." format string {attrs}
"""
""" See |highlight-gui| for {attrs}.
""" 
""" {keyexpr} is Vim script  expression or empty string.
""" {hlname} is not redifined IF {keyexpr} is previously passed value.
""" {keyexpr} is sometimes takes value of 'mode()' to change its highlight
""" definition by mode.
""" If {keyexpr} is '', {hlname} is not redifined.
"""
"""Example1: >
"""    call Deline([
"""          :
"""        \ deline#defHL('MY_1' '', ''uifg=#ffffff guibg=#000000'',
"""          :
"""        \ ])
"""<
""" In Example1, MY_1 is defined ONCE with {keyexpr} ''.
""" 
"""Example2: >
"""    call Deline([
"""          :
"""        \ deline#comment('MY_2 varies by mode'),
"""        \ deline#defHLMode('MY_2'),
"""          :
"""        \ deline#defHLCombined('MY_3', '', 'StatusLine', 'MY_2'),
"""        \ deline#defHLCombined('MY_4', 'mode()', 'StatusLine', 'MY_2'),
"""          :
"""        \ ])
"""<
""" Now, MY_3 and MY_4 each is a combined highlight. They have same fg and
""" bg.
""" MY_3 is static. Because its {keyexpr} (2nd argument) is '', and '' is
""" statically ''.
""" MY_4 is dynamic. Because its {keyexpr} is 'mode()', and it changes in
""" modes of Vim operations. You can use any Vim script expression, like 
""" '&modified'.
function! deline#defHL(hlname, keyexpr, attrs)
    let keyexpr = a:keyexpr
    if keyexpr == "" 
        let keyexpr = "'*'"
    endif

    return "%{deline#defHLInner('" . a:hlname . "', " . keyexpr . ", '" . a:attrs . "')}"
endfunction

""" define highlight {hlname} from inverted {basehlname}
function! deline#defHLInv(hlname, keyexpr, basehlname)
    let keyexpr = a:keyexpr
    if keyexpr == "" 
        let keyexpr = "'*'"
    endif

    return "%{deline#defHLInvInner('" . a:hlname . "', " . keyexpr . ", '" . a:basehlname . "')}"
endfunction

""" define highlight {hlname} from {basehlname} with distinctive fg color.
"""
""" Sometimes, combining highlights results in vague foreground color.
""" Then call this function to define another more distinctive highlight.
"""
""" The result may not be satisfiable for you, sorry.
function! deline#defHLAdjFG(hlname, keyexpr, basehlname)
    let keyexpr = a:keyexpr
    if keyexpr == "" 
        let keyexpr = "'*'"
    endif

    return "%{deline#defHLAdjFGInner('" . a:hlname . "', " . keyexpr . ", '" . a:basehlname . "')}"
endfunction

""" define combined highlight {hlname} from fg:{fghlname} and bg:{bghlname}
"""
""" {fghlname} and {bghlname} can be "attr=value attr=value ..." format string.
"""
""" See |deline#defHL| for {keyexpr}.
"""
""" {method} takes one of bellow:                  *deline-combination-method*
"""   ''  or  'fg/bg'   {fghlname} overwritten with xxxbg of {bghlname}
"""   'fg/fg+bg'        xxxbg is half of {fghlname} and half of {bghlname}
"""   'fg/fg+bg9'       xxxbg is 1/10 of {fghlname} and 9/10 of {bghlname}
"""   'fg/fg+bg7'       xxxbg is 3/10 of {fghlname} and 7/10 of {bghlname}
"""   'fg/fg+bg3'       xxxbg is 7/10 of {fghlname} and 3/10 of {bghlname}
"""   'fg/fg+bg1'       xxxbg is 9/10 of {fghlname} and 1/10 of {bghlname}
function! deline#defHLCombined(hlname, keyexpr, fghlname, bghlname, method)
    let keyexpr = a:keyexpr
    if keyexpr == "" 
        let keyexpr = "'*'"
    endif

    let method = a:method
    if method == ''
        let method = 'fg/bg'
    endif

    return "%{deline#defHLCombinedInner('" . a:hlname . "', " . keyexpr . ", '" . a:fghlname . "', '" . a:bghlname . "', '" . method . "')}"
endfunction

""" define combined highlight {hlname} from fg:bg of {lhlname} and bg:bg of {rhlname}
function! deline#defHLSeparator(hlname, keyexpr, lhlname, rhlname)
    let keyexpr = a:keyexpr
    if keyexpr == "" 
        let keyexpr = "'*'"
    endif

    return "%{deline#defHLSeparatorInner('" . a:hlname . "', " . keyexpr . ", '" . a:lhlname . "', '" . a:rhlname . "')}"
endfunction

"""displays delta time from last save. 
"""
"""Returns duration from last save in "{hour}h{minute}m" format.
"""{min_ago} is a Number to suppress output if the duration(in minute) < {min_ago}. 
function! deline#notsaved(min_ago)
    return "%{deline#notsavedInner(" . a:min_ago . ")}"
endfunction

"""displays the first line of the {filepath} at {inteerval}.
function! deline#filehead(filepath, interval)
    return "%{deline#fileheadInner('" . a:filepath . "', " . string(a:interval) . ")}"
endfunction

"""displays the last line of the {filepath} at {inteerval}.
function! deline#filetail(filepath, interval)
    return "%{deline#filetailInner('" . a:filepath . "', " . string(a:interval) . ")}"
endfunction

"==================================================

function! deline#_config_get(key, defvalue)
    if trim(a:key) == "" | return a:defvalue | endif

    let c = s:config

    let keys = split(a:key, "/")
    for i in range(len(keys))
        let k = trim(keys[i])

        if i == len(keys) - 1
            let c = get(c, k, a:defvalue)
        else
            let c = get(c, k, {})
        endif
    endfor

    return c
endfunction

function! deline#_config_set(key, value)
    if trim(a:key) == "" | return | endif

    let c = s:config

    let keys = split(a:key, "/")
    for i in range(len(keys))
        let k = trim(keys[i])

        if i == len(keys) - 1
            let c[k] = a:value
        else
            let ctest = get(c, k, {})
            if empty(ctest)
                let c[k] = {}
                let c = c[k]
            else
                let c = ctest
            endif
        endif
    endfor
endfunction

function! deline#_set(list)
    let g:Deline__statusline = a:list
    call deline#_apply()
endfunction

function! deline#_apply()
    let dynamic = 0
    let temp = ""
    for c in g:Deline__statusline
        if type(c) == 4
            let dynamic = 1
            let temp = temp . deline#dynamic#_eval(c)
        else
            let temp = temp . c
        endif
    endfor

    if dynamic
        let temp = temp . "%{deline#dynamic#_hook(". string(get(s:config, "interval", 0.5)) .")}"
    endif

    let &statusline = temp
    redraw
endfunction

function! deline#_init()
    let s:config = {
                \ "hl_1": {
                    \ "guifg": "#cccccc",
                    \ "guibg": "#333333",
                    \ "ctermfg": "White",
                    \ "ctermbg": "DarkGray",
                \ },
                \ "hl_3": {
                    \ "guifg": "#777777",
                    \ "guibg": "#333333",
                    \ "ctermfg": "LightGray",
                    \ "ctermbg": "DarkGray",
                \ },
                \ "hl_4": {
                    \ "guifg": "#ffbbbb",
                    \ "guibg": "#333333",
                    \ "ctermfg": "DarkRed",
                    \ "ctermbg": "DarkGray",
                \ },
                \ "no_name": "[No Name]",
                \ "mode_n": {
                    \ "": " NORMAL  ",
                    \ "guifg": "#000000",
                    \ "guibg": "#aaddee",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "Cyan",
                    \ "term": "bold",
                    \ },
                \ "mode_i": {
                    \ "": " INSERT  ",
                    \ "guifg": "#000000",
                    \ "guibg": "#aaeeaa",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightGreen",
                    \ "term": "bold",
                    \ },
                \ "mode_R": {
                    \ "": " REPLACE ",
                    \ "guifg": "#000000",
                    \ "guibg": "#ff7777",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightRed",
                    \ "term": "bold",
                    \ },
                \ "mode_v": {
                    \ "": " VISUAL  ",
                    \ "guifg": "#000000",
                    \ "guibg": "#ffff77",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightYellow",
                    \ "term": "bold",
                    \ },
                \ "mode_V": {
                    \ "": " VISUAL  ",
                    \ "guifg": "#000000",
                    \ "guibg": "#ffff77",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightYellow",
                    \ "term": "bold",
                    \ },
                \ "mode_": {
                    \ "": " VISUAL  ",
                    \ "guifg": "#000000",
                    \ "guibg": "#ffff77",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightYellow",
                    \ "term": "bold",
                    \ },
                \ "mode_c": {
                    \ "": " COMMAND ",
                    \ "guifg": "#000000",
                    \ "guibg": "#ffff77",
                    \ "gui": "bold",
                    \ "ctermfg": "Black",
                    \ "ctermbg": "LightYellow",
                    \ "term": "bold",
                    \ },
                \ "interval": 0.5,
                \ }

    "let g:Deline__hookInterval = 0.5 "seconds
    let g:Deline__hookLastReltime = reltime()

    let g:Deline__statusline = []

    let g:Deline__hooking = 0

    call deline#_initHighlight()
endfunction

function! deline#_initHighlight()
    let s:config["_hlonce"] = {} " hlname => key
    let s:last_mode = '0'
    let g:deline__meta_mode = " "

    call deline#_highlight("User1", get(s:config, "hl_1", {}))
    "
    call deline#_highlight("User3", get(s:config, "hl_3", {}))
    call deline#_highlight("User4", get(s:config, "hl_4", {}))

    redraw
endfunction

function! deline#_config(config)
    let shouldinit = 0

    for k in keys(a:config)
        if k == "" || k == "|"
            let shouldinit = 1
        endif

        let s:config[k] = a:config[k]
    endfor

    if shouldinit
        call deline#_initHighlight()
    endif
endfunction

function! deline#_highlight(name, dict)
    let hl = ""
    for k in keys(a:dict)
        if k == "" | continue | endif
        if a:dict[k] == "" | continue | endif
        let hl = hl . " " . k . "='" . a:dict[k] . "'"
    endfor
    silent execute "highlight " . a:name . " " . hl
    "redraw
endfunction

augroup Deline_FileInner
    autocmd!
    autocmd BufNewFile,BufRead * let s:fileInnerCache = {}
augroup END
let s:fileInnerBufnr = 0
let s:fileInnerCache = {} " {fmt(string): value(string)}
function! deline#fileInner(fmt)
    let bufnr = bufnr("%")
    if bufnr == s:fileInnerBufnr && has_key(s:fileInnerCache, a:fmt)
            return s:fileInnerCache[a:fmt]
    elseif bufnr != s:fileInnerBufnr
        let s:fileInnerCache = {}
    endif

    if bufname("%") == ""
        let v = ""
        if a:fmt =~ ':p:t'
            let v = get(s:config, "no_name", "[No Name]")
        else
            let v = ""
        endif

        let s:fileInnerBufnr = bufnr
        let s:fileInnerCache[a:fmt] = v
        return v
    endif

    let v = ""
    for f in split(a:fmt, "/")
        if v != ""
            let v = v . "/"
        endif

        try
            let g = matchlist(f, '^\v([^:])*(%(:\w)+)(.*)')
            let s = matchlist(g[3], '\v\[:?(\d+)\](.*)')

            if len(s) > 0
                let v = v . g[1] . join(split(expand("%" . g[2]), '\zs')[:s[1]], '') . s[2]
            else
                let v = v . g[1] . expand("%" . g[2]) . g[3]
            endif
        catch
            let v = v . expand("%" . f)
        endtry
    endfor

    let s:fileInnerBufnr = bufnr
    let s:fileInnerCache[a:fmt] = v
    return v
endfunction

function! deline#modeInner()
    let mode = mode()
    if mode == "n"
        return "NORMAL "
    elseif mode == "i"
        return "INSERT "
    elseif mode == "R"
        return "REPLACE"
    elseif mode == "v" || mode == "V" || mode == ""
        return "VISUAL "
    elseif mode == "c"
        return "COMMAND"
    else
        return "NORMAL "
    endif
endfunction

function! deline#defHLModeInner(hlname)
    let mode = mode()

    if mode != s:last_mode
        let hlinfo = get(s:config, "mode_" . mode, {})
        if empty(hlinfo)
            return ""
        endif

        call deline#_highlight(a:hlname, hlinfo)
        redraw

        let s:last_mode = mode
    endif

    return ""
endfunction

let s:last_inv_mode = '0'
function! deline#modeHLInvInner(hlname)
    let mode = mode()

    if mode != s:last_inv_mode
        let hlinfo = get(s:config, "mode_" . mode, {})
        if empty(hlinfo)
            return ""
        endif

        let hlinfo = copy(hlinfo)

        let guibg = get(hlinfo, "guifg", "")
        let guifg = get(hlinfo, "guibg", "")
        let ctermbg = get(hlinfo, "ctermfg", "")
        let ctermfg = get(hlinfo, "ctermbg", "")

        if guibg != "" | let hlinfo["guibg"] = guibg | endif
        if guifg != "" | let hlinfo["guifg"] = guifg | endif
        if ctermbg != "" | let hlinfo["ctermbg"] = ctermbg | endif
        if ctermfg != "" | let hlinfo["ctermfg"] = ctermfg | endif

        call deline#_highlight(a:hlname, hlinfo)
        redraw

        let s:last_inv_mode = mode
    endif

    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#defHLInner(hlname, key, attrs)
    let oncekey = get(s:config["_hlonce"], a:hlname, "")
    if oncekey == "" || oncekey != a:key
        let s:config["_hlonce"][a:hlname] = a:key
    else
        return ""
    endif

    "term=bold ctermfg=16 ctermbg=231 guifg=#bbbbbb guibg=#ffffff
    let hh = split(a:attrs, '\%(\\\)\@<!\(\s\|\n\)')
    let hldict = {}
    for c in hh
        let cc = split(c, "=")
        if len(cc) == 2
            let hldict[cc[0]] = cc[1]
        endif
    endfor

    call deline#_highlight(a:hlname, hldict)
    
    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#defHLInvInner(hlname, key, basehlname)
    let oncekey = get(s:config["_hlonce"], a:hlname, "")
    if oncekey == "" || oncekey != a:key
        let s:config["_hlonce"][a:hlname] = a:key
    else
        return ""
    endif

    silent let hl = deline#_parseHL(a:basehlname)
    if match(get(hl, 'gui', ''), "reverse") != -1
        let f = get(hl, 'guifg', '')
        let b = get(hl, 'guibg', '')
        if f != "" | let hl['guibg'] = f | endif
        if b != "" | let hl['guifg'] = b | endif
        let f = get(hl, 'ctermfg', '')
        let b = get(hl, 'ctermbg', '')
        if f != "" | let hl['ctermbg'] = f | endif
        if b != "" | let hl['ctermfg'] = b | endif

        let hl['gui'] = substitute(get(hl, 'gui', ''), '\v,?reverse,?', '', '')
        let hl['cterm'] = substitute(get(hl, 'cterm', ''), '\v,?reverse,?', '', '')
        let hl['term'] = substitute(get(hl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    let guibg = get(hl, "guifg", "")
    let guifg = get(hl, "guibg", "")
    let ctermbg = get(hl, "ctermfg", "")
    let ctermfg = get(hl, "ctermbg", "")

    if guibg != "" | let hl["guibg"] = guibg | endif
    if guifg != "" | let hl["guifg"] = guifg | endif
    if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif
    if ctermfg != "" | let hl["ctermfg"] = ctermfg | endif

    call deline#_highlight(a:hlname, hl)

    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#defHLAdjFGInner(hlname, key, basehlname)
    let oncekey = get(s:config["_hlonce"], a:hlname, "")
    if oncekey == "" || oncekey != a:key
        let s:config["_hlonce"][a:hlname] = a:key
    else
        return ""
    endif

    silent let hl = deline#_parseHL(a:basehlname)
    if match(get(hl, 'gui', ''), "reverse") != -1
        let f = get(hl, 'guifg', '')
        let b = get(hl, 'guibg', '')
        if f != "" | let hl['guibg'] = f | endif
        if b != "" | let hl['guifg'] = b | endif
        let f = get(hl, 'ctermfg', '')
        let b = get(hl, 'ctermbg', '')
        if f != "" | let hl['ctermbg'] = f | endif
        if b != "" | let hl['ctermfg'] = b | endif

        let hl['gui'] = substitute(get(hl, 'gui', ''), '\v,?reverse,?', '', '')
        let hl['cterm'] = substitute(get(hl, 'cterm', ''), '\v,?reverse,?', '', '')
        let hl['term'] = substitute(get(hl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    let guifg = get(hl, "guifg", "")
    let guibg = get(hl, "guibg", "")

    let bgrgb = deline#color#attr_to_rgb(guibg)
    let fgrgb = deline#color#attr_to_rgb(guifg)

    let bghsl = deline#color#hsl(bgrgb[0], bgrgb[1], bgrgb[2])
    let fghsl = deline#color#hsl(fgrgb[0], fgrgb[1], fgrgb[2])
    "echom a:hlname . ' ' . string(fgrgb) . ' ' . string(fghsl) . ' vs ' . string(bgrgb) . ' ' . string(bghsl)

    for i in range(3)
        if abs(fghsl[2] - bghsl[2]) < 25
            if bghsl[2] < 50
                let fghsl[2] = min([float2nr(fghsl[2]+fghsl[2]*1.0/3), 100])
            else
                let fghsl[2] = max([float2nr(fghsl[2]-fghsl[2]*1.0/3), 0])
            endif
        endif
    endfor

    if abs(fghsl[2] - bghsl[2]) < 25
        let fghsl[1] = (fghsl[1] + bghsl[1]) / 2
    endif

    let fgrgb = deline#color#rgb(fghsl[0], fghsl[1], fghsl[2])
    "echom '=>'. string(fghsl) . '==' . string(fgrgb)
    let guifg = printf("#%02x%02x%02x", float2nr(fgrgb[0]), float2nr(fgrgb[1]), float2nr(fgrgb[2]))

    if guifg != "" | let hl["guifg"] = guifg | endif

    call deline#_highlight(a:hlname, hl)
    "echom '=>'. a:hlname . ' ' . string(hl)

    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#defHLCombinedInner(hlname, key, fghlname, bghlname, method)
    let oncekey = get(s:config["_hlonce"], a:hlname, "")
    if oncekey == "" || oncekey != a:key
        let s:config["_hlonce"][a:hlname] = a:key
    else
        return ""
    endif

    if a:fghlname =~ "="
        silent let fghl = deline#_parseHLAttrs(a:fghlname)
    else
        silent let fghl = deline#_parseHL(a:fghlname)
    endif
    if match(get(fghl, 'gui', ''), "reverse") != -1
        let f = get(fghl, 'guifg', '')
        let b = get(fghl, 'guibg', '')
        if f != "" | let fghl['guibg'] = f | endif
        if b != "" | let fghl['guifg'] = b | endif
        let f = get(fghl, 'ctermfg', '')
        let b = get(fghl, 'ctermbg', '')
        if f != "" | let fghl['ctermbg'] = f | endif
        if b != "" | let fghl['ctermfg'] = b | endif

        let fghl['gui'] = substitute(get(fghl, 'gui', ''), '\v,?reverse,?', '', '')
        let fghl['cterm'] = substitute(get(fghl, 'cterm', ''), '\v,?reverse,?', '', '')
        let fghl['term'] = substitute(get(fghl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    if a:bghlname =~ "="
        silent let bghl = deline#_parseHLAttrs(a:bghlname)
    else
        silent let bghl = deline#_parseHL(a:bghlname)
    endif
    if match(get(bghl, 'gui', ''), "reverse") != -1
        let f = get(bghl, 'guifg', '')
        let b = get(bghl, 'guibg', '')
        if f != "" | let bghl['guibg'] = f | endif
        if b != "" | let bghl['guifg'] = b | endif
        let f = get(bghl, 'ctermfg', '')
        let b = get(bghl, 'ctermbg', '')
        if f != "" | let bghl['ctermbg'] = f | endif
        if b != "" | let bghl['ctermfg'] = b | endif

        let bghl['gui'] = substitute(get(bghl, 'gui', ''), '\v,?reverse,?', '', '')
        let bghl['cterm'] = substitute(get(bghl, 'cterm', ''), '\v,?reverse,?', '', '')
        let bghl['term'] = substitute(get(bghl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    let hl = copy(fghl)

    if a:method == "fg/bg"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" | let hl["guibg"] = guibg | endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif

    elseif a:method == "fg/fg+bg"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" 
            let rgb = deline#color#add(hl["guibg"], guibg, 0.5)
            let hl["guibg"] = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2])
        endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif

    elseif a:method == "fg/fg+bg9"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" 
            let rgb = deline#color#add(hl["guibg"], guibg, 0.9)
            let hl["guibg"] = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2])
        endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif

    elseif a:method == "fg/fg+bg7"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" 
            let rgb = deline#color#add(hl["guibg"], guibg, 0.7)
            let hl["guibg"] = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2])
        endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif

    elseif a:method == "fg/fg+bg3"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" 
            let rgb = deline#color#add(hl["guibg"], guibg, 0.3)
            let hl["guibg"] = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2])
        endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif

    elseif a:method == "fg/fg+bg1"
        let guibg = get(bghl, "guibg", "")
        let ctermbg = get(bghl, "ctermbg", "")

        if guibg != "" 
            let rgb = deline#color#add(hl["guibg"], guibg, 0.1)
            let hl["guibg"] = printf("#%02x%02x%02x", rgb[0], rgb[1], rgb[2])
        endif
        if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif
    endif

    "echom a:hlname . ' ' . string(hl) . ' ' . string(fghl) . ' ' . string(bghl)

    call deline#_highlight(a:hlname, hl)

    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#defHLSeparatorInner(hlname, key, lhlname, rhlname)
    let oncekey = get(s:config["_hlonce"], a:hlname, "")
    if oncekey == "" || oncekey != a:key
        let s:config["_hlonce"][a:hlname] = a:key
    else
        return ""
    endif

    try
        silent let lhl = deline#_parseHL(a:lhlname)
    catch
        silent let lhl = deline#_parseHL("Normal")
    endtry
    if match(get(lhl, 'gui', ''), "reverse") != -1
        let f = get(lhl, 'guifg', '')
        let b = get(lhl, 'guibg', '')
        if f != "" | let lhl['guibg'] = f | endif
        if b != "" | let lhl['guifg'] = b | endif
        let f = get(lhl, 'ctermfg', '')
        let b = get(lhl, 'ctermbg', '')
        if f != "" | let lhl['ctermbg'] = f | endif
        if b != "" | let lhl['ctermfg'] = b | endif

        let lhl['gui'] = substitute(get(lhl, 'gui', ''), '\v,?reverse,?', '', '')
        let lhl['cterm'] = substitute(get(lhl, 'cterm', ''), '\v,?reverse,?', '', '')
        let lhl['term'] = substitute(get(lhl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    try
        silent let rhl = deline#_parseHL(a:rhlname)
    catch
        silent let rhl = deline#_parseHL("Normal")
    endtry
    if match(get(rhl, 'gui', ''), "reverse") != -1
        let f = get(rhl, 'guifg', '')
        let b = get(rhl, 'guibg', '')
        if f != "" | let rhl['guibg'] = f | endif
        if b != "" | let rhl['guifg'] = b | endif
        let f = get(rhl, 'ctermfg', '')
        let b = get(rhl, 'ctermbg', '')
        if f != "" | let rhl['ctermbg'] = f | endif
        if b != "" | let rhl['ctermfg'] = b | endif

        let rhl['gui'] = substitute(get(rhl, 'gui', ''), '\v,?reverse,?', '', '')
        let rhl['cterm'] = substitute(get(rhl, 'cterm', ''), '\v,?reverse,?', '', '')
        let rhl['term'] = substitute(get(rhl, 'term', ''), '\v,?reverse,?', '', '')
    endif

    let hl = copy(lhl)

    "combine
    let guifg = get(lhl, "guibg", "")
    let ctermfg = get(lhl, "ctermbg", "")
    let guibg = get(rhl, "guibg", "")
    let ctermbg = get(rhl, "ctermbg", "")

    if guibg != "" | let hl["guibg"] = guibg | endif
    if guifg != "" | let hl["guifg"] = guifg | endif
    if ctermbg != "" | let hl["ctermbg"] = ctermbg | endif
    if ctermfg != "" | let hl["ctermfg"] = ctermfg | endif

    call deline#_highlight(a:hlname, hl)

    return ""
endfunction

function! deline#_parseHL(hlname)
    let h = ""
    silent redir => h
    try
        execute "hi " . a:hlname
    catch
        "nop!!!
    finally
        redir END
    endtry

    let h = trim(h)

    if h =~ "="
        "Comment        xxx term=bold ctermfg=16 ctermbg=231 guifg=#bbbbbb guibg=#ffffff
        let hh = substitute(h, '\w\+\s\+\w\+\s\+', '', '')
        "term=bold ctermfg=16 ctermbg=231 guifg=#bbbbbb guibg=#ffffff
        return deline#_parseHLAttrs(hh)
    elseif h =~ "links to"
        "vimComment        xxx links to Comment
        let hh = substitute(h, '.*links to \(\w\+\).*', '\1', "")
        return deline#_parseHL(hh)
    else
        return deline#_parseHL("Normal")
    endif
endfunction

function! deline#_parseHLAttrs(attrs)
    let hh = split(a:attrs, '\%(\\\)\@<!\(\s\|\n\)')
    let hldict = {}
    for c in hh
        let cc = split(c, "=")
        if len(cc) == 2
            let hldict[cc[0]] = cc[1]
        endif
    endfor
    return hldict
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#notsavedInner(min_ago)
    if &modified == 0
        return ""
    endif

    let t = undotree()
    let seq = t.seq_cur
    let s = t.save_cur

    if len(t.entries) == 0
        return ""
    endif

    " e is the last saved
    let found = 0
    for e in t.entries
        if has_key(e, "save") && e.save == s
            let found = 1
            break
        endif
    endfor
    if found == 0
        let ee = t.entries[0]
    else
        if e.seq == seq
            return ""
        endif

        " ee is the first change after save
        for ee in t.entries
            if ee.seq == e.seq + 1
                break
            endif
        endfor
    endif

    let now = localtime()
    let d = now - ee.time
    let dh = d / float2nr(60*60)
    let dm = float2nr(d % (60*60) / 60)

    if a:min_ago > dh*60 + dm
        return ""
    endif

    let result = ""
    if dh != 0
        let result = string(dh)."h"
    endif
    if dm != 0
        let result = result . string(dm)."m"
    endif
    return result

    for e in t.entries
        if has_key(e, "save") && e.save == s
            if e.seq == seq
                return ""
            endif

            " ee is the first change after save
            for ee in t.entries
                if ee.seq == e.seq + 1
                    break
                endif
            endfor

            let now = localtime()
            let d = now - ee.time
            let dh = d / float2nr(60*60)
            let dm = float2nr(d % (60*60) / 60)

            if a:min_ago > dh*60 + dm
                return ""
            endif

            let result = ""
            if dh != 0
                let result = string(dh)."h"
            endif
            if dm != 0
                let result = result . string(dm)."m"
            endif
            return result
        endif
    endfor

    return ""
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

let s:fileheadCache = {} " {filepath: {reltime: (num), modtime: (num), value: (string)}}

function! deline#fileheadInner(filepath, interval)
    if has_key(s:fileheadCache, a:filepath)
        let ht = s:fileheadCache[a:filepath]
        if reltimefloat(reltime(ht.reltime)) * 1000 < a:interval
            return ht.value
        endif
        if ht.modtime >= getftime(a:filepath)
            return ht.value
        endif
    endif

    try
        let line = readfile(expand(a:filepath), "", 1)[0]
    catch
        let line = ""
    endtr

    let s:fileheadCache[a:filepath] = {
                \ "reltime": reltime(),
                \ "modtime": getftime(a:filepath),
                \ "value": line,
                \ }

    return line
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#filetailInner(filepath, interval)
    if has_key(s:fileheadCache, a:filepath)
        let ht = s:fileheadCache[a:filepath]
        if reltimefloat(reltime(ht.reltime)) * 1000 < a:interval
            return ht.value
        endif
        if ht.modtime >= getftime(a:filepath)
            return ht.value
        endif
    endif

    try
        let line = readfile(expand(a:filepath))[-1]
    catch
        let line = ""
    endtr

    let s:fileheadCache[a:filepath] = {
                \ "reltime": reltime(),
                \ "modtime": getftime(a:filepath),
                \ "value": line,
                \ }

    return line
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

let s:fileids = {} " url => timer_id
function! deline#head(filepath, enc, interval)
    let id = get(s:fileids, a:filepath, 0)
    if id == 0
        let interval = a:interval
        if interval < 1000
            let interval = 60 * 60 * 1000
        endif

        let id = timer_start(interval, "deline#_read_head", {"repeat": -1})
        let s:fileids[a:filepath] = id
        call deline#_config_set("deline/head/" . string(id) . "/filepath", a:filepath)
        call deline#_config_set("deline/head/" . string(id) . "/enc", a:enc)
        call deline#_read_head(id)
    endif

    return "%{deline#readInner('" . string(id) . "')}"
endfunction

function! deline#tail(filepath, enc, interval)
    let id = get(s:fileids, a:filepath, 0)
    if id == 0
        let interval = a:interval
        if interval < 1000
            let interval = 60 * 60 * 1000
        endif

        let id = timer_start(interval, "deline#_read_tail", {"repeat": -1})
        let s:fileids[a:filepath] = id
        call deline#_config_set("deline/head/" . string(id) . "/filepath", a:filepath)
        call deline#_config_set("deline/head/" . string(id) . "/enc", a:enc)
        call deline#_read_tail(id)
    endif

    return "%{deline#readInner('" . string(id) . "')}"
endfunction

function! deline#readInner(id)
    let line = deline#_config_get("deline/head/" . a:id . "/content", "")
    let enc = deline#_config_get("deline/head/" . a:id . "/enc", "")
    if enc != "" && enc != &encoding && has('iconv')
        let line = iconv(line, enc, &encoding)
    endif
    return line
endfunction

function! deline#_read_head(id)
    let filepath = expand(deline#_config_get("deline/head/" . string(a:id) . "/filepath", ""))
    try
        let line = readfile(filepath, "", 1)
    catch
        let line = [""]
    endtr
    call deline#_config_set("deline/head/" . string(a:id) . "/content", line[0])
endfunction

function! deline#_read_tail(id)
    let filepath = expand(deline#_config_get("deline/head/" . string(a:id) . "/filepath", ""))
    try
        let line = readfile(filepath, "", -1)
    catch
        let line = [""]
    endtr
    call deline#_config_set("deline/head/" . string(a:id) . "/content", trim(line[0]))
endfunction
