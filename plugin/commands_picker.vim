vim9script

import autoload 'command_picker.vim'

const COMMAND_LIST = [
    ['search and replace on line under cursor', 's///g', 3],
    ['search and replace in file', '%s///g', 3],
    ['search and replace in file case-insensitive', '%s///gi', 4],
    ['search and replace in file with confirmation', '%s///gc', 4],
    ['search and replace in file with last search', '%s///g', 2],
]

def g:OpenCommandPicker()
    command_picker.Open(COMMAND_LIST)
enddef

nnoremap <silent> <leader>c :call g:OpenCommandPicker()<CR>

