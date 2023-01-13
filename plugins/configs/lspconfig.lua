local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

lspconfig.ansiblels.setup({
  ansible = {
    ansible = {
      path = "ansible"
    },
    executionEnvironment = {
       enabled = false
    },
    python = {
      interpreterPath = "python"
    },
    validation = {
      enabled = true,
      lint = {
        enabled = true,
        path = "ansible-lint"
      }
    }
  }
})
lspconfig.bashls.setup({})
lspconfig.dockerls.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
})
lspconfig.yamlls.setup({})

local lsp = vim.api.nvim_create_augroup("lsp", { clear = true })

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  pattern = {"*.bash", "*.c", "*.lua", "*.sh", "*.py", "*.zsh"},
  callback = vim.lsp.buf.document_highlight,
  group = lsp })

vim.api.nvim_create_autocmd({"CursorMoved"}, {
  pattern = {"*.bash", "*.c", "*.lua", "*.sh", "*.py", "*.zsh"},
  callback = vim.lsp.buf.clear_references,
  group = lsp })

vim.api.nvim_create_autocmd({"CursorHoldI"}, {
  callback = vim.diagnostic.open_float,
  group = lsp })

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = vim.diagnostic.setloclist,
  group = lsp })
