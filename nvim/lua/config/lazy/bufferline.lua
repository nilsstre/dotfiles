return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.opt.termguicolors = true

		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, _, _)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})
	end,
}
