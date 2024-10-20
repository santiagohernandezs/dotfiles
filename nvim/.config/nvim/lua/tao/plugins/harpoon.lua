return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local wk = require("which-key")

		-- Which key
		wk.add({
			{ "<leader>h", group = "Harpoon", icon = "󰐃", desc = "Pin files" },
		})

		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to harpoon" })
		vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "Remove file from harpoon" })
		vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "Navigate to next harpoon mark" })
		vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "Navigate to previous harpoon mark" })
	end,
}
