local lsp = {}
local diagnostic_ns = vim.api.nvim_create_namespace("lsp_diagnostics")
-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  -- virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

function lsp.show_diagnostics()
  vim.schedule(function()
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
    vim.diagnostic.show(diagnostic_ns, bufnr, diagnostics, { virtual_text = true })
  end)
end

function lsp.refresh_diagnostics()
  vim.diagnostic.setloclist({ open = false })
  lsp.show_diagnostics()
  if vim.tbl_isempty(vim.fn.getloclist(0)) then
    vim.cmd([[lclose]])
  end
end

local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "lua",
  "go",
  "vim",
  "php",
  "python",
}
-- vim.cmd([[augroup vimrc_lsp]])
-- vim.cmd([[autocmd!]])
-- vim.cmd(string.format("autocmd FileType %s call v:lua.lsp.setup()", table.concat(filetypes, ",")))
-- vim.cmd([[autocmd User LspDiagnosticsChanged :lua lsp.refresh_diagnostics()]])
-- vim.cmd([[augroup END]])
