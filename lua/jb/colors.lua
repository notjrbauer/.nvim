local colors = require("colorbuddy.color").colors

local ns_jb = vim.api.nvim_create_namespace "jb_colors"
local ns_jb_2 = vim.api.nvim_create_namespace "jb_colors_2"

vim.api.nvim_set_decoration_provider(
  ns_jb,
  {
    on_start = function(_, tick)
    end,
    on_buf = function(_, bufnr, tick)
    end,
    on_win = function(_, winid, bufnr, topline, botline)
    end,
    on_line = function(_, winid, bufnr, row)
      if row == 10 then
        vim.api.nvim_set_hl_ns(ns_jb_2)
      else
        vim.api.nvim_set_hl_ns(ns_jb)
      end
    end,
    on_end = function(_, tick)
    end
  }
)

vim.api.nvim_set_hl(
  ns_jb,
  "LuaFunctionCall",
  {
    foreground = colors.green:to_rgb(),
    background = nil,
    reverse = false,
    underline = false
  }
)
