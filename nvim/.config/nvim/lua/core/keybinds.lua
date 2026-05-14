local km = vim.keymap.set

km("n", "<leader>ff", ":Pick files<CR>", { desc = "Find File" })
km("n", "<leader>fr", ":Pick files resume<CR>", { desc = "Find File" })
km("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Grep in Files" })
km("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

km("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
km("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
km("n", "<leader>se", "<C-w>", { desc = "Make Splits Equal size" })
km("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

km(
  "n",
  "<leader>ih",
  ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
  { desc = "Toggle Inlay Hint" }
)
km(
  "n",
  "<leader>cl",
  ":lua vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())<CR>",
  { desc = "Toggle Codelens" }
)

km("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
km("n", "<C-j>", "<C-w>j", { desc = "Move to down split" })
km("n", "<C-k>", "<C-w>k", { desc = "Move to up split" })
km("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

km("n", "<leader>ee", function()
  if not MiniFiles.close() then
    MiniFiles.open()
  end
end, { desc = "Toggle File Explorer" })
km("n", "<leader>ef", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open File Explorer at current file" })

km("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
km("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
km("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
km("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
km("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

km("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
km("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
km("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
km("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Diagnostic Quickfix" })

local imap_expr = function(lhs, rhs)
  km("i", lhs, rhs, { expr = true })
end
imap_expr("<C-j>", [[pumvisible() ? "\<C-n>" : "\<C-j>"]])
imap_expr("<C-k>", [[pumvisible() ? "\<C-p>" : "\<C-k>"]])

km({ "n", "v", "i" }, "<Up>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Down>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Left>", "<Nop>", { desc = "Disable arrow keys" })
km({ "n", "v", "i" }, "<Right>", "<Nop>", { desc = "Disable arrow keys" })
