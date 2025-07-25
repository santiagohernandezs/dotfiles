return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local wk = require("which-key")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("neoclip")

		-- WhichKey
		wk.add({
			{ "<leader>f", group = "find (Telescope)" },
		})

		-- set keymaps
		local km = vim.keymap -- for conciseness

		km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		km.set("n", "<leader>fp", "<cmd>Telescope neoclip<cr>", { desc = "Fuzzy find clipboard history" })
		km.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Fuzzy find notifications" })
		km.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Fuzzy find diagnostics" })
	end,
}
