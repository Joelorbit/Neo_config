return {
  "SuperBo/fugit2.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- Optional, for file icons
  },
  cmd = { "Fugit2", "Fugit2Graph" },
  keys = {
    { "<leader>gg", "<cmd>Fugit2<cr>", desc = "Open Fugit2 Status" },
    { "<leader>gl", "<cmd>Fugit2Graph<cr>", desc = "Open Fugit2 Graph" },
  },
  opts = {
    width = "85%", -- Matches the large floating style in your image
    height = "85%",
  },
}
