local has = function(x)
  return vim.fn.has(x) == 0
end

local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not (not string.find(output[1] or "", "WSL"))
end)()

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"

    local local_use = function(first, second)
      local plug_path, home
      if second == nil then
        plug_path = first
        home = "tjdevries"
      else
        plug_path = second
        home = first
      end

      if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
        use("~/plugins/" .. plug_path)
      else
        use(string.format("%s/%s", home, plug_path))
      end
    end

    local_use "nlua.nvim"
    local_use "colorbuddy.nvim"
    local_use "astronauta.nvim"
    local_use "express_line.nvim"

    use "marko-cerovac/material.nvim"
    use "jacobb/tender.vim"
    use "bfredl/nvim-luadev"
    -- LSP Plugins:

    -- NOTE: lspconfig ONLY has configs, for people reading this :)
    use "neovim/nvim-lspconfig"
    use "wbthomason/lsp-status.nvim"
    use "christoomey/vim-tmux-navigator"
    use {
      "mhartington/formatter.nvim",
      config = function()
        local function prettier()
          return {
            exe = "prettier",
            args = {
              "--config-precedence",
              "prefer-file",
              "--single-quote",
              "--no-bracket-spacing",
              "--prose-wrap",
              "always",
              "--arrow-parens",
              "always",
              "--trailing-comma",
              "all",
              "--no-semi",
              "--end-of-line",
              "lf",
              "--print-width",
              vim.bo.textwidth,
              "--stdin-filepath",
              vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = true
          }
        end

        local function shfmt()
          return {
            exe = "shfmt",
            args = {"-"},
            stdin = true
          }
        end

        require "formatter".setup(
          {
            logging = false,
            filetype = {
              javascript = {prettier},
              typescript = {prettier},
              ["javascript.jsx"] = {prettier},
              ["typescript.tsx"] = {prettier},
              markdown = {prettier},
              css = {prettier},
              json = {prettier},
              scss = {prettier},
              less = {prettier},
              yaml = {prettier},
              graphql = {prettier},
              html = {prettier},
              sh = {shfmt},
              bash = {shfmt},
              reason = {
                function()
                  return {
                    exe = "refmt",
                    stdin = true
                  }
                end
              },
              rust = {
                function()
                  return {
                    exe = "rustfmt",
                    args = {"--emit=stdout"},
                    stdin = true
                  }
                end
              },
              python = {
                function()
                  return {
                    exe = "black",
                    args = {"--quiet", "-"},
                    stdin = true
                  }
                end
              },
              go = {
                function()
                  return {
                    exe = "goimports",
                    stdin = true
                  }
                end
              },
              nix = {
                function()
                  return {
                    exe = "nixfmt",
                    stdin = true
                  }
                end
              },
              lua = {
                function()
                  return {
                    exe = "luafmt",
                    args = {
                      "--indent-count",
                      2,
                      "--stdin"
                    },
                    stdin = true
                  }
                end
              }
            }
          }
        )
      end
    }
    use "nvim-lua/lsp_extensions.nvim"
    use "glepnir/lspsaga.nvim"
    use "onsails/lspkind-nvim"
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        -- Can use P to toggle auto movement
        require("trouble").setup {
          auto_preview = false,
          auto_fold = true
        }
      end
    }

    local_use("nvim-lua", "popup.nvim")
    local_use("nvim-lua", "plenary.nvim")

    local_use("nvim-telescope", "telescope.nvim")
    local_use("nvim-telescope", "telescope-fzf-writer.nvim")
    local_use("nvim-telescope", "telescope-packer.nvim")
    local_use("nvim-telescope", "telescope-fzy-native.nvim")
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }

    local_use("nvim-telescope", "telescope-github.nvim")
    local_use("nvim-telescope", "telescope-symbols.nvim")

    local_use "telescope-hacks.nvim"

    use "tami5/sql.nvim"
    use "nvim-telescope/telescope-frecency.nvim"
    use "nvim-telescope/telescope-cheat.nvim"

    use {
      "antoinemadec/FixCursorHold.nvim",
      run = function()
        vim.g.curshold_updatime = 1000
      end
    }

    -- VIM EDITOR: {{{

    -- Little know features:
    --   :SSave
    --   :SLoad
    --       These are wrappers for mksession that work great. I never have to use
    --       mksession anymore or worry about where things are saved / loaded from.
    use "mhinz/vim-startify"

    -- Better profiling output for startup.
    use "dstein64/vim-startuptime"
    -- use 'tweekmonster/startuptime.vim'  -- Might switch back to this, but they are incompatible.

    -- Pretty colors
    use "norcalli/nvim-colorizer.lua"
    use "norcalli/nvim-terminal.lua"

    -- Quickfix enhancements. See :help vim-qf
    use "romainl/vim-qf"

    use {
      "glacambre/firenvim",
      run = function()
        vim.fn["firenvim#install"](0)
      end
    }

    use "kyazdani42/nvim-web-devicons"
    if not is_wsl then
      use "yamatsum/nvim-web-nonicons"
    end

    use "kyazdani42/nvim-tree.lua"
    use "lambdalisue/vim-protocol"

    -- Undo helper
    use "sjl/gundo.vim"

    --   FOCUSING: {{{
    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"
    --   }}}
    -- }}}
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install"
    }
    -- Linters & Code quality {{{

    use "hrsh7th/nvim-compe"

    -- Debug adapter protocol
    use "mfussenegger/nvim-dap"
    use "theHamsta/nvim-dap-virtual-text"
    use "mfussenegger/nvim-dap-python"
    use "nvim-telescope/telescope-dap.nvim"

    if has "python3" then
      use {
        "rcarriga/vim-ultest",
        requires = {
          "vim-test/vim-test"
        },
        run = ":UpdateRemotePlugins",
        cond = function()
          return vim.fn.has "python3" == 1
        end,
        config = function()
          vim.cmd [[nmap ]t <Plug>(ultest-next-fail)]]
          vim.cmd [[nmap [t <Plug>(ultest-prev-fail)]]
        end
      }

      use "alfredodeza/pytest.vim"
    end

    if false and has "python3" then
      use "puremourning/vimspector"
    end
    -- }}}

    -- TREE SITTER: {{{
    local_use("nvim-treesitter", "nvim-treesitter")
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/playground"

    -- Grammars

    -- }}}
    use "tamago324/lir.nvim"

    use "pechorin/any-jump.vim"
    use "tpope/vim-commentary" -- Easily comment out lines or objects
    use "tpope/vim-repeat" -- Repeat actions better

    -- GIT: {{{
    -- gita replacement
    -- use 'lambdalisue/gina.vim'

    -- Github integration
    if vim.fn.executable "gh" == 1 then
      use "pwntester/octo.nvim"
    end
    use "ruifm/gitlinker.nvim"

    -- Sweet message committer
    use "rhysd/committia.vim"

    -- Async signs!
    if has "nvim-0.5" then
      use "lewis6991/gitsigns.nvim"
    end

    -- }}}
    --
    use {
      "junegunn/fzf",
      run = "./install --all"
    } -- Fuzzy Searcher
    use {
      "junegunn/fzf.vim"
    }
  end,
  config = {
    _display = {
      open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win =
          pcall(
          function()
            return require("plenary.window.float").percentage_range_window(0.8, 0.8)
          end
        )

        if not ok then
          vim.cmd [[65vnew  [packer] ]]

          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.bufnr
        local win = float_win.win_id

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, "winblend", 10)

        return win, bufnr
      end
    }
  }
}
