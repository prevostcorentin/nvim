local lspconfig = require('lspconfig')
local yawn = require "yawn"
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

--- Any LSP with a satisfying default configuration
for _, lsp in ipairs({ 'bashls', 'cssls', 'html', 'lua_ls', 'vimls' }) do
    lspconfig[lsp].setup {
        capabilities = cmp_capabilities
    }
end

--- Specific LSP configuration
lspconfig.csharp_ls.setup {
    capabilities = cmp_capabilities,
    root_dir = function(fname)
        return lspconfig.util.root_pattern '*.sln'(fname) --- Attach CSharp LSP on *.sln only so there is one server instance for many projects (will require an .sln though)
    end
}

lspconfig.pyright.setup {
  capabilities = cmp_capabilities,
  on_init = function(client, _)
    if yawn.python.has_venv() then
      client.config.settings.python.extends = yawn.workspace.get('pyright_configuration', 'pyright.json')
      client.config.settings.python.pythonPath = yawn.python.find_interpreter()
      client.config.settings.python.venvPath = yawn.python.find_venv()
      client.notify "workspace/didChangeConfiguration"
    end
  end,
}
