" https://denvaar.github.io/trash/mix_format_vim.html
function elixir#formatting#on_mix_format_exit(id, data, event)
  if a:data > 0
    echom "⚠ mix format "
  else
    execute 'checktime'
    echom "✓ mix format "
  endif
endfunction

function elixir#formatting#mix_format()
  let l:filepath = expand('%:p')
  let l:mixformatcmd = 'nohup mix format '
        \. l:filepath
        \. ' 2>&1 > /dev/null'

  call jobstart(
        \['bash', '-c', mixformatcmd],
        \{'detach': 1,
        \ 'on_exit': function(
        \ 'elixir#formatting#on_mix_format_exit')})
endfunction
