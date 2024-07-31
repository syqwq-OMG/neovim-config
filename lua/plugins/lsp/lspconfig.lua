return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local servers = {
            lua_ls = require("plugins.lsp.spec-lsp.lua"),
            clangd = require("plugins.lsp.spec-lsp.cpp"),
            rust_analyzer = require("plugins.lsp.spec-lsp.rust"),
            pyright = require("plugins.lsp.spec-lsp.python"),
            marksman = require("plugins.lsp.spec-lsp.markdown"),
        }

        for name, config in pairs(servers) do
            if config ~= nil and type(config) == "table" then
                -- 自定义初始化配置文件必须实现on_setup 方法
                -- 因为每个 server 初始化方法并不完全相同， 用同一套初始化流程并不能满足不同语言定制的需要，所以将初始化方法抽离出来，让每个 server 的配置文件来负责初始化。
                config.on_setup(lspconfig[name])
            else
                -- 使用默认参数
                lspconfig[name].setup({})
            end
        end
        -- local mason_lspconfig = require("mason-lspconfig")

        -- local protocol = require("vim.lsp.protocol")

        -- local on_attach = function(client, bufnr)
        --     -- format on save
        --     if client.server_capabilities.documentFormattingProvider then
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             group = vim.api.nvim_create_augroup("Format", { clear = true }),
        --             buffer = bufnr,
        --             callback = function()
        --                 vim.lsp.buf.format()
        --             end,
        --         })
        --     end
        -- end

    --     local capabilities = require("cmp_nvim_lsp").default_capabilities()

    --     mason_lspconfig.setup_handlers({
    --         function(server)
    --             nvim_lsp[server].setup({
    --                 capabilities = capabilities,
    --             })
    --         end,
    --         ["jsonls"] = function()
    --             nvim_lsp["jsonls"].setup({
    --                 on_attach = on_attach,
    --                 capabilities = capabilities,
    --             })
    --         end,
    --         ["pyright"] = function()
    --             nvim_lsp["pyright"].setup({
    --                 on_attach = on_attach,
    --                 capabilities = capabilities,
    --             })
    --         end,
    --     })
    end,
}
