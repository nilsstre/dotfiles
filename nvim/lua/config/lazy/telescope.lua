return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					"smart",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			mappings = {
				i = {
					["<C-h>"] = "which_key",
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {
			desc = "Find files",
		})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, {
			desc = "Grep for a string",
		})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {
			desc = "List buffers",
		})
		vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {
			desc = "List git branches",
		})
		vim.keymap.set("n", "<leader>fm", builtin.marks, {
			desc = "List marks",
		})
	end,
}
