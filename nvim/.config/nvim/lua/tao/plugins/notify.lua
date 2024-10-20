return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			fps = 30,
			stages = "fade",
		})
	end,
}
