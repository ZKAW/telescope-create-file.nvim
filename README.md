# telescope-create-file.nvim

A Neovim plugin that extends Telescope to find or create files.

## Features

- Seamlessly find existing files or create new ones through the Telescope interface
- Creates parent directories automatically if they don't exist
- Supports both relative and absolute paths
- Works from current buffer directory or current working directory

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  'ZKAW/telescope-create-file.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim'
  }
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
  'ZKAW/telescope-create-file.nvim',
  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/plenary.nvim'}
  }
}
```

## Setup

```lua
-- In your init.lua or wherever you configure plugins
require('telescope').setup {
  extensions = {
    create_file = {
      -- You can add extension-specific configuration here if needed
    }
  }
}

-- Load the extension
require('telescope').load_extension('create_file')
```

## Usage

### Commands

- `:TelescopeCreateFile` - Open Telescope to find or create a file relative to the current buffer's directory
- `:TelescopeCreateFileCwd` - Open Telescope to find or create a file relative to your current working directory

### Lua Functions

```lua
-- From current buffer directory
require('telescope').extensions.create_file.create_file()

-- From current working directory
require('telescope').extensions.create_file.create_file_from_cwd()
```

### Key Mappings Example

```lua
-- In your init.lua or wherever you configure keymaps
vim.keymap.set('n', '<leader>nf', '<cmd>TelescopeCreateFile<CR>', { desc = 'New file (buffer dir)' })
vim.keymap.set('n', '<leader>nF', '<cmd>TelescopeCreateFileCwd<CR>', { desc = 'New file (cwd)' })
```

## How It Works

1. When you select a file in Telescope, if the file exists, it will open normally
2. If the file doesn't exist, the plugin will:
   - Create any necessary parent directories
   - Create the empty file
   - Open it in your current buffer

## Requirements

- Neovim 0.7.0+
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
