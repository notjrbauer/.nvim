local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

dap.set_log_level("TRACE")

-- TODO: How does terminal work?
dap.defaults.fallback.external_terminal = {
  command = "/home/tjdevries/.local/bin/kitty",
  args = { "-e" },
}

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function()
      return "127.0.0.1"
    end,
    port = function()
      -- local val = tonumber(vim.fn.input('Port: '))
      -- assert(val, "Please provide a port number")
      local val = 54231
      return val
    end,
  },
}

dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host, port = config.port })
end

vim.g.dap_virtual_text = true

-- dap.adapters.cpp = {
--   type = 'executable',
--   attach = {
--     pidProperty = "pid",
--     pidSelect = "ask"
--   },
--   command = 'lldb-vscode-11',
--   env = {
--     LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY
