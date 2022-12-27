""" defines a simple statusline
"""
""" sort:sample1
function! deline#example#simple()
    "
    " hi User1 ... textual part (config key "hl_1")
    " hi User2 ... mode (CHANGED IN deline#modeHL,
    "                    config key "hl_mode_" . mode())
    "
    " hi User3 ... seprator (config key "hl_3")
    " hi User4 ... cautious (config key "hl_4")
    "
    call Deline([
                \ deline#comment("mode (define User2 and change to it by hl(2))"),
                \ deline#defHLMode("User2"),
                \ deline#hl(2),
                \ deline#space(),
                \ deline#mode(),
                \ deline#space(),
                \ 
                \ deline#comment("filepath and mod, readonly flags"),
                \ deline#hl(1), deline#space(),
                \ deline#hl(4),
                \ deline#readonly('[RO] ', ''),
                \ deline#modified('+ ', ''),
                \
                \ deline#comment("v-- expand(%:p:h:t) / expand(%:p:t)"),
                \ deline#comment("deline#file(':p:h:t/:p:t'),"),
                \ deline#hl(3), deline#file(':p:h:t'), "/",
                \ deline#hl(1), deline#file(':p:t'),
                \ deline#space(),
                \ deline#hl(4), deline#notsaved(2),
                \
                \ deline#rightalign(),
                \
                \ deline#comment("\ deline#fileformat(),"),
                \ deline#dynamic#if("&fileformat!='unix'", deline#hl(4), deline#hl(1)),
                \ deline#fileformat(),
                \ deline#hl(1),
                \
                \ deline#comment("v-- separator"),
                \ deline#space(), deline#hl(3), deline#bar(), deline#hl(1), deline#space(),
                \
                \ deline#comment("\ deline#fileencoding(),"),
                \ deline#dynamic#if("&fileencoding!='utf-8'", deline#hl(4), deline#hl(1)),
                \ deline#fileencoding(),
                \ deline#hl(1),
                \
                \ deline#space(), deline#hl(3), deline#bar(), deline#hl(1), deline#space(),
                \
                \ deline#filetype(),
                \
                \ deline#space(), deline#hl(3), deline#bar(), deline#hl(1), deline#space(),
                \
                \ deline#line(), ":", deline#columnv(),
                \
                \ deline#space(),
                \ ])
                "
                " v-- Display a tail line of a textfile.
                " \ deline#hl(3), "hoge.txt: ", deline#filetail('c:/temp/hoge.txt', 5000),
                "
                " v-- Display searching string if width > 80.
                " \ deline#dynamic#if("winwidth(0) > 80 && !v:hlsearch", 
                "     \ "/" . deline#expr("getreg('/')") .
                "     \ deline#space() . deline#hl(3) . deline#bar() . deline#hl(1) . deline#space(),
                "     \ ""),
                "
                " dynamic#xxx is called on eval-time of statusline
                "
                " v-- This changes highlight according to fileencoding. 
                "     Statusline notation can't do this. (workaround exists, but noisy)
                " \ deline#dynamic#if("&fileencoding!='utf-8'", deline#hl(4), deline#hl(1)),
                "
                " v-- dynamic#periodic turns on timer (ms).
                "     This causes dynanmic#xxx evaluated periodicaly.
                " \ deline#dynamic#periodic(1000),
                " \ deline#dynamic#expr("strftime('%T')"),
                " ^-- dynamic#expr does NOT emit "a RESULT of strftime('%T')" immediately,
                "     but emits "this should return strftime('%T') on
                "     evaluation time".
                "
                " v-- animation
                " \ deline#dynamic#cyclic(['-', '\', '|', '/', '-', '\', '|', '/', '-', '-', '+', '*', '+']),
                " \ deline#dynamic#cyclic(['⣾','⣽','⣻','⢿','⡿','⡿','⣟','⣯','⣷']),

    " call DelineConfig({
    "             \ "no_name": "名無しさん@Vim",
    "             \ })

    " An example usage of DelineConfig
    " call DelineConfig({
    "             \ "mode_c": {
    "             \ "": " COMMAND ",
    "             \ "guifg": "#000000",
    "             \ "guibg": "#ffffff",
    "             \ },
    "             \ })

    silent doautocmd User DelineRefresh
endfunction

""" gradient color of mode
"""
""" It causes error in some colorschemes that are without guixxx.
""" sort:sample2
function! deline#example#gradient()
    call Deline([
                \ deline#meta#onmodechanged([
                    \ deline#defHLCombined("Deline", "", "Normal", "Normal", ""),
                    \ deline#defHLMode("DelineMode_t"),
                    \ deline#defHLCombined("DelineMode", "mode()", "DelineMode_t", "Deline", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineL", "mode()", "Deline", "DelineMode", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineLA_t", "mode()", "guifg=#aa0000 ctermfg=Red", "DelineL", ""),
                    \ deline#defHLAdjFG("DelineLA", "mode()", "DelineLA_t"),
                    \ deline#defHLCombined("DelineA", "", "guifg=#aa0000 ctermfg=Red", "Deline", ""),
                    \ 
                    \ deline#defHLCombined("DelinePath_t", "mode()", "guifg=#777777 ctermfg=LightGray", "DelineL", ""),
                    \ deline#defHLAdjFG("DelinePath", "mode()", "DelinePath_t"),
                    \ 
                    \ deline#defHLCombined("DelineR", "mode()", "DelineL", "Normal", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineR2", "mode()", "DelineR", "Normal", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineR3", "mode()", "DelineR2", "Normal", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineR4", "mode()", "DelineR3", "Normal", "fg/fg+bg3"),
                    \ 
                    \ deline#defHLCombined("DelineRA_t", "mode()", "guifg=#aa0000 ctermfg=Red", "DelineR", ""),
                    \ deline#defHLAdjFG("DelineRA", "mode()", "DelineRA_t"),
                    \ deline#defHLCombined("DelineR2A_t", "mode()", "guifg=#aa0000 ctermfg=Red", "DelineR2", ""),
                    \ deline#defHLAdjFG("DelineR2A", "mode()", "DelineR2A_t"),
                    \ ]),
                \ 
                \ deline#comment("* MODE *"),
                \ deline#hl("DelineMode"),
                \ deline#space(),
                \ deline#mode(),
                \ deline#space(),
                \ 
                \ deline#comment("* filepath/filename *"),
                \ deline#hl("DelineL"),
                \ deline#space(),
                \ deline#hl("DelineLA"),
                \ deline#readonly("[RO] ", ''),
                \ deline#modified('+ ', ''),
                \ deline#hl("DelinePath"), deline#file(':p:h:t'), "/",
                \ deline#hl("DelineL"), deline#file(':p:t'),
                \ deline#space(),
                \ deline#hl("DelineLA"), deline#notsaved(2),
                \
                \ deline#rightalign(),
                \
                \ deline#comment("\ deline#fileformat(),"),
                \ deline#hl("DelineR"),
                \ deline#space(),
                \ deline#dynamic#if("&fileformat!='unix'", deline#hl("DelineRA"), deline#hl("DelineR")),
                \ deline#fileformat(),
                \ deline#space(),
                \
                \ deline#comment("\ deline#fileencoding(),"),
                \ deline#hl("DelineR2"),
                \ deline#space(),
                \ deline#dynamic#if("&fileencoding!='utf-8'", deline#hl("DelineR2A"), deline#hl("DelineR2")),
                \ deline#fileencoding(),
                \ deline#space(),
                \
                \ deline#hl("DelineR3"),
                \ deline#space(),
                \ deline#filetype(),
                \ deline#space(),
                \
                \ deline#hl("DelineR4"),
                \ deline#space(),
                \ deline#line(), ":", deline#columnv(),
                \ deline#space(),
                \
                \ ])

    silent doautocmd User DelineRefresh
endfunction

""" powerline like definition
"""
""" It requires powerline font that contains (\ue0b0) (\ue0b1) (\ue0b2)
""" (\ue0b3) (\ue0a2)
""" sort:sample3
function! deline#example#powerful()
    call deline#_config_set("interval", 60)
    call Deline([
                \ deline#meta#onmodechanged([
                    \ deline#defHLMode("DelineMode_tmp"),
                    \ deline#defHLCombined("Deline", "", "StatusLine", "Normal", "fg/fg+bg1"),
                    \ deline#defHLCombined("DelineMode", "mode()", "Deline", "DelineMode_tmp", "fg/fg+bg7"),
                    \ 
                    \ deline#defHLCombined("DelineL", "", "Deline", "guibg=#aaaaaa", "fg/fg+bg"),
                    \ deline#defHLSeparator("DelineLSep", "mode()", "DelineL", "Deline"),
                    \ deline#defHLCombined("DelineAlert", "", "Deline", "guibg=#ff0000 ctermbg=Red", "fg/fg+bg"),
                    \ deline#defHLSeparator("DelineLAlertSep", "mode()", "DelineL", "DelineAlert"),
                    \ deline#defHLSeparator("DelineAlertSep", "mode()", "DelineAlert", "Deline"),
                    \ 
                    \ deline#defHLSeparator("DelineModeSep", "mode()", "DelineMode", "DelineL"),
                    \ 
                    \ deline#defHLCombined("DelinePath_tmp", "mode()", "guifg=#777777 ctermfg=LightGray", "DelineL", ""),
                    \ deline#defHLAdjFG("DelinePath", "mode()", "DelinePath_tmp"),
                    \
                    \ deline#defHLCombined("DelineR", "", "DelineL", "Deline", "fg/fg+bg1"),
                    \ deline#defHLCombined("DelineR2", "", "DelineR", "Deline", "fg/fg+bg1"),
                    \ deline#defHLCombined("DelineR3", "mode()", "DelineR2", "Deline", "fg/fg+bg1"),
                    \ deline#defHLCombined("DelineR4", "mode()", "DelineMode", "Deline", "fg/fg+bg3"),
                    \ deline#defHLCombined("DelineRAlert_tmp", "mode()", "guifg=#aa0000 ctermfg=Red", "DelineR", ""),
                    \ deline#defHLAdjFG("DelineRAlert", "mode()", "DelineRAlert_tmp"),
                    \ deline#defHLCombined("DelineR2Alert_tmp", "mode()", "guifg=#aa0000 ctermfg=Red", "DelineR2", ""),
                    \ deline#defHLAdjFG("DelineR2Alert", "mode()", "DelineR2Alert_tmp"),
                    \ deline#defHLSeparator("DelineSepR1", "mode()", "DelineR", "Deline"),
                    \ deline#defHLSeparator("DelineR1SepR2", "mode()", "DelineR2", "DelineR"),
                    \ deline#defHLSeparator("DelineR2SepR3", "mode()", "DelineR3", "DelineR2"),
                    \ deline#defHLSeparator("DelineR3SepR4", "mode()", "DelineR4", "DelineR3"),
                    \ ]),
                \
                \ 
                \ deline#comment("* MODE *"),
                \ deline#hl("DelineMode"),
                \ deline#space(),
                \ deline#mode(),
                \ deline#space(),
                \
                \ deline#comment("* MODE->Normal *"),
                \ deline#hl("DelineModeSep"),
                \ "\ue0b0",
                \ 
                \ deline#comment("* branch *"),
                \ deline#hl("DelineL"),
                \ deline#example#powerful_branch(),
                \ "%{deline#example#powerful_branchInner()}",
                \ deline#space(),
                \ 
                \ deline#comment("* filepath/filename *"),
                \ deline#readonly("\ue0a2", ''),
                \ deline#hl("DelinePath"), deline#file(':p:h:t[:4]'), "/",
                \ deline#hl("DelineL"), deline#file(':p:t'),
                \ deline#space(),
                \
                \ deline#comment("* modified sign and separator *"),
                \ deline#hl("DelineLAlertSep"),
                \ deline#modified("\ue0b0", ''),
                \ deline#hl("DelineAlert"),
                \ deline#modified(" + ", ''),
                \ deline#hl("DelineAlertSep"),
                \ deline#modified("\ue0b0", ''),
                \
                \ deline#hl("DelineLSep"),
                \ deline#modified('', "\ue0b0"),
                \ 
                \ deline#hl("Deline"),
                \ 
                \ deline#rightalign(),
                \
                \ deline#hl("DelineSepR1"),
                \ "\ue0b2",
                \ 
                \ deline#comment("\ deline#fileformat(),"),
                \ deline#hl("DelineR"),
                \ deline#space(),
                \ deline#dynamic#if("&fileformat!='unix'", deline#hl("DelineRAlert"), deline#hl("DelineR")),
                \ deline#fileformat(),
                \ deline#space(),
                \
                \ deline#hl("DelineR1SepR2"),
                \ "\ue0b2",
                \
                \ deline#comment("\ deline#fileencoding(),"),
                \ deline#hl("DelineR2"),
                \ deline#space(),
                \ deline#dynamic#if("&fileencoding!='utf-8'", deline#hl("DelineR2Alert"), deline#hl("DelineR2")),
                \ deline#fileencoding(),
                \ deline#space(),
                \
                \ deline#hl("DelineR2SepR3"),
                \ "\ue0b2",
                \
                \ deline#hl("DelineR3"),
                \ deline#space(),
                \ deline#filetype(),
                \ deline#space(),
                \
                \ deline#hl("DelineR3SepR4"),
                \ "\ue0b2",
                \
                \ deline#hl("DelineR4"),
                \ deline#space(),
                \ deline#line(), ":", deline#columnv(),
                \ deline#space(),
                \ ])

    silent doautocmd User DelineRefresh
