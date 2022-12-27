let s:weatherids = {} " url => timer_id
"
""" fetch & displays weather info from weatherhacks site. 
""" Tokyo: http://weather.livedoor.com/weather_hacks/ical
""" sort:extra
function! deline#extra#weatherhacks(url, interval)
    let id = get(s:weatherids, a:url, 0)
    if id == 0
        let interval = a:interval
        if interval < 1000
            let interval = 60 * 60 * 1000
        endif

        let id = timer_start(interval, "deline#extra#_weather", {"repeat": -1})
        let s:weatherids[a:url] = id
        call deline#_config_set("deline/extra/weather/" . string(id) . "/url", a:url)
        call deline#extra#_weather(id)
    endif
    "echom 'weatherhacks ' . a:url . ' ' . interval . ' => ' . id

    return "%{deline#extra#weatherhacksInner('" . string(id) . "')}"
endfunction

function! deline#extra#weatherhacksInner(id)
    let w = deline#_config_get("deline/extra/weather/" . a:id . "/content", "")
    "echom 'deline#extra#weatherhacksInner(' . a:id . '): ' . w
    return w
endfunction

function! deline#extra#_weather(id)
    let url = deline#_config_get("deline/extra/weather/" . a:id . "/url", "")
    if url == ""
        return
    endif
    "echom '_weather ' . url

    try
        let res = webapi#http#get(url)

        let mode = 0
        let now = strftime('%Y-%m-%d')
        for line in split(res.content, '\n')
            if mode == 0 
                if line =~ '^UID:.*' . now
                    let mode = 1
                endif
            elseif mode == 1
                if line =~ '^SUMMARY:.*'
                    let line = trim(strpart(line, 8))
                    let line = substitute(line, '\v(晴)', "\U00002600 \\1", -1)
                    let line = substitute(line, '\v(曇)', "\U00002601 \\1", -1)
                    let line = substitute(line, '\v(雨)', "\U00002602 \\1", -1)
                    let line = substitute(line, '\v(雪)', "\U00002603 \\1", -1)
                    call deline#_config_set("deline/extra/weather/" . string(a:id) . "/content", line)
                    "echom 'deline#_weather(' . a:id . '): ' . trim(strpart(line, 8))
                    return
                endif
            endif
        endfor
    catch ex
        "echom ex
    endtry

    call deline#_config_set("deline/extra/weather/" . string(a:id) . "/content", "")
endfunction

"- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

