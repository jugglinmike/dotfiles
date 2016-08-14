function! journal#Journal()
  let filename = system("journal")

  " The captured output will include a trailing newline which must be removed.
  let $trimmed = substitute(filename, "\n", "", "g")

  tabnew $trimmed
endfunction
