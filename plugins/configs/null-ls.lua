local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.code_actions.shellcheck,
  },
}

local null_ls_augroup = vim.api.nvim_create_augroup("null_ls", { clear = false })

vim.api.nvim_create_autocmd({ "BufWrite" }, {
  group = null_ls_augroup,
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    vim.lsp.buf.format()
  end,
})
