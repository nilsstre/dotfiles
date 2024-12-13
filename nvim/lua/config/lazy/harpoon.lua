local function map_numeric_keys(harpoon)
	for i = 1, 9 do
		vim.keymap.set("n", string.format("<leader>%d", i), function()
			harpoon:list():select(i)
		end, { desc = string.format("Harpoon move to #%d", i), noremap = true, silent = true })
	end
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local telescopeConf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = telescopeConf.file_previewer({}),
					sorter = telescopeConf.generic_sorter({}),
				})
				:find()
		end

		map_numeric_keys(harpoon)

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })

		-- vim.keymap.set("n", "<leader>q", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Toggle harpoon telescope menu" })
		vim.keymap.set("n", "<leader>q", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon quick menu" })

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Navigate to next page in harpoon" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Navigate to previous page in harpoon" })
	end,
}
