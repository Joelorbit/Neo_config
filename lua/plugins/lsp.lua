return {
  -- 1. Main LSP config repository (still used for server definitions)
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatic system installer for external language tools
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    
    -- Autocomplete engine UI and popup sources
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    -- --- 1. CONFIGURE THE AUTOCOMPLETE POPUP MENU ---
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Open autocomplete panel
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Scroll down
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Scroll up
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, 
        { name = "buffer" },   
        { name = "path" },     
      }),
    })

    -- --- 2. NATIVE 0.11+ LSP SERVER CONFIGURATION ---
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Ensure mason-lspconfig handles downloading the servers
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, 
    })

    -- NATIVE SETUP: Fetch default configurations via the new core engine
    -- This merges capabilities directly without the legacy framework
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
    })

    -- Explicitly activate the language server for your project files
    vim.lsp.enable("lua_ls")
  end,
}

