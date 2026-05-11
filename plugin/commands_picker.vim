vim9script

import autoload 'command_picker.vim'

const command_list = [
    ['search replace on line under cursor', 's///g', 3],
    ['search replace in file', '%s///g', 3],
    ['search replace in file case-insensitive', '%s///gi', 4],
    ['search replace in file with confirm', '%s///gc', 4],
    ['search replace in file with last search', '%s///g', 2],
]
nnoremap <leader>c <ScriptCmd>command_picker.Open(command_list)<CR>
