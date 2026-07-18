local treesitter_languages = {
  "bash",
  "blade",
  "c",
  "cpp",
  "css",
  "csv",
  "dockerfile",
  "go",
  "gomod",
  "gosum",
  "html",
  "java",
  "javascript",
  "json",
  "json5",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "php",
  "phpdoc",
  "python",
  "regex",
  "rust",
  "scss",
  "sql",
  "svelte",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
  "xml",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()
      treesitter.install(treesitter_languages)

      vim.treesitter.language.register("javascript", "javascriptreact")
      vim.treesitter.language.register("json", "jsonc")
      vim.treesitter.language.register("tsx", "typescriptreact")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "blade",
          "c",
          "cpp",
          "css",
          "go",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "lua",
          "php",
          "python",
          "scss",
          "sql",
          "svelte",
          "tsx",
          "typescript",
          "typescriptreact",
          "vue",
        },
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },
}
