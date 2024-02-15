local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opt = function ()
      return require "custom.config.null-ls"
    end

  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end

  },
  {
    "williamboman/mason.nvim",
    opt = {
      ensure_installed = {
        "clangd",
        "cpptools",
        "clang-format"
      }
    }
  }

}
return plugins
