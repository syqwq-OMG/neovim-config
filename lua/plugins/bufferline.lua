local opts = {
    options = {
        

        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",

        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        --- @diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                -- local sym = e == "error" and " 󰅚 " or (e == "warning" and " 󰀪 " or "")
                local sym = e == "error" and "  " or (e == "warning" and "  " or "")
                s = s .. sym .. n
            end
            return s
        end,
    }

}
return {
    'akinsho/bufferline.nvim',
    name = 'bufferline',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' },
    config = function()
        local bufferline =  require('bufferline')
        opts.options.style_preset = bufferline.style_preset.no_italic

        bufferline.setup(opts)
    end
}
