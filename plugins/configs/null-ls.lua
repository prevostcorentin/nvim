local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local null_ls_augroup = vim.api.nvim_create_augroup("null_ls", { clear = false })

null_ls.setup {
  debug = true,
  sources = {
    -- bash
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.code_actions.shellcheck,
    -- lua
    null_ls.builtins.formatting.stylua,
    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.autoflake,
    -- yaml
    null_ls.builtins.formatting.yamlfmt,
  },
  on_attach = function(client, bufnr)
    if true == client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { group = null_ls_augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = null_ls_augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
