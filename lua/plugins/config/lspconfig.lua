local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs({ 'bashls', 'lua_ls', 'vimls', 'pylsp' }) do
    lspconfig[lsp].setup {
        capabilities = cmp_capabilities
    }
end
