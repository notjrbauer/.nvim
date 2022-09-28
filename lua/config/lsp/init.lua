local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local M = {
  event = "BufReadPre",
}

function M.config()
  -- require("workspace").setup()
  require("config.mason").setup()
  require("config.lsp.diagnostics").setup()
  require("fidget").setup({ text = { spinner = "dots" } })

  local function on_attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("config.lsp.formatting").setup(client, bufnr)
    require("config.lsp.keys").setup(client, bufnr)
  end

  local sumneko = function() 
    return lspconfig.sumneko_lua.setup(require("lua-dev").setup({
        single_file_support = true,
        settings = {
          Lua = {
            diagnostics = {
              unusedLocalExclude = { "_*" },
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
          },
        },
      }))
    end
  ---@type lspconfig.options
  local servers = {
    ansiblels = {},
    bashls = {},
    clangd = {},
    cssls = {},
    dockerls = {},
    denols= {},
    eslint = {},
    html = {},
    jsonls = {
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },
    pyright = {},
    rust_analyzer = {
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
    },
    sumneko_lua = sumneko(),
    vimls = {},
    -- tailwindcss = {},
  }

  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ---@type _.lspconfig.options
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
      require("lspconfig")[server].setup(opts)
    end

  require("config.lsp.null-ls").setup(options)
end

return M
