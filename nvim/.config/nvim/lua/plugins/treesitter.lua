require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/treesitter" })
require("nvim-treesitter").install({ "lua", "typescript", "javascript", "rust", "ledger", "python", "astro", "qmljs" })
