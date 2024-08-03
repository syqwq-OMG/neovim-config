local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)
        vim.g.rainbow_delimiters = { highlight = highlight }

        require("ibl").setup({
            -- space_char_blankline = " ",
            scope = {
                show_start = true,
                highlight = highlight,
            },
            exclude = {
                filetypes = {
                    "checkhealth",
                    "man",
                    "gitcommit",
                    "null-ls-info",
                    "dashboard",
                    "packer",
                    "terminal",
                    "help",
                    "log",
                    "markdown",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "lsp-installer",
                    "lspinfo",
                    "toggleterm",
                    "text",
                    "''",
                },
            },
            indent = {
                -- highlight = highlight,
                -- char = '¦',
                char = "┆",
                -- char = '│'
                -- char = "⎸",
                -- char = "▏",
            },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
