return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	config = function()
		local hop = require("hop")
		local wk = require("which-key")

		local km = vim.keymap

		wk.add({
			"<leader>x",
			group = "Hop",
			icon = "",
		})

		km.set("n", "<leader>xw", "<cmd>HopWord<CR>", { desc = "Hop Word" })
		km.set("n", "<leader>xc", "<cmd>HopChar1<CR>", { desc = "Hop Char 1" })
		km.set("n", "<leader>xp", "<cmd>HopPasteChar1<CR>", { desc = "Hop Paste" })
		km.set("n", "<leader>xy", "<cmd>HopYankChar1<CR>", { desc = "Hop Yank" })
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
