vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Resize splits when window is resized",
	group = vim.api.nvim_create_augroup("resize-splits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespace on save",
	group = vim.api.nvim_create_augroup("trim-whitespace", { clear = true }),
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/s+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Auto-create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Auto-create directories when saving files",
	group = vim.api.nvim_create_augroup("auto-mkdir", { clear = true }),
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Remember cursor position",
	group = vim.api.nvim_create_augroup("restore-cursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})
