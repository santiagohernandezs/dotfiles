local km = vim.keymap.set

km("n", "<leader>ff", function()
	require("mini.pick").builtin.files()
end, { desc = "Find File" })
km("n", "<leader>fr", function()
	require("mini.pick").builtin.resume()
end, { desc = "Find File" })
km("n", "<leader>fg", function()
	require("mini.pick").builtin.grep()
end, { desc = "Grep in Files" })
km("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

km({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable arrow keys" })

km("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
km("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
km("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal size" })
km("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

km("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
km("n", "<C-j>", "<C-w>j", { desc = "Move to down split" })
km("n", "<C-k>", "<C-w>k", { desc = "Move to up split" })
km("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

km("n", "<leader>ee", require("mini.files").open, { desc = "Toggle File Explorer" })
km("n", "<leader>ef", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open File Explorer at current file" })

km("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

local imap_expr = function(lhs, rhs)
	km("i", lhs, rhs, { expr = true })
end
imap_expr("<C-j>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<C-k>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
