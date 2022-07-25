require("config.lsp.diagnostics").setup()
require("config.lsp.kind").setup()
require("lua-dev").setup()
require("mason").setup()

-- require("nvim-lsp-installer").setup({
--   automatic_installation = true,
-- })

local function on_attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  require("lsp_signature").on_attach({
    zindex = 50,
    hi_parameter = "Search",
    floating_window = false,
  }, bufnr)

  -- require("config.lsp.completion").setup(client, bufnr)
  require("config.lsp.highlighting").setup(client)

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    require("config.lsp.ts-utils").setup(client)
  end
end

local servers = {
  pyright = {},
  bashls = {},
  dockerls = {},
  gopls = {},
  tsserver = {},
  cssls = {},
  jsonls = {},
  html = {},
  clangd = {},
  sumneko_lua = {},
  vimls = {},
  eslint = {},
  zls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  -- tailwindcss = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
