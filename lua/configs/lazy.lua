-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    --- color-schemes
    { import = "plugins.color-schemes" },

    --- nvim-tree -> file explorer
    { import = "plugins.nvim-tree" },

    --- statusline -> lualine
    { import = "plugins.lualine" },

    --- manage tab line -> bufferlien
    { import = "plugins.bufferline" },

    --- fuzzy finder -> telescope
    { import = "plugins.telescope" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- fzf telescope extention
    { --- telescope-file-browser
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {"nvim-telescope/telescope-project.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-telescope/telescope-file-browser.nvim" }
    },

    --- dashboard
    { import = "plugins.dashboard" },

    --- nvim-treesitter
    { import = "plugins.nvim-treesitter" },

    --- mason
    { import = "plugins.lsp.mason" },
    
    --- lspconfig
    { import = "plugins.lsp.lspconfig" },
    
    --- autopairs
    { import = "plugins.autopairs" },

    --- auto complete
    { import = "plugins.lsp.cmp" },
  },

  checker = { enabled = true },
})
    
  -- spec = {
  --   -- import your plugins
  --   { import = "plugins" },
  -- },
  -- -- Configure any other settings here. See the documentation for more details.
  -- -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- -- automatically check for plugin updates
  -- checker = { enabled = true },


