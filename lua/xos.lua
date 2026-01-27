function _G.locate_lua_runtime_path()
    local runtime_path
    runtime_path = os.getenv("NVIM_LUA_RUNTIME_PATH") or vim.g.lua_runtime_path or nil
    if runtime_path ~= nil then
        return runtime_path
    end
    if vim.fn.has("win32") == 1 then
        runtime_path = "%APPDATA\\..\\Local\\..\\nvim\\runtime\\lua"
    elseif vim.fn.has("unix") == 1 then
        runtime_path = "$HOME/.local/share/nvim/runtime/lua"
    end
    return runtime_path
end

function _G.locate_executable()
    return vim.fn.exepath("nvim")
end

function _G.locate_configuration()
    local command = vim.api.nvim_parse_cmd("echo stdpath('config')", {})
    return vim.api.nvim_cmd(command, {["output"]=true})
end

function _G.locate_plugins()
    local plugins_folder
    plugins_folder = os.getenv("NVIM_PLUGINS_FOLDER") or vim.g.plugins_folder or nil
    if plugins_folder ~= nil then
        return plugins_folder
    end
    if vim.fn.has("win32") == 1 then
        plugins_folder = "%APPDATA%\\..\\Local\\nvim-data\\site\\pack"
    elseif vim.fn.has("unix") == 1 then
        plugins_folder = "$HOME/.local/share/nvim-data/site/pack"
    end
    return plugins_folder
end

return {
    ["lua"] = {
        ["runtime_path"] = _G.locate_lua_runtime_path
    },
    ["nvim"] = {
        ["executable"] = _G.locate_executable,
        ["configuration"] = _G.locate_configuration,
        ["plugins"] = _G.locate_plugins,
    }
}
