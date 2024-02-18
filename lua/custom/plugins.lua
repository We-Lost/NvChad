local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opt = function()
      return require "custom.config.null-ls"
    end

  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end

  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "jubnzv/mdeval.nvim",
    event = "VeryLazy",
    opt = function()
      return vim.g.markdown_fenced_languages == { 'python', 'cpp' }
    end
  }
}
return plugins
