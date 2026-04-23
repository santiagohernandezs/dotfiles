vim.pack.add({
	-- Mini
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-mini/mini.basics",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.clue",
	"https://github.com/nvim-mini/mini.snippets",
	"https://github.com/nvim-mini/mini.completion",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.move",

	-- Treesitter and LSP
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/mfussenegger/nvim-lint",

	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/github/copilot.vim",

	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

vim.cmd.colorscheme("vague")

require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false })

require("mini.files").setup({
	mappings = {
		close = "<ESC>",
	},
	windows = {
		preview = true,
		border = "rounded",
		width_preview = 80,
	},
})
require("mini.icons").setup()
require("mini.move").setup()
local miniclue = require("mini.clue")
require("mini.clue").setup({
	triggers = {
		-- leader
		-- g key
		{ mode = { "n", "x" }, keys = "g" },
		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },
	},
	clues = {
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.z(),
	},
})

require("mini.pick").setup()
require("mini.pairs").setup()

require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "double",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = [[\]],
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = false,
	},
})

require("mini.completion").setup()
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
	snippets = {
		gen_loader.from_file("~/.config/nvim/snippets/global.json"),
		gen_loader.from_lang(),
	},
})

require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/treesitter" })
require("nvim-treesitter").install({ "lua", "typescript", "javascript", "rust", "ledger", "python" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "typescript", "javascript", "rust", "tsx", "ledger", "python" },
	callback = function()
		vim.treesitter.start()
	end,
})

require("lsp")
require("keybinds")
require("linter")
require("options")
