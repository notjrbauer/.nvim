local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end
local query = require("vim.treesitter.query")

local M = {}

local tests_query = [[
(function_declaration
  name: (identifier) @testname
  parameters: (parameter_list
    . (parameter_declaration
      type: (pointer_type) @type) .)
  (#eq? @type "*testing.T")
  (#match? @testname "^Test.+$")) @parent
]]

local subtests_query = [[
(call_expression
  function: (selector_expression
    operand: (identifier)
    field: (field_identifier) @run)
  arguments: (argument_list
    (interpreted_string_literal) @testname
    (func_literal))
  (#eq? @run "Run")) @parent
]]

local function load_module(module_name)
  local ok, module = pcall(require, module_name)
  assert(ok, string.format("dap-go dependency error: %s not installed", module_name))
  return module
end

local function setup_go_adapter(dap)
  dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local host = config.host or "127.0.0.1"
    local port = config.port or "38697"
    local addr = string.format("%s:%s", host, port)
    local opts = {
      stdio = { nil, stdout },
      args = { "-c", "dlv", "dap", "-l", addr },
      detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("b5env", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print("dlv exited with code", code)
      end
    end)
    -- print(pid_or_err)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require("dap.repl").append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(function()
      callback({ type = "server", host = "127.0.0.1", port = port })
    end, 100)
  end
end

local function setup_go_configuration(dap)
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
    {
      type = "go",
      name = "Attach to process",
      request = "attach",
      dlvToolPath = "$GOPATH/bin/dlv",
      program = "${file}",
      -- pid = require("dap.utils").pick_process,
      processId = require("dap.utils").pick_process,
    },
  }
end

function M.setup()
  local dap = load_module("dap")
  setup_go_adapter(dap)
  setup_go_configuration(dap)
  setup_ui()
end

local function debug_test(testname)
  local dap = load_module("dap")
  dap.run({
    type = "go",
    name = testname,
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
    args = { "-test.run", testname },
  })
end

local function get_closest_above_cursor(test_tree)
  local result
  for _, curr in pairs(test_tree) do
    if not result then
      result = curr
    else
      local node_row1, _, _, _ = curr.node:range()
      local result_row1, _, _, _ = result.node:range()
      if node_row1 > result_row1 then
        result = curr
      end
    end
  end
  if result.parent then
    return string.format("%s/%s", result.parent, result.name)
  else
    return result.name
  end
end

local function is_parent(dest, source)
  if not (dest and source) then
    return false
  end
  if dest == source then
    return false
  end

  local current = source
  while current ~= nil do
    if current == dest then
      return true
    end

    current = current:parent()
  end

  return false
end

local function get_closest_test()
  local stop_row = vim.api.nvim_win_get_cursor(0)[1]
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  assert(ft == "go", "dap-go error: can only debug go files, not " .. ft)
  local parser = vim.treesitter.get_parser(0)
  local root = (parser:parse()[1]):root()

  local test_tree = {}

  local test_query = vim.treesitter.parse_query(ft, tests_query)
  assert(test_query, "dap-go error: could not parse test query")
  for _, match, _ in test_query:iter_matches(root, 0, 0, stop_row) do
    local test_match = {}
    for id, node in pairs(match) do
      local capture = test_query.captures[id]
      if capture == "testname" then
        local name = query.get_node_text(node, 0)
        test_match.name = name
      end
      if capture == "parent" then
        test_match.node = node
      end
    end
    table.insert(test_tree, test_match)
  end

  local subtest_query = vim.treesitter.parse_query(ft, subtests_query)
  assert(subtest_query, "dap-go error: could not parse test query")
  for _, match, _ in subtest_query:iter_matches(root, 0, 0, stop_row) do
    local test_match = {}
    for id, node in pairs(match) do
      local capture = subtest_query.captures[id]
      if capture == "testname" then
        local name = query.get_node_text(node, 0)
        test_match.name = string.gsub(string.gsub(name, " ", "_"), '"', "")
      end
      if capture == "parent" then
        test_match.node = node
      end
    end
    table.insert(test_tree, test_match)
  end

  table.sort(test_tree, function(a, b)
    return is_parent(a.node, b.node)
  end)

  for _, parent in ipairs(test_tree) do
    for _, child in ipairs(test_tree) do
      if is_parent(parent.node, child.node) then
        child.parent = parent.name
      end
    end
  end

  return get_closest_above_cursor(test_tree)
end

function M.debug_test()
  local testname = get_closest_test()
  local msg = string.format("starting debug session '%s'...", testname)
  print(msg)
  debug_test(testname)
end

function setup_ui()
  local dap_ui = require("dapui")

  require("dapui").setup({
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    sidebar = { size = 80 },
    windows = { indent = 1 },
    floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
  })

  vim.fn.sign_define("DapBreakpoint", { text = "→", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "→", texthl = "Success", linehl = "", numhl = "" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
  end

  -- vim.cmd([[nnoremap <silent> <F5> :lua require'dap'.continue()<CR>]])
  -- vim.cmd([[nnoremap <silent> <F1> :lua require'dap'.step_into()<CR>]])
  -- vim.cmd([[nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>]])

  -- vim.cmd([[nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>]])
  -- vim.cmd([[nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
  -- vim.cmd([[nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>]])

  -- vim.cmd([[nnoremap <silent> <space>dh :lua require('dap.ui.variables').hover()<CR>]])

  vim.cmd([[
augroup DapRepl
  au!
  au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END
]])
end

return M
