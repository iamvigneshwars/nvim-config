return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-`>]],
			direction = "horizontal",
			float_opts = {
				border = "curved",
			},
		})
	end,
}
