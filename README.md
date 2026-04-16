# Vim Configuration

## Installation

To install this Vim configuration, follow these steps:

1. Clone the repository:
   ```bash
   git clone git@github.com:schillermann/config.vim.git ~/.config/vim
   ```

2. Link the `vimrc` file:
   ```bash
   ln -s ~/.config/vim/vimrc ~/.vimrc
   ```

3. Link the `vim` directory (plugins):
   ```bash
   ln -s ~/.config/vim/vim ~/.vim
   ```

## Adding Plugins

Plugins are managed as git submodules within the `pack/` directory. To add a new plugin (e.g., `vim-fugitive`):

```bash
cd ~/.config/vim
git submodule add https://github.com/tpope/vim-fugitive.git vim/pack/plugins/start/vim-fugitive
```

## Updating Plugins

To update all plugins to their latest versions:

```bash
cd ~/.config/vim
git submodule update --remote --merge
```
