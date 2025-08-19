return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		close_if_last_window = true,
	},

	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle float<CR>")
	end,
}
