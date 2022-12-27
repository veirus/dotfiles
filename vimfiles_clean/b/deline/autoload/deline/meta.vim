let g:deline__meta_mode = " "

""" (EXPERIMENTAL) manipulates {stlist} (a list of `deline#xxx()`), each element is evaluated only when mode is changed.
""" sort:meta
function! deline#meta#onmodechanged(stlist)
    let stlist = copy(a:stlist)
    for i in range(len(stlist))
        let s = stlist[i]
        if s =~ "%{"
            let stlist[i] = "%{(mode()!=g:deline__meta_mode)?(" . s[2:len(s)-2] . "):''}"
        endif
    endfor

    return join(stlist,"") . "%{deline#meta#_setmode(mode())}"
endfunction

function! deline#meta#_setmode(mode)
    let g:deline__meta_mode = a:mode
    return ""
endfunction
