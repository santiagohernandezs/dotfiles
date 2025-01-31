return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	opts = {
		latex = { enabled = false },
		win_options = { conceallevel = { rendered = 2 } },
		on = {
			attach = function()
				require("nabla").enable_virt({ autogen = true })
			end,
		},
	},
}
