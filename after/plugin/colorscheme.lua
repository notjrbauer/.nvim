if not pcall(require, "colorbuddy") then
  return
end
-- vim.api.nvim_command('set background=dark')
-- vim.api.nvim_command('highlight clear')

vim.opt.termguicolors = true

require("colorizer").setup()

local Color = require("colorbuddy.color").Color
local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

-- Normal c
Color.new("bg", "#eeeeee")
Color.new("fg", "#282828")
Color.new("black", "#1d1d1d")
Color.new("red", "#f43753")
Color.new("green", "#c9d05c")
Color.new("yellow", "#ffc24b")
Color.new("blue", "#b3deef")
Color.new("magenta", "#d3b987")
Color.new("cyan", "#73cef4")
Color.new("white", "#eeeeee")

-- -- Bright c
-- Color.new("bright.black", "#1d1d1d")
-- Color.new("bright.red", "#f43753")
-- Color.new("bright.green", "#c9d05c")
-- Color.new("bright.yellow", "#ffc24b")
-- Color.new("bright.blue", "#b3deef")
-- Color.new("bright.magenta", "#d3b987")
-- Color.new("bright.cyan", "#73cef4")
-- Color.new("bright.white", "#ffffff")

Group.new("StatuslineError1", c.red)

Group.new("GitSignsChange", c.red)
Group.new("GoTestSuccess", c.red)
Group.new("GoTestFail", c.red, nil, s.bold)

vim.cmd [[colorscheme tender]]

require("colorbuddy").setup()
-- Group.new("Keyword", c.purple, nil, nil)

Group.new("TSPunctBracket", c.yellow)

-- vim.api.nvim_command("hi StatusLine cterm=reverse gui=reverse")
Group.new("StatusLine", c.background, c.fg, nil)

Group.new("StatuslineError1", c.red, vim.g.Statusline)
Group.new("StatuslineError2", c.red, g.Statusline)
Group.new("StatuslineError3", c.red, g.Statusline)
Group.new("StatuslineError3", c.red, g.Statusline)

Group.new("pythonTSType", c.red)

Group.new("typescriptTSConstructor", g.pythonTSType)
Group.new("typescriptTSProperty", c.blue)

-- I don't think I like highlights for text
-- Group.new("LspReferenceText", nil, c.gray0:light(), s.bold)
Group.new("LspReferenceRead", nil, c.gray0:light())
Group.link("LspReferenceWrite", g.LspReferenceRead)
-- Group.new("LspReferenceWrite", nil, c.gray0:light())

Group.new("comment", c.gray3:light(), nil, s.italic)
-- Group.new("FloatBorder", c.white, g.NormalFloat)

-- Group.new("TSKeyword", c.purple, nil, s.underline, c.blue)
-- Group.new("LuaFunctionCall", c.green, nil, s.underline + s.nocombine, g.TSKeyword.guisp)
