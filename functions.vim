" Search zeal based on the filetyp and the word under the cursor
function OpenInZeal()
  let type = &filetype
  if type == "sh"
    let type = "bash" 
  elseif type == "scss"
    let type = "sass" 
  endif
  exec "silent !zeal " . type . ":" . expand("<cword>") . "&" 
  redraw!
endfun

" Functions assumes that the emacs is running in daemon mode
" Open the current file in emacs client
function OpenInEmacs()
  exec "silent !emacsclient -c " . expand("%:p") . "&"
  redraw!
endfun
