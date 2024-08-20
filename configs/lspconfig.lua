local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local utils = require "core.utils"
local yawn = require "yawn"

local lsp_augroup = vim.api.nvim_create_augroup("lsp", { clear = true })

---@diagnostic disable-next-line: unused-local
local on_configure_client_buffer = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })
  if true == client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
  vim.api.nvim_clear_autocmds { group = lsp_augroup, buffer = bufnr }
  if true == client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      callback = vim.lsp.buf.document_highlight,
      group = lsp_augroup,
    })
  end
  vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    callback = vim.lsp.buf.clear_references,
    group = lsp_augroup,
  })
  -- Show errors and warning list after a file save
  -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --   callback = vim.diagnostic.setloclist,
  --   group = lsp_augroup,
  -- })
end

lspconfig.ansiblels.setup {
  on_attach = on_configure_client_buffer,
  ansible = {
    ansible = {
      path = "ansible",
    },
    executionEnvironment = {
      enabled = false,
    },
    python = {
      interpreterPath = "python",
    },
    validation = {
      enabled = true,
      lint = {
        enabled = true,
        path = "ansible-lint",
      },
    },
  },
}
lspconfig.bashls.setup { on_attach = on_configure_client_buffer }
lspconfig.dockerls.setup { }
lspconfig.jsonls.setup { on_attach = on_configure_client_buffer }
lspconfig.phpactor.setup { on_attach = on_configure_client_buffer }
lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    on_configure_client_buffer(client, bufnr)
    if yawn.python.has_venv() then
      client.config.settings.python.pythonPath = yawn.python.find_interpreter()
      client.config.settings.python.venvPath = yawn.python.find_venv()
      client.notify "workspace/configuration"
    end
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
}
lspconfig.yamlls.setup { }
