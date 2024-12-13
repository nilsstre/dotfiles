vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--[[ vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
v im.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
]]
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<S-up>", "<cmd>:m-2<cr>", { desc = "Move line up" })
vim.keymap.set("n", "<S-down>", "<cmd>:m+<cr>", { desc = "Move line down" })
