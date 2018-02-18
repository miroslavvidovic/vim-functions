" Search Zeal documentation based on the filetype and the word under the cursor
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

" Function assumes that emacs is running in daemon mode
" Open the current file in emacs client
function OpenInEmacs()
  exec "silent !emacsclient -c " . expand("%:p") . "&"
  redraw!
endfun

" Open the current file in firefox
function Firefox()
  exec "silent !firefox &> /dev/null 2>&1 " . expand("%") . "&"
  redraw!
endfun

" Trim the trailing whitespaces in the current buffer
function TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Clear all registers
function ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
  let i=0 
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""' 
    let i=i+1 
  endwhile 
  unlet regs
endfun
