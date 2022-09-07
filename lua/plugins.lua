local packer = require("util.packer")

local config = {
  max_jobs = 60,
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
  opt_default = true,
  auto_reload_compiled = false,
  -- list of plugins that should be taken from ~/projects
  -- this is NOT packer functionality!
  local_plugins = {
    folke = false,
    ["null-ls.nvim"] = false,
    ["nvim-lspconfig"] = false,
    ["nvim-treesitter"] = false,
  },
}

local function plugins(use)
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })
  use({
    "williamboman/mason.nvim",
    module = "mason",
    opt = false,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    module = "mason-lspconfig",
    opt = false,
  })
  use({ "christoomey/vim-tmux-navigator", opt = false })

  -- Debug adapter protocol
  --   Have not yet checked this out, but looks awesome.
  -- use 'puremourning/vimspectorop'
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap").setup()
    end,
  })
  --  use("puremourning/vimspector")
  use({
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  })

  use({ "kazhala/close-buffers.nvim", cmd = "BDelete" })
  use({ "ray-x/lsp_signature.nvim" })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("config.lsp")
    end,
    requires = {},
  })

  use({ "jose-elias-alvarez/typescript.nvim", module = "typescript" })
  use({ "jose-elias-alvarez/null-ls.nvim", module = "null-ls" })
  use({ "folke/lua-dev.nvim", module = "lua-dev" })
  use({
    "j-hui/fidget.nvim",
    module = "fidget",
    config = function()
      require("fidget").setup({
        window = {
          relative = "editor",
        },
      })
      -- HACK: prevent error when exiting Neovim
      vim.api.nvim_create_autocmd("VimLeavePre", { command = [[silent! FidgetClose]] })
    end,
  })
  use({
    "smjonas/inc-rename.nvim",
    module = "inc_rename",
    config = function()
      require("inc_rename").setup()
    end,
  })

  use({
    "AckslD/nvim-neoclip.lua",
    event = "TextYankPost",
    module = { "neoclip", "telescope._extensions.neoclip" },
    config = function()
      require("neoclip").setup()
    end,
  })

  use({
    "SmiteshP/nvim-navic",
    module = "nvim-navic",
    requires = "neovim/nvim-lspconfig",
    wants = "nvim-treesitter",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = "   " })
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    -- opt = false,

    event = "InsertEnter",
    config = function()
      require("config.cmp")
    end,
    -- module = "cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
  })
  use({
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    config = function()
      require("config.snippets")
    end,
    requires = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  })

  use("tpope/vim-dadbod")
  use({ "kristijanhusak/vim-dadbod-completion" })
  use({
    "kristijanhusak/vim-dadbod-ui",
    config = function()
      require("config.dadbod")
    end,
  })
  use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = function()
      require("symbols-outline").setup()
    end,
  })

  use({
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup({})
    end,
  })

  use({
    "danymat/neogen",
    module = "neogen",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    module = "nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "nvim-treesitter/nvim-treesitter-refactor",
    },
    config = [[require('config.treesitter')]],
  })

  use({ "nvim-treesitter/playground", cmd = "TSHighlightCapturesUnderCursor" })
  -- Theme: color schemes
  -- use("tjdevries/colorbuddy.vim")
  -- use({ "tjdevries/colorbuddy.vim" })
  -- use({ "tjdevries/gruvbuddy.nvim" })
  use({ "gruvbox-community/gruvbox" })
  use({ "rebelot/kanagawa.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    -- "shaunsingh/nord.nvim"pt = ,
    -- "shaunsingh/moonlight.nvim",
    -- { "olimorris/onedark.nvim", requires = "rktjmp/lush.nvim" },
    -- "joshdick/onedark.vim",
    -- "wadackel/vim-dogrun",
    -- "bluz71/vim-nightfly-guicolors",
    -- { "marko-cerovac/material.nvim" },
    -- "sainnhe/edge",
    -- { "embark-theme/vim", as = "embark" },
    -- "norcalli/nvim-base16.lua",
    -- "RRethy/nvim-base16",
    -- "novakne/kosmikoa.nvim",
    -- "glepnir/zephyr-nvim",
    -- "ghifarit53/tokyonight-vim"
    -- "sainnhe/sonokai",
    -- "morhetz/gruvbox",
    -- "arcticicestudio/nord-vim",
    -- "drewtempelmeyer/palenight.vim",
    -- "Th3Whit3Wolf/onebuddy",
    -- "christianchiarulli/nvcode-color-schemes.vim",
    -- "Th3Whit3Wolf/one-nvim"

    "folke/tokyonight.nvim",
    opt = false,

    -- event = "VimEnter",
    config = function()
      require("config.theme")
    end,
  })

  -- Theme: icons
  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  })

  -- Dashboard
  use({ "glepnir/dashboard-nvim", config = [[require('config.dashboard')]] })

  use({
    "norcalli/nvim-terminal.lua",
    ft = "terminal",
    config = function()
      require("terminal").setup()
    end,
  })
  use({ "nvim-lua/plenary.nvim", module = "plenary" })
  -- use({ "nvim-lua/popup.nvim", module = "popup" })

  use({
    "windwp/nvim-spectre",
    opt = true,
    module = "spectre",
    wants = { "plenary.nvim", "popup.nvim" },
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  })

  use({ "junegunn/fzf", run = "./install --all && ln -sf $(pwd) ~/.fzf" })
  use({
    "ibhagwan/fzf-lua",
    requires = {
      "vijaymarupudi/nvim-fzf",
      "kyazdani42/nvim-web-devicons",
    }, -- optional for icons
  })

  use({
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("config.tree")
    end,
  })

  -- Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope")
    end,
    cmd = { "Telescope" },
    module = "telescope",
    keys = { "<leader><space>", "<leader>fz", "<leader>pp" },
    requires = {
      { "nvim-telescope/telescope-file-browser.nvim", module = "telescope._extensions.file_browser" },
      { "nvim-telescope/telescope-z.nvim", module = "telescope._extensions.z" },
      { "nvim-telescope/telescope-project.nvim", module = "telescope._extensions.project" },
      { "nvim-telescope/telescope-symbols.nvim", module = "telescope._extensions.symbols" },
      { "nvim-telescope/telescope-fzf-native.nvim", module = "telescope._extensions.fzf", run = "make" },
    },
  })

  -- Indent Guides and rainbow brackets
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("config.blankline")
    end,
  })

  -- Tabs
  use({
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = function()
      require("config.bufferline")
    end,
  })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    module = "nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    keys = "<C-/>",
    config = function()
      require("config.terminal")
    end,
  })

  -- Smooth Scrolling
  use({
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = function()
      require("config.scroll")
    end,
  })
  use({
    "edluffy/specs.nvim",
    after = "neoscroll.nvim",
    config = function()
      require("config.specs")
    end,
  })

  -- Git Gutter
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("config.gitsigns")
    end,
  })
  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("config.neogit")
    end,
  })

  -- Statusline
  use({
    "hoob3rt/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("config.lualine")
    end,
  })

  use({
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("config.colorizer")
    end,
  })

  use({ "npxbr/glow.nvim", cmd = "Glow" })

  use({
    "plasticboy/vim-markdown",
    opt = true,
    requires = "godlygeek/tabular",
    ft = "markdown",
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  })

  use({
    "ggandor/leap.nvim",
    keys = { "s", "S", "gh" },
    config = function()
      require("leap").setup({
        case_sensitive = true,
      })
      require("leap").set_default_keymaps()
      vim.keymap.set("n", "gh", function()
        vim.notify("hop")
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
        })
      end, {})
    end,
  })

  use({
    "folke/trouble.nvim",
    module = "trouble",
    event = "BufReadPre",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({ auto_open = false })
    end,
  })

  use({
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

  use({ "mbbill/undotree", cmd = "UndotreeToggle" })

  use({
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opt = true,
    wants = "twilight.nvim",
    requires = { "folke/twilight.nvim" },
    config = function()
      require("zen-mode").setup({
        plugins = { gitsigns = true, tmux = true, kitty = { enabled = false, font = "+2" } },
      })
    end,
  })

  use({
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("config.keys")
    end,
  })

  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    module = "diffview",
    config = function()
      require("config.diffview")
    end,
  })

  use({
    "RRethy/vim-illuminate",
    event = "CursorHold",
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
  })

  -- use({ "wellle/targets.vim" })

  -- use("DanilaMihailov/vim-tips-wiki")
  use("nanotee/luv-vimdocs")
  -- use({
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
  --   end,
  -- })
  use("kmonad/kmonad-vim")
  use({
    "https://gitlab.com/yorickpeterse/nvim-dd.git",
    config = function()
      require("dd").setup({
        timeout = 1000,
      })
    end,
  })
end

return packer.setup(config, plugins)
