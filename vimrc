" Buffer
" Move to the previous buffer
nnoremap H :bprevious<CR>
" Move to the next buffer
nnoremap L :bnext<CR>

call plug#begin()
Plug 'tpope/vim-fugitive'
call plug#end()
