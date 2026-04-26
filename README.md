# Vim Configuration

## Installation

To install this Vim configuration, follow these steps:

Clone the repository:
```bash
git clone git@github.com:schillermann/config.vim.git ~/.vim
```

## Adding Plugins

Plugins are managed as git submodules within the `pack/` directory.
To add a new plugin (e.g., `vim-fugitive`):

```bash
cd ~/.vim
git submodule add https://github.com/tpope/vim-fugitive.git vim/pack/plugins/start/vim-fugitive
```

## Updating Plugins

To update all plugins to their latest versions:

```bash
cd ~/.vim
git submodule update --remote --merge
```
