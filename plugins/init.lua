return {
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- neovim lua configuration management
        "lua-language-server",
        "stylua",

        -- sysadmin stuff
        "ansible-language-server",
        -- "bash-debug-adapter",
        "bash-language-server",
        -- "beautysh",
        "dockerfile-language-server",
        -- "shellharden",
        "shellcheck",

        -- application development stuff
        "autoflake",
        "black",
        "debugpy",
        "pyright",

        -- miscellaneous
        -- "jsonlint",
        -- "markdownlint",
        "yaml-language-server",
        "json-lsp",
        "yamlfmt",
        -- "yamllint",
      },
    },
  },

  ["tpope/vim-fugitive"] = {
    config = function()
      require "custom.plugins.configs.fugitive"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
}
