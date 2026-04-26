function! ScrollDown()
    let l:popups = popup_list()
    if !empty(l:popups)
        " LSP Hover Window
        let l:winid = l:popups[-1]
        let l:pos = popup_getpos(l:winid)
        let l:line = l:pos.firstline + 8  " Scroll 8 lines down
        call popup_setoptions(l:winid, {'firstline': l:line})
    else
        " Code Buffer Half-page down
        execute "normal! \<C-d>"
    endif
endfunction

function! ScrollUp()
    let l:popups = popup_list()
    if !empty(l:popups)
        " LSP Hover Window
        let l:winid = l:popups[-1]
        let l:pos = popup_getpos(l:winid)
        let l:line = l:pos.firstline - 8  " Scroll 8 lines up
        if l:line < 1 | let l:line = 1 | endif
        call popup_setoptions(l:winid, {'firstline': l:line})
    else
        " Code Buffer Half-page up
        execute "normal! \<C-u>"
    endif
endfunction

nnoremap <silent> <C-j> :call ScrollDown()<CR>
nnoremap <silent> <C-k> :call ScrollUp()<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> gR <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
