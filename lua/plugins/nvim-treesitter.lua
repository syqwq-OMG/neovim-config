local opts = {
    ensure_installed = { 
        "c", 
        "lua", 
        "vim", 
        "vimdoc", 
        "query", 
        "elixir", 
        "heex", 
        "javascript", 
        "html" ,
        "python",
        "cpp",
        "rust",
    },
    sync_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true }, 
    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },


}
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        require("nvim-treesitter.configs").setup(opts)
    end
}
