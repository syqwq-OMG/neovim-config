local common = require("plugins.lsp.common-config")
local opts = {
    capabilities = common.capabilities,
    flags = common.flags,
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}
--  󰅚 3 󰀪 1
return {
    on_setup = function(server)
        -- local ok_rt, rust_tools = pcall(require, "rust-tools")
        -- if not ok_rt then
        --     print("failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
        --     server.setup(opts)
        -- else
        --     -- we don't want to call lspconfig.rust_analyzer.setup() when using rust-tools
        --     rust_tools.setup({
        --         server = opts,
        --         -- notice: require dap
        --         dap = require("insis.dap.nvim-dap.config.rust"),
        --     })
        -- end
        server.setup(opts)
    end,
}
