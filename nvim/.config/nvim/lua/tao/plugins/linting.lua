return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- javascript = { "eslint_d" },
			javascript = { "biomejs" },
			-- typescript = { "eslint_d" },
			typescript = { "biomejs" },
			-- javascriptreact = { "eslint_d" },
			javascriptreact = { "biomejs" },
			-- typescriptreact = { "eslint_d" },
			typescriptreact = { "biomejs" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			latex = { "chktex" },
			go = { "golangcilint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
