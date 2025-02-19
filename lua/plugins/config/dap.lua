local dap = require("dap")
local yawn = require("yawn")

dap.adapters.python = {
    type = 'executable',
    command = os.getenv('PYENV_ROOT') .. '/versions/' .. os.getenv('PYTHON_VERSION') .. '/bin/python',
    args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch",
        program = function()
            return yawn.workspace.get("python.debug.debugee", "${file}")
        end,
        pythonPath = function()
            return yawn.workspace.get("python.interpreter", "python")
        end
    }
}
