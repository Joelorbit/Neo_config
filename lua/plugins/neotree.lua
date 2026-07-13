return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- beautiful UI icons
	"MunifTanjim/nui.nvim",
    },
    keys = {
	{ "<C-n>", "<cmd>Neotree toggle filesystem left<cr>", desc = "Toggle Sidebar Filetree" },
    },
    config = function()
	require("neo-tree").setup({
	    close_if_last_window = true, 
	    filesystem = {
		filtered_items = {
		    visible = true,
		},
		follow_current_file = {
		    enabled = true,
		},
	    },
	    window = {
		width = 30, --standard sidebar width
	    },
	})
    end,
}


