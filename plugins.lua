local overrides = require("custom.configs.overrides")

return {
  { "williamboman/mason.nvim", opts = overrides.mason },

  { "prevostcorentin/nvim-yawn", dir="/home/hrn/Sources/nvim-yawn", disable=false },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  { "tpope/vim-fugitive",
    config = function()
      require "custom.configs.fugitive"
    end,
    keys = { "<LEADER>g"}
  },

  { "mfussenegger/nvim-dap",
    opt = true,
    keys = "<LEADER>d",
    config = function()
      require "custom.configs.nvim-dap"
    end,
    setup = function()
      require("core.utils").load_mappings "dap"
    end,
  },

  { "neovim/nvim-lspconfig" ,
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  { "folke/which-key.nvim",
    disable = false,
  },

  { "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "custom.configs.null-ls"
    end,
  },
}
