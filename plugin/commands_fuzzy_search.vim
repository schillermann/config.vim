function! s:FuzzySearchNmap(args)
    if empty(a:args)
        echo "Usage: :Fnmap <search terms>"
        echo "Example: :Fnmap open explorer"
        echo "Description: Fuzzy search normal mode mappings"
        return
    endif
    execute 'filter /\c' . substitute(a:args, ' ', '.*', 'g') . '/ nmap'
endfunction

function! s:FuzzySearchImap(args)
    if empty(a:args)
        echo "Usage: :Fimap <search terms>"
        echo "Example: :Fimap completion"
        echo "Description: Fuzzy search insert mode mappings"
        return
    endif
    execute 'filter /\c' . substitute(a:args, ' ', '.*', 'g') . '/ imap'
endfunction

function! s:FuzzySearchVmap(args)
    if empty(a:args)
        echo "Usage: :Fvmap <search terms>"
        echo "Example: :Fvmap select"
        echo "Description: Fuzzy search visual mode mappings"
        return
    endif
    execute 'filter /\c' . substitute(a:args, ' ', '.*', 'g') . '/ vmap'
endfunction

function! s:FuzzySearchMap(args)
    if empty(a:args)
        echo "Usage: :Fmap <search terms>"
        echo "Example: :Fmap fuzzy"
        echo "Description: Fuzzy search all mode mappings"
        return
    endif
    execute 'filter /\c' . substitute(a:args, ' ', '.*', 'g') . '/ map'
endfunction

command! -nargs=* CommandSearchNormal call s:FuzzySearchNmap(<q-args>)
command! -nargs=* CommandSearchInsert call s:FuzzySearchImap(<q-args>)
command! -nargs=* CommandSearchVisual call s:FuzzySearchVmap(<q-args>)
command! -nargs=* CommandSearch call s:FuzzySearchMap(<q-args>)

function! s:FuzzySearchCmd(args)
    if empty(a:args)
        echo "Usage: :Fcmd <search terms>"
        return
    endif
    let l:pattern = substitute(a:args, '\s\+', '.*', 'g')
    " We use 'command' instead of 'map'
    execute 'filter /\c' . l:pattern . '/ command'
endfunction

command! -nargs=* Fcmd call s:FuzzySearchCmd(<q-args>)  " " fuzzy search for cmd
