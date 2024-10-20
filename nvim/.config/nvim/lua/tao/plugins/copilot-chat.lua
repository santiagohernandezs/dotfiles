return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			-- Registers copilot-chat source and enables it for copilot-chat filetype (so copilot chat window)
			require("CopilotChat.integrations.cmp").setup()
			local wk = require("which-key")

			-- You might also want to disable default <tab> complete mapping for copilot chat when doing this
			require("CopilotChat").setup({
				mappings = {
					complete = {
						insert = "",
					},
				},
				debug = true, -- Enable debugging
				window = {
					layout = "float",
					width = 0.7,
					height = 0.7,
					border = "rounded",
				},
			})

			-- Which key
			wk.add({
				{ "<leader>c", group = "Copilot Chat", icon = "" },
			})

			-- Optional: Add a keybinding to open the copilot chat window
			local km = vim.keymap
			km.set("n", "<leader>ct", "<cmd>:CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
			km.set("n", "<leader>ci", "<cmd>:CopilotChat<CR>", { desc = "Open Copilot Chat With Input" })
			km.set("n", "<leader>cs", "<cmd>:CopilotChatStop<CR>", { desc = "Stop current copilot output" })
			km.set("n", "<leader>cr", "<cmd>:CopilotChatReset<CR>", { desc = "Reset chat window" })
		end,
	},
}
