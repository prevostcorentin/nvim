local present, dap = pcall(require, "dap")

if not present then
  return
end

local yawn = require "yawn"

dap.adapters.python = {
  type = "executable",
  command = "debugpy-adapter",
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch",
    program = function()
      return yawn.workspace.get("debug.debugee", "${file}")
    end,
    pythonPath = function()
      return yawn.python.find_interpreter()
    end,
  },
}

return {}
