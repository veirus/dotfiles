# Deline -- A lightweight statusline plugin with construction functionality.

(Read plugin/deline.vim how to use Deline and how to configure your statusline.)

## Features

* A lightweight statusline definition
* With DSL -> statusline-expression library
  * Readable
  * Extensible
  * Dynamic evaluation added

## Screenshot

![Imgur](https://i.imgur.com/t3fQPlc.png)

## Examples

### Statusline definition

This is a default definition of statusline by Deline.

```vim
call Deline([
    \ deline#comment("mode (define User2 and change to it by hl(2)"),
    \ deline#modeHL("User2"),
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
```

### Without default definition

To prevent Deline from overwriting statusline with Deline's default definition, add the line below in your vimrc.

```vim
let g:Deline_DefaultDefinitions = 0
```

### Configuration

Call `DelineConfig`  to configure highlights and literals.

#### Mode

This example defines COMMAND mode.

```vim
" "mode_c" is ( "mode_" . mode() ).
" "" is a string displayed in statusline.
" "guifg", "guibg", ... is a part of highlight definition.
call DelineConfig({
    \ "mode_c": {
    \ "": " COMMAND ",
    \ "guifg": "#000000",
    \ "guibg": "#ffffff",
    \ },
    \ })

```

