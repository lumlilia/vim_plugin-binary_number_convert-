function! binary_number_convert#BtoN(mode = 0, out = 'd') abort
  if match(a:out, '\v^(o|d|x)$') == -1
    echo 'Oct: "o", Dec: "d", Hex: "x"'
    return
  endif

  let ec = 0
  let sr = 0
  let sc = 0
  let getl = getline('.')

  if a:mode
    normal `>
    let er = line('.')
    let ec = col('.') - 1

    normal `<
    let sr = line('.')
    let sc = col('.') - 1

    if sr != er
      echo 'Please select one row'
      return
    endif

  else
    if match(getl[col('.') - 1], '[0-1]') == -1
      return
    endif

    let ec = col('.') - 1
    let sr = line('.')
    let sc = match(getl[:ec], '[0-1]*$')
    call cursor(sr, sc + 1)
  endif

  let getl = getl[sc:ec]

  while 1
    let xmove = match(getl, '[0-1]')

    if xmove == -1
      break
    endif

    let getl = getl[xmove:]
    call cursor(sr, col('.') + xmove)

    let m = match(getl, '[^0-1]')

    if m == -1
      let m = 0
    endif

    let n = getl[:(m - 1)]
    let s = printf('%' . a:out, str2nr(n, 2))
    let nlen = strlen(n)
    let slen = strlen(s)
    if a:out == 'x' && slen % 2
      let s = '0' . s
      let slen += 1
    endif

    execute ':normal v' . (nlen == 1 ? '' : ((nlen - 1) . 'l')) . 's' . s
    call cursor(sr, col('.') + 1)

    let getl = getl[nlen:]
  endwhile
endfunction
