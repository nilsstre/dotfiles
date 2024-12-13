return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"css",
			"dockerfile",
			"elixir",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"heex",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"sql",
			"ssh_config",
			"terraform",
			"typescript",
			"vim",
			"vimdoc",
		},
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
	end,
}
