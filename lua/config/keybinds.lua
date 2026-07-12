vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "<leader>w", "<C-o><cmd>w<CR>", { desc = "Save file while in insert mode" })
vim.keymap.set("i", "<leader>q", "<C-o><cmd>q<CR>", { desc = "Quit file while in insert mode" })

vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-t>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "Toggle Terminal" })


