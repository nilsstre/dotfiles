vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>n", "<cmd>:bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", "<cmd>:bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>:bdelete<cr>", { desc = "Close buffer" })

-- Better visual mode indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<S-up>", "<cmd>:m-2<cr>", { desc = "Move line up" })
vim.keymap.set("n", "<S-down>", "<cmd>:m+<cr>", { desc = "Move line down" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

-- Center screen on search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

local t_opts = { silent = true }

vim.keymap.set("t", "<esc>", "<C-\\><C-N>", t_opts)
vim.keymap.set("t", "<C-Left>", "<C-\\><C-N><C-w>h", t_opts)
vim.keymap.set("t", "<C-Down>", "<C-\\><C-N><C-w>j", t_opts)
vim.keymap.set("t", "<C-Up>", "<C-\\><C-N><C-w>k", t_opts)
vim.keymap.set("t", "<C-Right>", "<C-\\><C-N><C-w>l", t_opts)
