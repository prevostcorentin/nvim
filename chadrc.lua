-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox_light", "gruvbox" },
}

M.mappings = require "custom.mappings"
---@diagnostic disable-next-line: different-requires
M.plugins = "custom.plugins"

return M
