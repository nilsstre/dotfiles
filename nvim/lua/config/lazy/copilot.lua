return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		-- this is for the
		require("copilot").setup({
			-- copilot_model = "gpt-4o-copilot",
			copilot_model = "gpt-4o-copilot",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 55,
				keymap = {
					accept = "<C-y>",
					accept_word = false,
					next = "<C-)>",
					dismiss = "<C-Tab>",
				},
			},
		})
	end,
}
