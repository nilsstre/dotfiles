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
				get_enabled = true,
				enabled = true,
				auto_trigger = false,
				hide_during_completion = true,
				debounce = 55,
				keymap = {
					accept = "<C-y>",
					next = "<C-n>",
					prev = "<C-p>",
				},
			},
		})
	end,
}