endfunction

function! deline#example#powerful_branchInner()
    let b = deline#_config_get("sample/powerful/branch", "")
    if b != ""
        return "\ue0a0" . b . " \ue0b1"
    else
        return ""
    endif
endfunction

function! deline#example#powerful_branch_cb(ch, msg)
    let msg = trim(a:msg)
    if match(msg, "* ") == 0
        let msg = msg[2:]
    endif
    call deline#_config_set("sample/powerful/branch", msg)
endfunction

function! deline#example#powerful_branch_err_cb(ch, msg)
    call deline#_config_set("sample/powerful/branch", "")
endfunction

function! deline#example#powerful_branch()
    let d = {}
    function! d.eval() dict
        call job_start("git branch", {"out_cb": "deline#example#powerful_branch_cb", "err_cb": "deline#example#powerful_branch_err_cb"})
        call job_start("hg branch", {"out_cb": "deline#example#powerful_branch_cb", "err_cb": "deline#example#powerful_branch_err_cb"})
        return ""
    endfunction
    "    try
    "        let resp = trim(system("git branch"))
    "        if v:shell_error == 0
    "            let resp = resp[2:]
    "        else
    "            let resp = trim(system("hg branch"))
    "            if v:shell_error != 0
    "                return ""
    "            endif
    "        endif
    "        if resp != ""
    "            return "\ue0a0" . resp . " \ue0b1"
    "        endif
    "    catch
    "        return ""
    "    endtry
    return d
