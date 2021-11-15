local M = {}

function M.setup(options)
  local nls = require("null-ls")
  nls.config({
    debounce = 150,
    save_after_format = false,
    sources = {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.fish_indent,
      nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.goimports.with({ filetypes = { "go" } }),
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.diagnostics.markdownlint,
      nls.builtins.diagnostics.selene,
      nls.builtins.code_actions.gitsigns,
    },
  })
  require("lspconfig")["null-ls"].setup(options)
end

function M.has_formatter(ft)
  local config = require("null-ls.config").get()
  local formatters = config.sources
  for _, f in ipairs(formatters) do
    print(vim.inspect(f))
    if vim.tbl_contains(f.filetypes, ft) then
      return true
    end
  end
  return false
end

return M
