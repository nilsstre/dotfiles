return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	event = "VeryLazy",
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}
