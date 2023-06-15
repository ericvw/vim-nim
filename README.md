# Nim language plugin for Neovim and Vim

Nim language support for Neovim and Vim.

## Features

- Syntax highlighting
- Auto-indent (WIP)

## Installation

Use your favorite Neovim and Vim plugin manager. Below are what I use for
Neovim and Vim, respectively.

### Neovim

#### [Packer](https://github.com/wbthomason/packer.nvim)

```lua
require("packer").startup(function()
    use "ericvw/vim-nim"
end)
```

### Vim

#### [vim-plug](https://github.com/junegunn/vim-plug)

``` vim
call plug#begin()
Plug 'ericvw/vim-nim'
call plug#end()
```

<!--
vim: spell
->
