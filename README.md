# Vim Configuration

## Features

- **Wayland Optimized**: Includes asynchronous clipboard support via `wl-copy` for seamless integration with Wayland environments.

## Prerequisites

- **Vim 9.0+** (Debian/Ubuntu: `sudo apt install vim`, as default `vim-tiny` is not sufficient)
- Optional (for Wayland clipboard): `wl-clipboard`

## Installation

To install this Vim configuration, clone the repository with submodules:

```bash
git clone --recurse-submodules git@github.com:schillermann/config.vim.git ~/.vim
```

If already cloned without submodules, initialize them via:

```bash
cd ~/.vim
git submodule update --init --recursive
```

> [!NOTE]
> A separate `~/.vimrc` is not required. Vim automatically loads configuration files from `plugin/` and packages from `pack/`.

## Adding Plugins

Plugins are managed as git submodules within the `pack/` directory.
To add a new plugin (e.g., `vim-fugitive`):

```bash
cd ~/.vim
git submodule add https://github.com/tpope/vim-fugitive.git pack/category/start/vim-fugitive
```

## Updating Plugins

To update all plugins to their latest versions:

```bash
cd ~/.vim
git submodule update --remote --merge
```

## Keymap

To find a specific keymap, you can use the `:filter` command.
For example, to find all normal mode mappings related to "git" and "status":

```vim
:filter /git.*status/ nmap
```
