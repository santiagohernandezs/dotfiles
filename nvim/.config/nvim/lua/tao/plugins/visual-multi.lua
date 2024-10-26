return {
	"mg979/vim-visual-multi",
	branch = "master",
	config = function()
		vim.g.VM_mouse_mappings = 1
		vim.cmd([[VMDebug]]) -- fixes the  ctrl+n in visuala mode
	end,
}
