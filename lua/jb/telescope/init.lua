if not pcall(require, "telescope") then
  return
end

local should_reload = true
local reloader = function()
  if should_reload then
    RELOAD "plenary"
    RELOAD "popup"
    RELOAD "telescope"
  end
end

reloader()

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_mt = require "telescope.actions.mt"
local sorters = require "telescope.sorters"
local themes = require "telescope.themes"

-- actions.master_stack = action_mt.create('master_stack', function(prompt_bufnr)
  --   local picker = action_state.get_current_picker(prompt_bufnr)

  --   actions.close(prompt_bufnr)

  --   vim.cmd [[tabnew]]
  --   for index, entry in ipairs(picker:get_multi_selection()) do
  --     if index == 1 then
  --       vim.cmd("edit " .. entry.filename)
  --     elseif index == 2 then
  --       vim.cmd("vsplit " .. entry.filename)
  --     else
  --       vim.cmd("split " .. entry.filename)
  --     end
  --   end

  --   vim.cmd [[wincmd =]]
  -- end)

  local set_prompt_to_entry_value = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    if not entry or not type(entry) == "table" then
      return
    end

    action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
  end

  -- local action_set = require('telescope.actions.set')
  local _ = pcall(require, "nvim-nonicons")

  require("telescope").setup {
    defaults = {
      prompt_prefix = "❯ ",
      selection_caret = "❯ ",

      winblend = 0,

      layout_strategy = "flex",
      layout_config = {
        width = 0.8,
        height = 0.85,
        preview_cutoff = 120,

        horizontal = {
          -- width_padding = 0.1,
          -- height_padding = 0.1,
          preview_width = 0.6,
        },

        vertical = {
          -- width_padding = 0.05,
          -- height_padding = 1,
          width = 0.9,
          height = 0.95,
          preview_height = 0.5,
        },

        flex = {
          horizontal = {
            preview_width = 0.9,
          },
        },
      },

      selection_strategy = "reset",
      prompt_position = "top",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      color_devicons = true,

      mappings = {
        i = {
          ["<C-x>"] = false,
          ["<C-s>"] = actions.select_horizontal,

          ["<C-y>"] = set_prompt_to_entry_value,

          -- ["<M-m>"] = actions.master_stack,

          -- Experimental
          -- ["<tab>"] = actions.toggle_selection,

          -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },

      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

      file_sorter = sorters.get_fzy_sorter,
      file_ignore_patterns = { "parser.c" },

      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },

    extensions = {
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },

      fzf_writer = {
        use_highlighter = false,
        minimum_grep_characters = 6,
      },

      frecency = {
        workspaces = {
          ["conf"] = "/home/johnbauer/.config/nvim/",
          ["nvim"] = "/home/johnbauer/build/neovim",
        },
      },
    },
  }

  -- Load the fzy native extension at the start.
  -- pcall(require('telescope').load_extension, "fzy_native")
  pcall(require("telescope").load_extension, "fzy_native")
  pcall(require("telescope").load_extension, "cheat")
  pcall(require("telescope").load_extension, "dap")
  pcall(require("telescope").load_extension, "arecibo")
  pcall(require("telescope").load_extension, "flutter")

  require("telescope").load_extension "fzf"
  if vim.fn.executable "gh" == 1 then
    pcall(require("telescope").load_extension, "gh")
    pcall(require("telescope").load_extension, "octo")
  end

  if pcall(require("telescope").load_extension, "frecency") then
    require "jb.telescope.frecency"
  end

  local M = {}

  --[[
  lua require('plenary.reload').reload_module("my_user.tele")
  nnoremap <leader>en <cmd>lua require('my_user.tele').edit_neovim()<CR>
  --]]
  function M.edit_neovim()
    require("telescope.builtin").find_files {
      prompt_title = "~ dotfiles ~",
      shorten_path = false,
      cwd = "~/.config/nvim",

      layout_strategy = "flex",
      layout_config = {
        width = 0.9,
        height = 0.8,

        horizontal = {
          width = { padding = 0.2 },
        },
        vertical = {
          preview_height = 0.75,
        },
      },

      attach_mappings = function(_, map)
        map("i", "<c-y>", set_prompt_to_entry_value)

        return true
      end,
    }
  end

  function M.find_nvim_source()
    require("telescope.builtin").find_files {
      prompt_title = "~ nvim ~",
      shorten_path = false,
      cwd = "~/build/neovim/",

      layout_strategy = "horizontal",
      layout_config = {
        preview_width = 0.35,
      },
    }
  end

  function M.sourcegraph_find()
    require("telescope.builtin").find_files {
      prompt_title = "~ sourcegraph ~",
      shorten_path = false,
      cwd = "~/sourcegraph/",

      layout_strategy = "horizontal",
      layout_config = {
        width = 0.25,
        preview_width = 0.65,
      },
    }
  end

  function M.sourcegraph_about_find()
    require("telescope.builtin").find_files {
      prompt_tiles = [[\ Sourcegraph About: Files /]],
      cwd = "~/sourcegraph/about/handbook/",

      sorter = require("telescope").extensions.fzy_native.native_fzy_sorter(),
    }
  end

  function M.sourcegraph_about_grep()
    require("telescope.builtin").live_grep {
      prompt_tiles = [[\ Sourcegraph About: Files /]],
      cwd = "~/sourcegraph/about/",

      -- sorter = require('telescope').extensions.fzy_native.native_fzy_sorter(),
    }
  end

  -- TODO: Should work on a wiki at some point....
  --function M.sourcegraph_tips()
    --  -- TODO: Can make this optionally fuzzy find over the contents as well
    --  --    if we want to start getting fancier
    --  --
    --  --    Could even make it do that _only_ when doing something like ";" or similar.

    --  require('telescope.builtin').find_files {
      --    prompt_title = "~ sourcegraph ~",
      --    shorten_path = false,
      --    cwd = "~/wiki/sourcegraph/tips",
      --    width = .25,

      --    layout_strategy = 'horizontal',
      --    layout_config = {
        --      preview_width = 0.65,
        --    },
        --  }
        --end

        function M.edit_zsh()
          require("telescope.builtin").find_files {
            shorten_path = false,
            cwd = "~/.config/zsh/",
            prompt = "~ dotfiles ~",
            hidden = true,

            layout_strategy = "horizontal",
            layout_config = {
              preview_width = 0.55,
            },
          }
        end

        function M.fd()
          require("telescope.builtin").fd( require('telescope.themes').get_dropdown({ winblend = 10 }))
        end

        function M.builtin()
          require("telescope.builtin").builtin()
        end

        function M.git_files()
          local path = vim.fn.expand "%:h"

          local width = 0.25
          if string.find(path, "sourcegraph.*sourcegraph", 1, false) then
            width = 0.5
          end

          local opts = themes.get_dropdown {
            winblend = 5,
            shorten_path = false,

            cwd = path,

            layout_config = {
              width = width,
            },
          }

          require("telescope.builtin").git_files(opts)
        end

        function M.buffer_git_files()
          require("telescope.builtin").git_files(themes.get_dropdown {
            cwd = vim.fn.expand "%:p:h",
            winblend = 10,
            border = true,
            previewer = false,
            shorten_path = false,
          })
        end

        function M.lsp_code_actions()
          local opts = themes.get_dropdown {
            winblend = 10,
            border = true,
            previewer = false,
            shorten_path = false,
          }

          require("telescope.builtin").lsp_code_actions(opts)
        end

        function M.live_grep()
          require("telescope").extensions.fzf_writer.staged_grep {
            shorten_path = true,
            previewer = false,
            fzf_separator = "|>",
          }
        end

        function M.grep_prompt()
          require("telescope.builtin").grep_string {
            shorten_path = true,
            search = vim.fn.input "Grep String > ",
          }
        end

        function M.grep_last_search(opts)
          opts = opts or {}

          -- \<getreg\>\C
          -- -> Subs out the search things
          local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

          opts.shorten_path = true
          opts.word_match = "-w"
          opts.search = register

          require("telescope.builtin").grep_string(opts)
        end

        function M.oldfiles()
          if true then
            require("telescope").extensions.frecency.frecency()
          end
          if pcall(require("telescope").load_extension, "frecency") then
          else
            require("telescope.builtin").oldfiles { layout_strategy = "vertical" }
          end
        end

        function M.my_plugins()
          require("telescope.builtin").find_files {
            cwd = "~/plugins/",
          }
        end

        function M.installed_plugins()
          require("telescope.builtin").find_files {
            cwd = vim.fn.stdpath "data" .. "/site/pack/packer/start/",
          }
        end

        function M.project_search()
          require("telescope.builtin").find_files {
            previewer = false,
            layout_strategy = "vertical",
            cwd = require("nvim_lsp.util").root_pattern ".git"(vim.fn.expand "%:p"),
          }
        end

        function M.buffers()
          require("telescope.builtin").buffers {
            shorten_path = false,
          }
        end

        function M.curbuf()
          local opts = themes.get_dropdown {
            winblend = 10,
            border = true,
            previewer = false,
            shorten_path = false,
          }
          require("telescope.builtin").current_buffer_fuzzy_find(opts)
        end

        function M.help_tags()
          require("telescope.builtin").help_tags {
            show_version = true,
          }
        end

        function M.search_all_files()
          require("telescope.builtin").find_files {
            find_command = { "rg", "--no-ignore", "--files" },
          }
        end

        function M.example_for_prime()
          -- local Sorter = require('telescope.sorters')

          -- require('telescope.builtin').find_files {
            --   sorter = Sorter:new {
              -- }
            end

            function M.file_browser()
              local opts

              opts = {
                sorting_strategy = "ascending",
                scroll_strategy = "cycle",
                layout_config = {
                  prompt_position = "top",
                },

                attach_mappings = function(prompt_bufnr, map)
                  local current_picker = action_state.get_current_picker(prompt_bufnr)

                  local modify_cwd = function(new_cwd)
                    current_picker.cwd = new_cwd
                    current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
                  end

                  map("i", "-", function()
                    modify_cwd(current_picker.cwd .. "/..")
                  end)

                  map("i", "~", function()
                    modify_cwd(vim.fn.expand "~")
                  end)

                  local modify_depth = function(mod)
                    return function()
                      opts.depth = opts.depth + mod

                      local current_picker = action_state.get_current_picker(prompt_bufnr)
                      current_picker:refresh(opts.new_finder(current_picker.cwd), { reset_prompt = true })
                    end
                  end

                  map("i", "<M-=>", modify_depth(1))
                  map("i", "<M-+>", modify_depth(-1))

                  map("n", "yy", function()
                    local entry = action_state.get_selected_entry()
                    vim.fn.setreg("+", entry.value)
                  end)

                  return true
                end,
              }

              require("telescope.builtin").file_browser(opts)
            end

            function M.git_status()
              local opts = themes.get_dropdown {
                winblend = 10,
                border = true,
                previewer = false,
                shorten_path = false,
              }

              -- Can change the git icons using this.
              -- opts.git_icons = {
                --   changed = "M"
                -- }

                require("telescope.builtin").git_status(opts)
              end

              function M.git_commits()
                require("telescope.builtin").git_commits {
                  winblend = 5,
                }
              end

              function M.search_only_certain_files()
                require("telescope.builtin").find_files {
                  find_command = {
                    "rg",
                    "--files",
                    "--type",
                    vim.fn.input "Type: ",
                  },
                }
              end

              return setmetatable({}, {
                __index = function(_, k)
                  reloader()

                  if M[k] then
                    return M[k]
                  else
                    return require("telescope.builtin")[k]
                  end
                end,
              })
