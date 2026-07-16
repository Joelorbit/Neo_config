local treesitter_languages = {
  "lua",
  "tsx",
  "typescript",
  "php",
  "c",
}

local treesitter_filetypes = {
  "lua",
  "typescript",
  "typescriptreact",
  "php",
  "c","json", "java"
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()
      treesitter.install(treesitter_languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = treesitter_filetypes,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
