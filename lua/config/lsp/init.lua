local util = require("util")
local lspconfig = require("lspconfig")

if vim.lsp.setup then
  vim.lsp.setup({
    floating_preview = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
    diagnostics = {
      signs = { error = " ", warning = " ", hint = " ", information = " " },
      display = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    completion = {
      kind = {
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Enum = "了 ",
        EnumMember = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = "ﰮ ",
        Keyword = " ",
        Method = "ƒ ",
        Module = " ",
        Property = " ",
        Snippet = "﬌ ",
        Struct = " ",
        Text = " ",
        Unit = " ",
        Value = " ",
        Variable = " ",
      },
    },
  })
else
  -- require("config.lsp.saga")
  require("config.lsp.diagnostics")
  require("config.lsp.kind").setup()
end

local function on_attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  -- require("config.lsp.completion").setup(client, bufnr)
  require("config.lsp.highlighting").setup(client)

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    require("config.lsp.ts-utils").setup(client)
  end
end

local lsp_installer_servers = require("nvim-lsp-installer.servers")

local ok, sumneko_lua = lsp_installer_servers.get_server("sumneko_lua")
if ok then
  if not sumneko_lua:is_installed() then
    sumneko_lua:install()
  end
end

local lua_cmd = sumneko_lua._default_options.cmd

local servers = {
  pyright = {},
  bashls = {},
  dockerls = {},
  tsserver = {},
  cssls = {},
  jsonls = {},
  html = {},
  clangd = {},
  gopls = {},
  -- intelephense = {},
  ["null-ls"] = {},
  sumneko_lua = {
    cmd = lua_cmd,
  },
  efm = require("config.lsp.efm").config,
  vimls = {},
  -- tailwindcss = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lua-dev").setup()
require("config.lsp.null-ls").setup()

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }, config))
  local cfg = lspconfig[server]
  if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
    -- util.error(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
  end
end
lspconfig["sumneko_lua"].setup({
  cmd = lua_cmd,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
