local opt = vim.opt

--Set colorscheme (order is important here)
-- Ignore compiled files
opt.wildignore = "__pycache__"

opt.wildignore =
    opt.wildignore +
    {
        ".git",
        ".swp",
        "~*",
        "*.DS_STORE",
        "*.o",
        "*~",
        "*.pyc",
        "*pycache*"
    }

opt.wildmode = {
    "longest",
    "list",
    "full"
}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.virtualedit = "block"
opt.wildmode = opt.wildmode - "list"
opt.wildmode =
    opt.wildmode +
    {
        "longest",
        "full"
    }

opt.wildoptions = "pum"
opt.list = true
opt.listchars = {
    tab = "··",
    nbsp = "░",
    extends = "»",
    precedes = "«",
    trail = "·"
}
opt.joinspaces = false
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
--Incremental live completion
opt.inccommand = "nosplit"

--Set highlight on search
opt.hlsearch = false
opt.incsearch = true

-- Tabs
-- opt.autoindent = true
-- opt.cindent = true
-- opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.shada = {
    "!",
    "'1000",
    "<50",
    "s10",
    "h"
}

opt.mouse = "n"

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions =
    opt.formatoptions - "a" - -- Auto formatting is BAD.
    "t" + -- Don't auto format my code. I got linters for that.
    "c" + -- In general, I like it when comments respect textwidth
    "q" - -- Allow formatting comments w/ gq
    "o" + -- O and o, don't continue comments
    "r" + -- But do continue when pressing enter.
    "n" + -- Indent past the formatlistpat, not underneath it.
    "j" - -- Auto-remove comments if possible.
    "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

opt.fillchars = {
    diff = "⣿",
    vert = "┃",
    fold = "─",
    msgsep = "‾",
    eob = "~"
}

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
opt.hidden = true

--Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true
