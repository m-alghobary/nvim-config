return {
	"olimorris/onedarkpro.nvim",
	name = "colorscheme",
	priority = 1000,
	opts = {
		options = {
			transparency = true,
		},
	},

	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd.colorscheme("onedark")
	end,
}
