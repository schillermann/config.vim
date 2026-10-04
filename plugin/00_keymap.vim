let mapleader = " "

" Buffer
" move to previous buffer
nnoremap H :bprevious<CR>
" move to the next buffer
nnoremap L :bnext<CR>

" Explorer
" opens netrw fullscreen as file explorer in the directory of the opened file
nnoremap <leader>e :Explore<CR>

" Git
" git summary fullscreen window like git status
nnoremap <leader>g :0G<CR>

" Do not yank with dd, dw, or d in visual mode
nnoremap dd "_dd
nnoremap dw "_dw
vnoremap d "_d
