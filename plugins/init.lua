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

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
}
