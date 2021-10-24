local nls = require("null-ls")

local M = {}

function M.setup(opts)
  nls.config({
    debounce = 150,
    save_after_format = false,
    sources = {
      nls.builtins.formatting.prettierd.with({
        filetypes = {
          "html",
          "json",
          "markdown",
          "scss",
          "css",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      }),
      nls.builtins.formatting.eslint.with({
        command = "eslint_d",
      }),
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.goimports,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.diagnostics.selene,
      nls.builtins.code_actions.gitsigns,
      nls.builtins.diagnostics.luacheck.with({ extra_args = { "-g" } }),
    },
  })
end

function M.has_formatter(ft)
  local config = require("null-ls.config").get()
  local formatters = config._generators["NULL_LS_FORMATTING"]
  for _, f in ipairs(formatters) do
    if vim.tbl_contains(f.filetypes, ft) then
      return true
    end
  end
end

return M
