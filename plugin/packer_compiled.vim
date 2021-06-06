" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["any-jump.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\né\2\0\0\a\0\n\1\0185\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\15\0016\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\a\0049\4\b\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\t\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\14textwidth\abo\bvim\1\17\0\0\24--config-precedence\16prefer-file\19--single-quote\25--no-bracket-spacing\17--prose-wrap\valways\19--arrow-parens\valways\21--trailing-comma\ball\14--no-semi\18--end-of-line\alf\18--print-width\0\21--stdin-filepath\1\0\2\bexe\rprettier\nstdin\2#€€À™\0046\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nshfmt\nstdin\2#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\nrefmt\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2>\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\3\0\0\f--quiet\6-\1\0\2\bexe\nblack\nstdin\2'\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\14goimports\nstdin\2$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\vnixfmt\nstdin\2N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\bexe\vluafmt\nstdin\2û\3\1\0\b\0\"\0M3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\0\1\6=\6\18\0054\6\3\0>\1\1\6=\6\19\0054\6\3\0>\1\1\6=\6\20\0054\6\3\0003\a\21\0>\a\1\6=\6\22\0054\6\3\0003\a\23\0>\a\1\6=\6\24\0054\6\3\0003\a\25\0>\a\1\6=\6\26\0054\6\3\0003\a\27\0>\a\1\6=\6\28\0054\6\3\0003\a\29\0>\a\1\6=\6\30\0054\6\3\0003\a\31\0>\a\1\6=\6 \5=\5!\4B\2\2\1K\0\1\0\rfiletype\blua\0\bnix\0\ago\0\vpython\0\trust\0\vreason\0\tbash\ash\thtml\fgraphql\tyaml\tless\tscss\tjson\bcss\rmarkdown\19typescript.tsx\19javascript.jsx\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0" },
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["gundo.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/gundo.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17auto_preview\1\14auto_fold\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-luadev"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-web-nonicons"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/nvim-web-nonicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-hacks.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-hacks.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/tender.vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-protocol"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-protocol"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/johnbauer/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  }
}

time("Defining packer_plugins", false)
-- Config for: lsp-trouble.nvim
time("Config for lsp-trouble.nvim", true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17auto_preview\1\14auto_fold\2\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time("Config for lsp-trouble.nvim", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\né\2\0\0\a\0\n\1\0185\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\15\0016\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\a\0049\4\b\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\t\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\14textwidth\abo\bvim\1\17\0\0\24--config-precedence\16prefer-file\19--single-quote\25--no-bracket-spacing\17--prose-wrap\valways\19--arrow-parens\valways\21--trailing-comma\ball\14--no-semi\18--end-of-line\alf\18--print-width\0\21--stdin-filepath\1\0\2\bexe\rprettier\nstdin\2#€€À™\0046\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nshfmt\nstdin\2#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\nrefmt\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2>\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\3\0\0\f--quiet\6-\1\0\2\bexe\nblack\nstdin\2'\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\14goimports\nstdin\2$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\vnixfmt\nstdin\2N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\bexe\vluafmt\nstdin\2û\3\1\0\b\0\"\0M3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\0\1\6=\6\18\0054\6\3\0>\1\1\6=\6\19\0054\6\3\0>\1\1\6=\6\20\0054\6\3\0003\a\21\0>\a\1\6=\6\22\0054\6\3\0003\a\23\0>\a\1\6=\6\24\0054\6\3\0003\a\25\0>\a\1\6=\6\26\0054\6\3\0003\a\27\0>\a\1\6=\6\28\0054\6\3\0003\a\29\0>\a\1\6=\6\30\0054\6\3\0003\a\31\0>\a\1\6=\6 \5=\5!\4B\2\2\1K\0\1\0\rfiletype\blua\0\bnix\0\ago\0\vpython\0\trust\0\vreason\0\tbash\ash\thtml\fgraphql\tyaml\tless\tscss\tjson\bcss\rmarkdown\19typescript.tsx\19javascript.jsx\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
