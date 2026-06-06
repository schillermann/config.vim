let mapleader = " "

" Buffer
nnoremap H :bprevious<CR>  " move to previous buffer
nnoremap L :bnext<CR>  " move to the next buffer
" Explorer
nnoremap <leader>e :Explore<CR>  " opens netrw fullscreen as file explorer in the directory of the opened file
" Git
nnoremap <leader>g :0G<CR>  " git summary fullscreen window like git status

" Do not yank with dd or dw
nnoremap dd "_dd
nnoremap dw "_dw
