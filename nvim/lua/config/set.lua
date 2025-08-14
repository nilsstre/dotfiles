vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Performance optimizations
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 240
vim.opt.re = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.spell = true
vim.opt.spelllang = { "en_gb" }

vim.opt.termguicolors = true

vim.opt.backspace = "indent,eol,start"

--[[ vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end) ]]

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.mouse = "a"

vim.diagnostic.config({ virtual_text = true })

vim.g.have_nerd_font = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.laststatus = 3

-- Additional performance and usability settings
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Better search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Completion settings
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 10

-- Modern Neovim features
vim.opt.conceallevel = 0 -- Disable concealing to prevent hiding quotes in JSON files
vim.opt.concealcursor = "c" -- Hide conceals only in command mode (not normal mode)
vim.opt.foldenable = false -- Start with folds open
vim.opt.fillchars = {
	foldopen = "▾",
	foldclose = "▸",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
