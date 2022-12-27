function! deline#color#attr_to_rgb(attr)
    let cl = a:attr[1:]
    if strlen(cl) == 3
        let r = str2nr(cl[0], 16) * 16 * 1.0
        let g = str2nr(cl[1], 16) * 16 * 1.0
        let b = str2nr(cl[2], 16) * 16 * 1.0
    else
        let r = str2nr(cl[0:1], 16) * 1.0
        let g = str2nr(cl[2:3], 16) * 1.0
        let b = str2nr(cl[4:5], 16) * 1.0
    endif

    return [float2nr(r), float2nr(g), float2nr(b)]
endfunction

function! deline#color#add(attr1, attr2, percent)
    let rgb1 = deline#color#attr_to_rgb(a:attr1)
    let rgb2 = deline#color#attr_to_rgb(a:attr2)

    let r = float2nr(rgb1[0] * (1-a:percent) + rgb2[0]*a:percent + 0.5)
    let g = float2nr(rgb1[1] * (1-a:percent)  + rgb2[1]*a:percent + 0.5)
    let b = float2nr(rgb1[2] * (1-a:percent)  + rgb2[2]*a:percent + 0.5)

    return [r, g, b]
endfunction

function! deline#color#hsl(r, g, b)
    let r = a:r
    let g = a:g
    let b = a:b

    " min float
    let rgbmin = r
    if g < rgbmin | let rgbmin = g | endif
    if b < rgbmin | let rgbmin = b | endif
    " max float
    let rgbmax = r
    if rgbmax < g | let rgbmax = g | endif
    if rgbmax < b | let rgbmax = b | endif

    " H
    if r == g && g == b
        let h = 0
    elseif r == rgbmax
        let h = 60 * (g-b) / (rgbmax-rgbmin)
    elseif g == rgbmax
        let h = 60 * (b-r) / (rgbmax-rgbmin) + 120
    elseif b == rgbmax
        let h = 60 * (r-g) / (rgbmax-rgbmin) + 240
    endif

    " L
    let l = 1.0*(rgbmax + rgbmin) / 2 / 255

    " S
    if l <= 0.5
        let s = 1.0*(rgbmax - rgbmin) / (rgbmax + rgbmin)
    else
        let s = 1.0*(rgbmax - rgbmin) / (2 * 255 - rgbmax + rgbmin)
    endif

    return [float2nr(h),float2nr(s*100),float2nr(l*100)]
endfunction

function! deline#color#rgb(h, s, l)
    let h = a:h
    let s = 1.0*a:s / 100
    let l = 1.0*a:l / 100

    if l <= 0.5
        let rgbmax = (l + l * s) * 255
        let rgbmin = (l - l * s) * 255
    else
        let rgbmax = (l + (1.0-l)*s) * 255
        let rgbmin = (l - (1.0-l)*s) * 255
    endif

    if 0 <= h && h < 60
        let r = rgbmax
        let g = (h/60)*(rgbmax-rgbmin)+rgbmin
        let b = rgbmin
    elseif 60 <= h && h < 120
        let r = ((120-h)/60)*(rgbmax-rgbmin)+rgbmin
        let g = rgbmax
        let b = rgbmin
    elseif 120 <= h && h < 180
        let r = rgbmin
        let g = rgbmax
        let b = ((h-120)/60)*(rgbmax-rgbmin)+rgbmin
    elseif 180 <= h && h < 240
        let r = rgbmin
        let g = ((240-h)/60)*(rgbmax-rgbmin)+rgbmin
        let b = rgbmax
    elseif 240 <= h && h < 300
        let r = ((h-240)/60)*(rgbmax-rgbmin)+rgbmin
        let g = rgbmin
        let b = rgbmax
    elseif 300 <= h && h < 360
        let r = rgbmax
        let g = rgbmin
        let b = ((360-h)/60)*(rgbmax-rgbmin)+rgbmin
    else
        let r = rgbmax
        let g = rgbmax
        let b = rgbmax
    endif

    return [float2nr(r),float2nr(g),float2nr(b)]
endfunction
