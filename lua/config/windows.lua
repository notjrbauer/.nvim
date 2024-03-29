local M = {}

function M.config()
  vim.o.winwidth = 5
  vim.o.winminwidth = 5
  vim.o.equalalways = false
  require("windows").setup({
    animation = {
      duration = 150,
    },
  })
end

return M
