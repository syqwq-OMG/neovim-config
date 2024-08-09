# syqwq-OMG Neovim Rice up

## Config structure

[files with `*` are files with keybindings set-up]

```
nvim
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── configs
    │   ├── basic.lua
    │   ├── * keybindings.lua
    │   └── lazy.lua
    └── plugins
        ├── autopairs.lua
        ├── bufferline.lua
        ├── cmp.lua
        ├── color-schemes.lua
        ├── * conform.lua
        ├── dashboard.lua
        ├── indent-blankline.lua
        ├── lsp
        │   ├── * common-config.lua
        │   ├── lspconfig.lua
        │   ├── mason.lua
        │   ├── spec-lsp
        │   │   ├── cpp.lua
        │   │   ├── lua.lua
        │   │   ├── markdown.lua
        │   │   ├── python.lua
        │   │   └── rust.lua
        │   └── ui.lua
        ├── lualine.lua
        ├── * nvim-tree.lua
        ├── nvim-treesitter.lua
        ├── * telescope.lua
        ├── * toggle-term.lua
        └── which-key.lua


```

### Keybinding related files

- /lua/configs/keybindings.lua
- /lua/plugins/lsp/common-config.lua
- /lua/plugins/nvim-tree.lua
- /lua/plugins/telescope.lua
- /lua/plugins/toggle-term.lua
- /lua/plugins/conform.lua

## Nvim template

qwq just the raw neovim, so everything is config from nothing AwA

## Package manager used

[lazy.vim](https://github.com/folke/lazy.nvim)

## Plugins installed

- [catppuccin.nvim](https://github.com/catppuccin/nvim)
- [lualine](https://github.com/catppuccin/nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [dashboard](https://github.com/nvimdev/dashboard-nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [mason](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [lsp-kind](https://github.com/onsails/lspkind.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)

## References

- https://youtu.be/-kCUks3xrCM?si=djZL-_eEbfa8UTlo
- https://www.reddit.com/r/neovim/comments/1791a7x/all_of_a_sudden_i_cant_use_telescope/
- https://blog.csdn.net/qq_35485875/article/details/120168944
- https://github.com/williamboman/mason-lspconfig.nvim
- https://github.com/NvChad/NvChad
- https://github.com/nshen/InsisVim
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
- https://github.com/slydragonn/nvim-lazy
- https://hassanaskary.medium.com/how-to-setup-neovim-with-python-provider-using-conda-cbb0172f162
