local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local lsp_augroup = vim.api.nvim_create_augroup("lsp", { clear = true })

local on_attach_callback = function(client, bufnr)
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
  vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
    callback = vim.diagnostic.open_float,
    group = lsp_augroup,
  })
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = vim.diagnostic.setloclist,
    group = lsp_augroup,
  })
end

lspconfig.ansiblels.setup {
  on_attach = on_attach_callback,
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
lspconfig.bashls.setup { on_attach = on_attach_callback }
lspconfig.dockerls.setup { on_attach = on_attach_callback }
lspconfig.jsonls.setup { on_attach = on_attach_callback }
lspconfig.pyright.setup {
  on_attach = on_attach_callback,
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true,
    },
  },
}
lspconfig.yamlls.setup { on_attach = on_attach_callback }
