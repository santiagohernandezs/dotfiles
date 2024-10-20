return {
	"vyfor/cord.nvim",
	build = "./build",
	event = "VeryLazy",
	opts = function()
		require("cord").setup()
	end,
}
