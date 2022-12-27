" in after/ftplugin/javascript.vim
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*[^/,\\":=]*\\s*[:=]*\\s*\\(class\\\|function\\\|define\\\|export\\s\\(default\\)*\\)[('\"]\\{-\\}

" augroup js_prettier
" 	autocmd!
" 	autocmd FocusLost * silent! wall | PrettierAsync
" augroup end
