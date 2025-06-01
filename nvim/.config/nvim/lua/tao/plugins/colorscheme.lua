return {
	"cdmill/neomodern.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			theme = "hojicha",
		})
		require("neomodern").load()
	end,
}
