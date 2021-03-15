local has_completion, completion = pcall(require, "compe")
local utils = require "_.utils"

local M = {}

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return utils.t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return utils.t "<Plug>(vsnip-expand-or-jump)"
  else
    return utils.t "<Tab>"
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return utils.t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return utils.t "<Plug>(vsnip-jump-prev)"
  else
    return utils.t "<S-Tab>"
  end
end

M.setup = function()
  if has_completion then
    completion.setup {
      enabled = true,
      min_length = 2,
      debug = false,
      preselect = "always",
      source = {
        path = true,
        buffer = true,
        spell = true,
        tags = true,
        conjure = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        snippets_nvim = true,
        treesitter = true
      }
    }

    utils.gmap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    utils.gmap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    utils.gmap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    utils.gmap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    utils.gmap(
      "i",
      "<c-p>",
      "compe#complete()",
      {expr = true, noremap = true, silent = true}
    )
    utils.gmap(
      "i",
      "<CR>",
      "compe#confirm('<CR>')",
      {expr = true, noremap = true, silent = true}
    )

    utils.gmap(
      "i",
      "<C-e>",
      "compe#close('<C-e>')",
      {expr = true, noremap = true, silent = true}
    )
  end
end

return M
