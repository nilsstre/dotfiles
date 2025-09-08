return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	opts = {},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_on_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_alway_hidden = function(name, _)
					return name == ".." or name == ".git" or ".DS_Store"
				end,
			},
			win_options = {
				wrap = true,
			},
		})

		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open oil.nvim" })
		vim.keymap.set("n", "<leader>O", "<CMD>Oil .<CR>", { desc = "Open oil.nvim in the project root dir" })
	end,
}
