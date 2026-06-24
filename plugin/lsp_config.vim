vim9script

def ScrollDown()
    var popups = popup_list()
    if !empty(popups)
        # LSP Hover Window
        var winid = popups[-1]
        var pos = popup_getpos(winid)
        var line = pos.firstline + 8  # Scroll 8 lines down
        popup_setoptions(winid, {firstline: line})
    else
        # Code Buffer Half-page down
        exe "norm! \<C-d>"
    endif
enddef

def ScrollUp()
    var popups = popup_list()
    if !empty(popups)
        # LSP Hover Window
        var winid = popups[-1]
        var pos = popup_getpos(winid)
        var line = pos.firstline - 8  # Scroll 8 lines up
        if line < 1 | line = 1 | endif
        popup_setoptions(winid, {firstline: line})
    else
        # Code Buffer Half-page up
        exe "norm! \<C-u>"
    endif
enddef

nnoremap <silent> <C-j> :call ScrollDown()<CR>
nnoremap <silent> <C-k> :call ScrollUp()<CR>

def OnLspBufferEnabled()
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    
    nnoremap <buffer> gd <plug>(lsp-definition)
    nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
    nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nnoremap <buffer> gr <plug>(lsp-references)
    nnoremap <buffer> gi <plug>(lsp-implementation)
    nnoremap <buffer> gt <plug>(lsp-type-definition)
    nnoremap <buffer> gR <plug>(lsp-rename)
    nnoremap <buffer> [g <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> ]g <plug>(lsp-next-diagnostic)
    nnoremap <buffer> K <plug>(lsp-hover)

    g:lsp_format_sync_timeout = 1000
    # Format on save only for languages where it is fast and standard practice
    if &filetype == 'rust' || &filetype == 'go'
        autocmd BufWritePre <buffer> LspDocumentFormatSync
    endif
enddef

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled OnLspBufferEnabled()
augroup END

augroup PhpFormatting
    autocmd!
    autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END
