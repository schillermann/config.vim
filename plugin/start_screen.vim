vim9script

g:start_screen_blocks = [
    { title: 'Welcome Back, Mario' },
    { items: [
        { description: 'start screen', command: ':StartScreen' },
        { description: 'new nile', command: ':enew' },
        { description: 'quit vim', command: ':q' },
    ]},
    { items: [
        { shortcut: '<space>c', description: 'command templates', command: ':CommandTemplates' },
        { shortcut: '<space>e', description: 'open file explorer', command: ':Explore' },
        { shortcut: '<space>g', description: 'git status', command: ':0G' },
    ]},
    { title: 'Buffer', items: [
        { shortcut: 'L', description: 'next buffer', command: ':bnext' },
        { shortcut: 'H', description: 'previous buffer', command: ':bprevious' },
    ]},
    { title: 'LSP', items: [
        { shortcut: 'gd', description: 'definition' },
        { shortcut: 'gs', description: 'document symbol search' },
        { shortcut: 'gS', description: 'workspace symbol search' },
        { shortcut: 'gr', description: 'references' },
        { shortcut: 'gi', description: 'implementation' },
        { shortcut: 'gt', description: 'type definition' },
        { shortcut: 'gR', description: 'rename' },
        { shortcut: ']g', description: 'next diagnostic' },
        { shortcut: '[g', description: 'previous diagnostic' },
        { shortcut: 'K', description: 'hover' },
    ]},
]

augroup StartGroup
    autocmd!
    autocmd VimEnter * StartScreen
augroup END
