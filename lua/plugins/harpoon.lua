return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()

		-- Automatically add every opened file to Harpoon

		-- List of filetypes we don't want to auto-add
		local ignore_filetypes = {
			"NvimTree",
			"help",
			"gitcommit",
			"TelescopePrompt",
			"neo-tree",
			"aerial",
		}

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				local bufname = vim.fn.expand("%:p")
				local ft = vim.bo.filetype
				local bt = vim.bo.buftype

				if bufname == "" then
					return
				end

				-- Skip if it's "." or ".."
				if bufname == "." or bufname == ".." then
					return
				end

				-- Skip special buffers / filetypes
				if bt ~= "" or vim.tbl_contains(ignore_filetypes, ft) then
					return
				end

				local list = harpoon:list()
				list:add()

				-- trim to last 10 files
				local length = #list.items
				if length > 10 then
					for _ = 1, length - 10 do
						table.remove(list.items, 1) -- remove from the front
					end
					-- save after trimming
					harpoon:sync()
				end
			end,
		})

		-- keymaps
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<Tab>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<S-Tab>", function()
			harpoon:list():prev()
		end)
	end,
}
