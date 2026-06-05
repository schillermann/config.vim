vim9script

import autoload 'command_picker.vim'

const command_list = [
    ['search replace on line under cursor', 's///g', 3],
    ['search replace in file', '%s///g', 3],
    ['search replace in file case-insensitive', '%s///gi', 4],
    ['search replace in file with confirm', '%s///gc', 4],
    ['search replace in file with last search', '%s///g', 2],
    ['search in current directory', ':grep -n "" .', 3],
    ['search in current directory recrusive', ':grep -rn "" .', 3],
]
command! CustomCommands command_picker.Open(command_list)
nnoremap <leader>c <cmd>CustomCommands<CR>
