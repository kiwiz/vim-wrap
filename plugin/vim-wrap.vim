" vim-wrap - allow window movement to wrap

if exists("g:loaded_wrap")
  finish
endif
let g:loaded_wrap = 1

let s:opp = {
\ 'j': 'k',
\ 'k': 'j',
\ 'h': 'l',
\ 'l': 'h',
\}

function Wincmd(arg, ...)
  let l:wrap = get(a:, 1, v:true)
  if !has_key(s:opp, a:arg)
    return
  endif

  let l:n = winnr()
  exec 'wincmd' a:arg
  if winnr() == l:n && l:wrap
    exec winnr('$') 'wincmd' s:opp[a:arg]
    return v:true
  endif
  return v:false
endfunction

nmap <silent> <C-w>j :call Wincmd('j')<cr>
nmap <silent> <C-w>k :call Wincmd('k')<cr>
nmap <silent> <C-w>h :call Wincmd('h')<cr>
nmap <silent> <C-w>l :call Wincmd('l')<cr>
