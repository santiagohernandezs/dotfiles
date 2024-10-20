return {
	"vuki656/package-info.nvim",
	requires = "MunifTanjim/nui.nvim",
	config = function()
		local package_info = require("package-info")
		local wk = require("which-key")
		local km = vim.keymap
		package_info.setup()

		-- Which key
		wk.add({
			{ "<leader>p", group = "Package Info", icon = "" },
		})

		-- Show dependency versions
		km.set(
			{ "n" },
			"<LEADER>ps",
			package_info.show,
			{ silent = true, noremap = true, desc = "Show dependency versions" }
		)

		-- Hide dependency versions
		km.set(
			{ "n" },
			"<LEADER>pc",
			package_info.hide,
			{ silent = true, noremap = true, desc = "Hide dependency versions" }
		)

		-- Toggle dependency versions
		km.set(
			{ "n" },
			"<LEADER>pt",
			package_info.toggle,
			{ silent = true, noremap = true, desc = "Toggle dependency versions" }
		)

		-- Update dependency on the line
		km.set(
			{ "n" },
			"<LEADER>pu",
			package_info.update,
			{ silent = true, noremap = true, desc = "Update dependency on the line" }
		)

		-- Delete dependency on the line
		km.set(
			{ "n" },
			"<LEADER>pd",
			package_info.delete,
			{ silent = true, noremap = true, desc = "Delete dependency on the line" }
		)

		-- Install a new dependency
		km.set(
			{ "n" },
			"<LEADER>pi",
			package_info.install,
			{ silent = true, noremap = true, desc = "Install a new dependency" }
		)

		-- Install a different dependency version
		km.set(
			{ "n" },
			"<LEADER>pp",
			package_info.change_version,
			{ silent = true, noremap = true, desc = "Install a different dependency version" }
		)
	end,
}
