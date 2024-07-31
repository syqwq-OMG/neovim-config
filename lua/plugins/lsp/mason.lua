return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        -- "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "clangd",
                "lua_ls",
                "marksman",
                "jsonls",
                "rust_analyzer",
                "pyright",
                -- 下载失败 参考 https://blog.csdn.net/qq_35485875/article/details/120168944
            },
        })

        require("mason-tool-installer").setup({
            auto_update = true,
            ensure_installed = {
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint",
            },
        })
    end,
}
