"""returns {expr} dynamically.
"""{expr} is a string of Vim expression like function call.
"""Unlike |deline#expr()|, this function does not return string to be
"""passed to statusline. This returns an object that holds "return the
"""result of evaluation".
"""
"""Example: >
"""	call Deline([
"""	    \ deline#comment("(1)"),
"""	    \ deline#dynamic#expr("strftime('%T')"),
"""	    \ 
"""	    \ deline#comment("(2)"),
"""	    \ deline#expr("strftime('%T')"),
"""	    \ ])
"""<
"""	(1) At EVERY evaluation of statusline, dynamically returns the
"""	    result of strftime('%T').
"""	(2) At ONCE, returns the result of strftime('%T').
"""sort:dynamic
function! deline#dynamic#expr(expr)
    let d = {"expr": a:expr}
    function! d.eval() dict
        return eval(self.expr)
    endfunction
    return d
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! deline#dynamic#system(cmd)
    let d = {"cmd": a:cmd}
    function! d.eval() dict
        try
            let resp = trim(system(self.cmd))
            if v:shell_error != 0
                return ""
            else
                return resp
            endif
        catch
            return ""
        endtry
    endfunction
    return d
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""if eval({expr}) then {t} else {f}
"""Dynamically returns {t} or {f} by eval({expr}).
"""sort:dynamic
function! deline#dynamic#if(expr, t, f)
    let d = {
                \ "expr": a:expr,
                \ "t": a:t,
                \ "f": a:f,
                \ }
    function! d.eval() dict
        let v = eval(self.expr) ? self.t : self.f
        return deline#dynamic#_eval(v)
    endfunction
    return d
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""(EXPERIMENTAL) if mode is chaned, {t} is evaluated.
"""Use |deline#serial()| to eval multiple functions.
"""sort:dynamic
function! deline#dynamic#if_mode_changed(t)
    let d = {
                \ "mode": "",
                \ "t": a:t,
                \ }
    function! d.eval() dict
        let m = mode()
        if m != self.mode
            let self.mode = m
            return deline#dynamic#_eval(self.t)
        else
            return ""
        endif
    endfunction
    return d
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""elem of {list} one by one
"""{list} is a list of text.
"""Changes texts one by one on every evaluation.
"""
"""Example: >
"""    call Deline([
"""        \ deline#dynamic#cyclic(["a", "b", "c"]),
"""        \ ])
"""<
"""        * moving cursor ...
"""        ______________________________________ 
"""        a
"""        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
"""        ______________________________________ 
"""        b
"""        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
"""        ______________________________________ 
"""        c
"""        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
"""        ______________________________________ 
"""        a
"""        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
"""sort:dynamic
function! deline#dynamic#cyclic(list)
    let d = {
                \ "list": a:list,
                \ "seq": 0
                \ }
    function! d.eval() dict
        let seq = self.seq + 1
        if seq > len(self.list)
            let seq = 0
        endif
        let self.seq = seq
        return self.list[seq-1]
    endfunction
    return d
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

let s:periodic_timer_id = 0

"""defines {period} by millisecond.
"""Start timer so that |deline-dynamic-functions| are called periodicaly.
"""Non-dynamic functions are not in effect by this function.
"""
"""Without calling this function, all dynamic functions are only
"""evaluated as statusline is evaluated.
"""(Moving cursor, changing mode, ...)
"""
"""Example1: >
"""    call Deline([
"""        \ deline#comment("(1)"),
"""        \ deline#dynamic#periodic(100),
"""        \
"""        \ deline#comment("(2)"),
"""        \ deline#dynamic#expr("strftime('%T')"),
"""        \
"""        \ deline#comment("(3)"),
"""        \ deline#expr("strftime('%T')"),
"""        \ ])
"""<
"""    (1) Declare period is 100ms.
"""    (2) Dynamic expr is evaluated every period.
"""    (3) This non-dynamic expr is evaluated once before call
"""        Deline().
"""
"""Example2: >
"""    call Deline([
"""        \ deline#comment("(1) NO deline#dynamic#periodic()"),
"""
"""        \ deline#comment("(2)"),
"""        \ deline#dynamic#expr("strftime('%T')"),
"""        \
"""        \ deline#comment("(3)"),
"""        \ deline#expr("strftime('%T')"),
"""        \ ])
"""<
"""    (1) NO deline#dynamic#periodic().
"""    (2) Dynamic expr is evaluated every re-evaluation of
"""        statusline.
"""    (3) This non-dynamic expr is evaluated once before call
"""        Deline().
"""sort:dynamic
function! deline#dynamic#periodic(period)
    let d = {"period": a:period}
    function! d.eval() dict
        if s:periodic_timer_id == 0
            let s:periodic_timer_id = timer_start(self.period, "deline#dynamic#_reload", {'repeat': -1})
        endif
        return ""
    endfunction
    return d
endfunction

function! deline#dynamic#_reload(id)
    "call timer_stop(a:id)

    " invokes deline#dynamic#_hook
    let temp = &statusline
    let &statusline = ""
    let &statusline = temp
endfunction

"==================================================

function! deline#dynamic#_hook(interval)
    if g:Deline__hooking | return | endif

    let interval = reltimefloat(reltime(g:Deline__hookLastReltime))
    if interval <= a:interval | return "" | endif
    let g:Deline__hookLastReltime = reltime()

    let g:Deline__hooking = 1
    call deline#_apply()
    let g:Deline__hooking = 0

    return ""
endfunction

function! deline#dynamic#_eval(v)
    if type(a:v) == 4 "Dict
        return a:v.eval()
    else
        return a:v
    endif
endfunction
