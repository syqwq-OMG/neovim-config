function generate_catppuccin_theme(flavour)
    local C = require("catppuccin.palettes").get_palette(flavour)
    local O = require("catppuccin").options
    local catppuccin = {}

    local transparent_bg = O.transparent_background  and "NONE" or C.mantle

    catppuccin.normal = {
        a = { bg = C.blue, fg = C.mantle, gui = "bold" },
        b = { bg = C.surface0, fg = C.blue },
        c = { bg = transparent_bg, fg = C.text },
    }

    catppuccin.insert = {
        a = { bg = C.green, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.green },
    }

    catppuccin.terminal = {
        a = { bg = C.green, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.green },
    }

    catppuccin.command = {
        a = { bg = C.peach, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.peach },
    }

    catppuccin.visual = {
        a = { bg = C.mauve, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.mauve },
    }

    catppuccin.replace = {
        a = { bg = C.red, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.red },
    }

    catppuccin.inactive = {
        a = { bg = transparent_bg, fg = C.blue },
        b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
        c = { bg = transparent_bg, fg = C.overlay0 },
    }

    return catppuccin
end

local custom_catppuccin_mocha = generate_catppuccin_theme('mocha')

opts = {
    options = {
        -- 指定皮肤
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = custom_catppuccin_mocha,
        -- 分割线
        component_separators = {
            left = "|",
            right = "|",
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            -- left = " ",
            -- right = "",
            left = "",
            right = "",
        },
        globalstatus = true,
    },
    extensions = { "nvim-tree" },
    sections = {
        lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = '', -- e712
                    dos = '', -- e70f
                    mac = '', -- e711
                },
                -- symbols = {
                --     unix = "LF",
                --     dos = "CRLF",
                --     mac = "CR",
                -- },
            },
            "encoding",
            "filetype",
        },
    },
}

return {
    'nvim-lualine/lualine.nvim',
    name = 'lualine',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require("lualine").setup(opts)
    end,
}
