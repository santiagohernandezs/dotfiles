return {
	"ramojus/mellifluous.nvim",
	name = "mellifluous",
	priority = 1000,
	config = function()
		require("mellifluous").setup({
			plugins = {
				nvim_tree = {
					show_root = true,
				},
			},
		})
		vim.cmd.colorscheme("mellifluous")
	end,
}
