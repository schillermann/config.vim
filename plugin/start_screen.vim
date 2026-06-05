let s:start_content = [
    \ "            Welcome Back, Mario",
    \ "",
    \ "o  Open New File  :enew",
    \ "q  Quit Vim       :q",
    \ "",
    \ "<space>c  Custom commands  :CustomCommands",
    \ "<space>e  Open explorer    :Explore",
    \ "<space>g  Git status       :0G",
    \ "",
    \ "gd  definition",
    \ "gs  document symbol search",
    \ "gS  workspace symbol search",
    \ "gr  references",
    \ "gi  implementation",
    \ "gt  type definition",
    \ "gR  rename",
    \ "]g  next diagnostic",
    \ "[g  previous diagnostic",
    \ "K   hover"
    \ ]

function! StartScreen(content)
    " Only run if Vim was opened with no arguments/files
    if argc() == 0
        " Clear the screen and open a blank buffer
        enew
        " Set buffer options so it doesn't try to save this screen
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal nobuflisted
        setlocal nonumber
        setlocal norelativenumber
        setlocal signcolumn=no

        " Calculate max width of the text block
        let l:max_width = 0
        for l:line in a:content
            if strlen(l:line) > l:max_width
                let l:max_width = strlen(l:line)
            endif
        endfor

        " Get window dimensions
        let l:win_width = winwidth(0)
        let l:win_height = winheight(0)

        " Calculate padding
        let l:h_pad_len = (l:win_width - l:max_width) / 2
        let l:v_pad_len = (l:win_height - len(a:content)) / 2

        if l:h_pad_len < 0 | let l:h_pad_len = 0 | endif
        if l:v_pad_len < 0 | let l:v_pad_len = 0 | endif

        let l:h_pad = repeat(" ", l:h_pad_len)
        let l:v_pad = repeat([""], l:v_pad_len)

        " Prepare final lines
        let l:output = l:v_pad
        for l:line in a:content
            call add(l:output, l:h_pad . l:line)
        endfor

        " Set buffer content
        call setline(1, l:output)

        setlocal nomodifiable
        normal! gg
    endif
endfunction

autocmd VimEnter * call StartScreen(s:start_content)
