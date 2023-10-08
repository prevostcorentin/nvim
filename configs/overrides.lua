local M = {}

M.mason = {
  ensure_installed = {
    -- neovim lua configuration management
    "lua-language-server",
    "stylua",

    -- sysadmin stuff
    "ansible-language-server",
    -- "bash-debug-adapter",
    "bash-language-server",
    "dockerfile-language-server",
    "shellharden",
    "shellcheck",

    -- application development stuff
    "autoflake",
    "black",
    "debugpy",
    "phpactor",
    "pyright",

    -- miscellaneous
    -- "markdownlint"
    "yaml-language-server",
    "json-lsp",
    "yamlfmt",
  },
}

return M
