-- local my_list_keys = require('configs.keybindings').nvimTreeList
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local map = vim.keymap

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    map.set('n', 'o', api.node.open.edit, opts('Open'))
    map.set('n', '<CR>', api.node.open.edit, opts('Open'))
    map.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))

    map.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    map.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))

    map.set('n', 'R', api.tree.reload, opts('Refresh'))
    map.set('n', 'a', api.fs.create, opts('Create'))
    map.set('n', 'd', api.fs.remove, opts('Delete'))
    map.set('n', 'r', api.fs.rename, opts('Rename'))
    map.set('n', 'c', api.fs.copy.node, opts( 'Copy'))
    map.set('n', 'x', api.fs.cut, opts( 'Cut'))
    map.set('n', 'p', api.fs.paste, opts( 'Paste'))
    map.set('n', 's', api.node.run.system, opts('Run System'))
end


local options = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,

    --- key mapping config
    on_attach = my_on_attach,
    -- 不显示 git 状态图标
    git = {
        enable = true,
        ignore = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = false,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        -- hide_root_folder = false,
        -- 自定义列表中快捷键
        -- mappings = {
        --     custom_only = false,
        --     list = my_list_keys,
        -- },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_opened_files = "none",
    
        indent_markers = {
          enable = true,
        },
    
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
    
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'open', -- mac 直接设置为 open
    },
  }

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- 列表操作快捷键
      require("nvim-tree").setup(options)

      -- 自动关闭
      vim.cmd([[
        autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
        ]])
    end,
}