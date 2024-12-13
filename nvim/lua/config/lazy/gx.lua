return {
	"chrishrb/gx.nvim",
	keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
	cmd = { "Browse" },
	init = function()
		vim.g.netrw_nogx = 1 -- disable netrw gx
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
	submodules = false,
	config = function()
		require("gx").setup({
			handlers = {
				plugin = true,
				github = true,
				brewfile = true,
				package_json = true,
				search = true,
				go = true,
				-- TODO: Add Jira handler
			},
			handler_options = {
				search_engine = "google",
				select_for_search = false, -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link
				git_remotes = { "upstream", "origin" },
			},
		})
	end,
}
