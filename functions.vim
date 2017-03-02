" Search zeal with 
" filetype:word_under_cursor

function OpenInZeal()
  exec "silent !zeal " . &filetype . ":" . expand("<cword>") . "&" 
  redraw!
endfun

nnoremap gz : call OpenInZeal()<CR>
