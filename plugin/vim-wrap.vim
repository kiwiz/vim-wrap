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

function Wincmd(arg)
  if !has_key(s:opp, a:arg)
    return
  endif
  let l:n = winnr()
  exec 'wincmd' a:arg
  if winnr() == l:n
    exec winnr('$') 'wincmd' s:opp[a:arg]
  endif
endfunction

nmap <C-w>j :call Wincmd('j')<cr>
nmap <C-w>k :call Wincmd('k')<cr>
nmap <C-w>h :call Wincmd('h')<cr>
nmap <C-w>l :call Wincmd('l')<cr>
