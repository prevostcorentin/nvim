-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "gruvbox",
  theme_toggle = {"gruvbox", "gruvbox_light"}
}

M.mappings = require "custom.mappings"
M.plugins = require "custom.plugins"

vim.cmd("set foldmethod=indent")
vim.cmd("set guifont=SauceCodePro_Nerd_Font:h16.000000")
vim.cmd("set nowrap")

return M
