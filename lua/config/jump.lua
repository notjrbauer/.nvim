require("hop").setup()

-- place this in one of your configuration file(s)
vim.keymap.set("", "gh", "<cmd>:HopWord<cr>", {})

vim.keymap.set("", "f", function()
  require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true })
end, {})

vim.keymap.set("", "F", function()
  require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true })
end, {})

vim.keymap.set("", "t", function()
  require("hop").hint_char1({
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1,
  })
end, {})

vim.keymap.set("", "T", function()
  require("hop").hint_char1({
    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = 1,
  })
end, {})
