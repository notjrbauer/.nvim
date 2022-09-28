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
  auto_reload_compiled = false,
  -- list of plugins that should be taken from ~/projects
  -- this is NOT packer functionality!
  local_plugins = {
    folke = false,
    ["null-ls.nvim"] = false,
    ["nvim-lspconfig"] = false,
  },
}

local function plugins(use)
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim" })
  use({ "stevearc/dressing.nvim" })
  -- use({
  -- "rcarriga/nvim-notify",
  -- event = "VimEnter",
  -- config = function()
  -- vim.notify = require("notify")
  -- end,
  -- })
  -- LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp").config()
    end,
  })

  use({
    "anuvyklack/windows.nvim",
    config = function()
      require("config.windows").config()
    end,
    requires = {
      { "anuvyklack/middleclass", module = "middleclass" },
      { "anuvyklack/animation.nvim", module = "animation" },
    },
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
    "williamboman/mason.nvim",
    opt = false,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    opt = false,
  })
  use({
    "SmiteshP/nvim-navic",
    module = "nvim-navic",
    wants = "nvim-treesitter",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = "   " })
    end,
  })

  use({
    "simrat39/rust-tools.nvim",
    module = "rust-tools",
  })

  use({ "famiu/bufdelete.nvim", cmd = "Bdelete" })

  use({
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require("config.scrollbar")
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    module = "cmp",
    event = "InsertEnter",
    config = function()
      require("config.cmp")
    end,
    requires = {
      { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
  })
  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    module = "nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
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
  use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = function()
      require("symbols-outline").setup()
    end,
  })
  use({
    "numToStr/Comment.nvim",
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup({})
    end,
  })
  use({ "nvim-treesitter/tree-sitter-query" })
  -- use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  use({
    "nvim-treesitter/nvim-treesitter",
    -- event = "BufRead",
    module = "nvim-treesitter",
    config = function()
      require("config.treesitter")
    end,
  })

  use({ "nvim-treesitter/playground", cmd = "TSHighlightCapturesUnderCursor" })
  --
  use({ "christoomey/vim-tmux-navigator", opt = false })
  --
  -- -- Debug adapter protocol
  -- --   Have not yet checked this out, but looks awesome.
  -- -- use 'puremourning/vimspectorop'
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap").setup()
    end,
  })
  -- --  use("puremourning/vimspector")
  use({
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
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
    "danymat/neogen",
    module = "neogen",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  })
  --
  -- -- Theme: color schemes
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "folke/tokyonight.nvim",

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
  use({ "glepnir/dashboard-nvim", opt = false, config = [[require('config.dashboard')]] })
  use({
    "norcalli/nvim-terminal.lua",
    ft = "terminal",
    config = function()
      require("terminal").setup()
    end,
  })
  use({ "nvim-lua/plenary.nvim", module = "plenary" })
  --
  use({
    "windwp/nvim-spectre",
    module = "spectre",
  })
  --
  -- use({ "junegunn/fzf", run = "./install --all && ln -sf $(pwd) ~/.fzf" })
  use({
    "ibhagwan/fzf-lua",
    opt = false,
    requires = {
      "vijaymarupudi/nvim-fzf",
      "kyazdani42/nvim-web-devicons",
    }, -- optional for icons
  })
  --
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
  --
  -- Indent Guides and rainbow brackets
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.blankline")
    end,
  })
  --
  -- Tabs
  use({
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = function()
      require("config.bufferline")
    end,
  })
  --
  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    keys = "<C-/>",
    config = function()
      require("config.terminal")
    end,
  })
  --
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
  --
  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = [[require('config.lualine')]],
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
    "phaazon/hop.nvim",
    cmd = "HopWord",
    module = "hop",
    keys = { "gh", "f", "F", "t", "T" },
    config = function()
      require("config.jump")
    end,
  })

  use({
    "folke/trouble.nvim",
    module = "trouble",
    event = "BufReadPre",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({
        auto_open = false,
        use_diagnostic_signs = true, -- en
      })
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
  --
  use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

  use({ "mbbill/undotree", cmd = "UndotreeToggle" })

  use({ "folke/twilight.nvim", module = "twilight" })
  use({
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
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
  -- --
  -- -- use({
  -- --   "sindrets/diffview.nvim",
  -- --   cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  -- --   module = "diffview",
  -- --   config = function()
  -- --     require("config.diffview")
  -- --   end,
  -- -- })
  use("nanotee/luv-vimdocs")
  use({
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  })
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
