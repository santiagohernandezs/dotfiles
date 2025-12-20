vim.g.mapleader = " "
local km = vim.keymap

km.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })
km.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
km.set({ "i" }, "<C-s>", "<C-o>:w<ENTER>")
km.set({ "n" }, "<C-s>", ":w<ENTER>")

-- window managment
km.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Go to current buffer in new tab" })

km.set({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable arrow keys" })
km.set({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable arrow keys" })
km.set({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable arrow keys" })
km.set({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable arrow keys" })
