local telescope_keybindings = {
	i = {
		-- 上下移动
		["<C-j>"] = require("telescope.actions").move_selection_next,
		["<C-k>"] = require("telescope.actions").move_selection_previous,
		["<Down>"] = require("telescope.actions").move_selection_next,
		["<Up>"] = require("telescope.actions").move_selection_previous,
		-- 历史记录
		["<C-n>"] = require("telescope.actions").cycle_history_next,
		["<C-p>"] = require("telescope.actions").cycle_history_prev,
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
	n = {
		["q"] = require("telescope.actions").close,
	},
}

--[[
telescope project keybindings

## Default mappings (normal mode):

| Key | Description                                                   |
| --- | ------------------------------------------------------------- |
| `d` | delete currently selected project                             |
| `r` | rename currently selected project                             |
| `c` | create a project\*                                            |
| `s` | search inside files within your project                       |
| `b` | browse inside files within your project                       |
| `w` | change to the selected project's directory without opening it |
| `R` | find a recently opened file within your project               |
| `f` | find a file within your project (same as \<CR\>)              |
| `o` | change current cd scope                                       |

## Default mappings (insert mode):

| Key     | Description                                                   |
| ------- | ------------------------------------------------------------- |
| `<c-d>` | delete currently selected project                             |
| `<c-v>` | rename currently selected project                             |
| `<c-a>` | create a project\*                                            |
| `<c-s>` | search inside files within your project                       |
| `<c-b>` | browse inside files within your project                       |
| `<c-l>` | change to the selected project's directory without opening it |
| `<c-r>` | find a recently opened file within your project               |
| `<c-f>` | find a file within your project (same as \<CR\>)              |
| `<c-o>` | change current cd scope                                       |

\* _defaults to your git root if used inside a git project, otherwise, it will use your current working directory_

--]]

local opts = {
	defaults = {
		pickers = {
			-- 内置 pickers 配置
			find_files = {
				-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
				-- theme = "ivy",
			},
		},

		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},

		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,

		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		-- keybindings
		mappings = telescope_keybindings,
	},

	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			-- theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			-- mappings = {
			--   ["i"] = {
			--     -- your custom insert mode mappings
			--   },
			--   ["n"] = {
			--     -- your custom normal mode mappings
			--   },
			-- },
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	-- tag = '0.1.x',
	-- 出问题可能是telescope没更新
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("project")
	end,
}