endfunction

""" expanded area in large size window
"""
""" sort:sample4
function! deline#example#expandable()
        call Deline([
                \ deline#dynamic#periodic(50),
                \ deline#comment('deline#defHL("Deline", "", "guifg=#cccccc guibg=#333333 ctermfg=White ctermbg=DarkGray"),'),
                \ deline#defHLMode("DelineMode"),
                \ deline#meta#onmodechanged([
                    \ deline#defHLCombined("Deline", "", "StatusLine", "StatusLine", ""),
                    \ deline#defHLSeparator("DelineModeSep", "mode()", "DelineMode", "Deline"),
                    \ deline#defHLCombined("DelineName", "", "Deline", "Deline", ""),
                    \ deline#defHLCombined("DelinePath", "", "guifg=#777777 ctermfg=LightGray", "Deline", ""),
                    \ deline#defHLCombined("DelineAlert", "","guifg=#ffbbbb ctermfg=DarkRed", "Deline", ""),
                    \ deline#defHLSeparator("DelineSep", "", "Deline", "Normal"),
                    \
                    \ deline#defHLInv("Deline2", "", "Deline"),
                    \ deline#defHLCombined("Deline2SepMini", "", "", "Deline2", ""),
                    \ deline#defHLCombined("Deline2Alert", "", "guifg=#aa0000 ctermfg=DarkRed", "Deline2", ""),
                    \ deline#defHLSeparator("DelineSep2", "", "Deline2", "Deline"),
                    \ deline#defHLSeparator("DelineSep2Inv", "", "Deline", "Deline2"),
                    \ ]),
                \ 
                \ deline#hl("DelineMode"),
                \ deline#space(),
                \ deline#mode(),
                \ deline#space(),
                \ deline#hl("DelineModeSep"),
                \ "\ue0b0",
                \
                \ deline#comment("filepath and mod, readonly flags"),
                \ deline#hl("DelineName"),
                \ deline#space(),
                \ deline#readonly("\U1f512 \ue0b1 ", ''),
                \
                \ deline#comment("v-- expand(%:p:h:t) / expand(%:p:t)"),
                \ deline#comment("deline#file(':p:h:t/:p:t'),"),
                \ deline#hl("DelinePath"), deline#file(':p:h:t'), "/",
                \ deline#hl("DelineName"), deline#file(':p:t'),
                \ deline#space(),
                \ deline#hl("DelineAlert"),
                \ deline#modified("\ue0b1 + ", ''),
                \ deline#hl("DelineAlert"), deline#notsaved(2),
                \ deline#space(),
                \
                \ deline#hl("DelineSep"),
                \ "\ue0b0",
                \
                \ deline#rightalign(),
                \
                \ deline#hl("DelineSep"),
                \ "\ue0b2",
                \
                \ deline#hl("Deline"),
                \ deline#space(),
                \ "\U1F4C4", deline#comment("page icon"),
                \
                \ deline#dynamic#if("winwidth(0) > 80", 
                    \ deline#hl("DelineSep2") .
                    \ "\ue0b2" .
                    \ deline#hl("Deline2") .
                    \
                    \ deline#comment('\ deline#space() . "\ue0b3" . deline#space() .') .
                    \
                    \ deline#space().
                    \ deline#expr("strftime('%T')") .
                    \
                    \ deline#space().
                    \ deline#hl("DelineSep2Inv").
                    \ "\ue0b2".
                    \ deline#hl("Deline").
                    \ deline#space(),
                    \ deline#space()),
                \
                \ deline#space(),
                \ deline#comment("\ deline#fileformat(),"),
                \ deline#dynamic#if("&fileformat!='unix'", deline#hl("DelineAlert"), deline#hl("Deline")),
                \ deline#fileformat(),
                \
                \ deline#comment("v-- separator"),
                \ deline#comment('\ deline#space(), deline#hl(3), "\ue0b3", deline#hl(1), deline#space(),'),
                \ deline#space(),
                \ deline#hl("DelineSep2"),
                \ "\ue0b2",
                \ deline#hl("Deline2"),
                \ deline#space(),
                \ deline#space(),
                \
                \ deline#comment("\ deline#fileencoding(),"),
                \ deline#dynamic#if("&fileencoding!='utf-8'", deline#hl("Deline2Alert"), deline#hl("Deline2")),
                \ deline#fileencoding(),
                \
                \ deline#comment('\ deline#space(), deline#hl(3), "\ue0b3", deline#hl(1), deline#space(),'),
                \ deline#space(),
                \ deline#hl("DelineSep2Inv"),
                \ "\ue0b2",
                \ deline#hl("Deline"),
                \ deline#space(),
                \ deline#space(),
                \
                \ deline#filetype(),
                \
                \ deline#comment('\ deline#space(), deline#hl(3), "\ue0b3", deline#hl(1), deline#space(),'),
                \ deline#space(),
                \ deline#hl("DelineSep2"),
                \ "\ue0b2",
                \ deline#hl("Deline2"),
                \ deline#space(),
                \
                \ deline#line(), ":", deline#columnv(),
                \
                \ deline#space(),
            \ ])

    silent doautocmd User DelineRefresh
endfunction
