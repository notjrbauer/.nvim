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
local package_path_str = "/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/johnbauer/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/FixCursorHold.nvim"
  },
  ale = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/ale"
  },
  ["compe-conjure"] = {
    after_files = { "/Users/johnbauer/.config/nvim/pack/packer/opt/compe-conjure/after/plugin/compe_conjure.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/compe-conjure"
  },
  conjure = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/conjure"
  },
  ["devdocs.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/devdocs.vim"
  },
  ["elly.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/elly.vim"
  },
  ["fern-git.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/fern-git.vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/fern.vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\né\2\0\0\a\0\n\1\0185\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\15\0016\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\a\0049\4\b\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\t\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\14textwidth\abo\bvim\1\17\0\0\24--config-precedence\16prefer-file\19--single-quote\25--no-bracket-spacing\17--prose-wrap\valways\19--arrow-parens\valways\21--trailing-comma\ball\14--no-semi\18--end-of-line\alf\18--print-width\0\21--stdin-filepath\1\0\2\bexe\rprettier\nstdin\2#€€À™\0046\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nshfmt\nstdin\2#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\nrefmt\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2>\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\3\0\0\f--quiet\6-\1\0\2\bexe\nblack\nstdin\2'\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\14goimports\nstdin\2$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\vnixfmt\nstdin\2s\0\0\3\0\6\0\b5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\4\1=\1\5\0L\0\2\0\targs\14textwidth\abo\bvim\1\6\0\0\19--indent-count\3\2\a-l\0\f--stdin\1\0\2\bexe\vluafmt\nstdin\2û\3\1\0\b\0\"\0M3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\0\1\6=\6\18\0054\6\3\0>\1\1\6=\6\19\0054\6\3\0>\1\1\6=\6\20\0054\6\3\0003\a\21\0>\a\1\6=\6\22\0054\6\3\0003\a\23\0>\a\1\6=\6\24\0054\6\3\0003\a\25\0>\a\1\6=\6\26\0054\6\3\0003\a\27\0>\a\1\6=\6\28\0054\6\3\0003\a\29\0>\a\1\6=\6\30\0054\6\3\0003\a\31\0>\a\1\6=\6 \5=\5!\4B\2\2\1K\0\1\0\rfiletype\blua\0\bnix\0\ago\0\vpython\0\trust\0\vreason\0\tbash\ash\thtml\fgraphql\tyaml\tless\tscss\tjson\bcss\rmarkdown\19typescript.tsx\19javascript.jsx\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17_.statusline\frequire\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    keys = { { "", "<Plug>(git-messenger)" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/git-messenger.vim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/glow.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/goyo.vim"
  },
  ["limelight.vim"] = {
    commands = { "Limelight" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/limelight.vim"
  },
  loupe = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/loupe"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/lspsaga.nvim"
  },
  ["night-owl.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/night-owl.vim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nR\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\bcss\2\1\3\0\0\6*\t!vim\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\n_.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16_.file_tree\frequire\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17_.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/playground"
  },
  ["space-vim-theme"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/space-vim-theme"
  },
  tabular = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/tabular"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/tcomment_vim"
  },
  ["tender.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/tender.vim"
  },
  terminus = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/terminus"
  },
  ["tpope-vim-abolish"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/tpope-vim-abolish"
  },
  typewriter = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/typewriter"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/undotree"
  },
  ["vim-colors-plain"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-colors-plain"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-devicons"
  },
  ["vim-easydir"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-easydir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-fugitive"
  },
  ["vim-gista"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-gista"
  },
  ["vim-github-hub"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-github-hub"
  },
  ["vim-grepper"] = {
    commands = { "Grepper" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-grepper"
  },
  ["vim-gruvbox8"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-gruvbox8"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-lion"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-markdown"
  },
  ["vim-moonfly-colors"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-moonfly-colors"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\në\3\0\0\b\0\18\0 6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0006\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\3\0049\4\4\0044\5\3\0005\6\b\0005\a\a\0=\a\t\0065\a\n\0=\a\v\0065\a\f\0=\a\r\6>\6\1\0055\6\15\0005\a\14\0=\a\t\0065\a\16\0=\a\v\0065\a\17\0=\a\r\6>\6\2\5B\1\4\2=\1\4\0K\0\1\0\1\2\0\0\6$\1\v\0\0\15typescript\20typescriptreact\19typescript.tsx\15javascript\20javascriptreact\19javascript.jsx\bzsh\tbash\nshell\bnix\1\0\0\1\3\0\0\a${\6}\ninput\1\2\0\0\6/\rfiletype\1\a\0\0\15typescript\20typescriptreact\19typescript.tsx\15javascript\20javascriptreact\19javascript.jsx\tbuns\1\0\1\nregex\3\1\1\3\0\0\v/\\*\\s*\v\\s*\\*/\nforce\15tbl_extend\21sandwich#recipes\6g0runtime macros/sandwich/keymap/surround.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-sayonara"
  },
  ["vim-sexp"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-sexp"
  },
  ["vim-substrata"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-substrata"
  },
  ["vim-tmux-navigator"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-tmux-navigator"
  },
  ["vim-two-firewatch"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/johnbauer/.config/nvim/pack/packer/opt/vim-two-firewatch"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-waikiki"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vim-waikiki"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/johnbauer/.config/nvim/pack/packer/start/vista.vim"
  }
}

-- Config for: vim-sandwich
try_loadstring("\27LJ\2\në\3\0\0\b\0\18\0 6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0006\1\0\0009\1\5\1'\3\6\0006\4\0\0009\4\3\0049\4\4\0044\5\3\0005\6\b\0005\a\a\0=\a\t\0065\a\n\0=\a\v\0065\a\f\0=\a\r\6>\6\1\0055\6\15\0005\a\14\0=\a\t\0065\a\16\0=\a\v\0065\a\17\0=\a\r\6>\6\2\5B\1\4\2=\1\4\0K\0\1\0\1\2\0\0\6$\1\v\0\0\15typescript\20typescriptreact\19typescript.tsx\15javascript\20javascriptreact\19javascript.jsx\bzsh\tbash\nshell\bnix\1\0\0\1\3\0\0\a${\6}\ninput\1\2\0\0\6/\rfiletype\1\a\0\0\15typescript\20typescriptreact\19typescript.tsx\15javascript\20javascriptreact\19javascript.jsx\tbuns\1\0\1\nregex\3\1\1\3\0\0\v/\\*\\s*\v\\s*\\*/\nforce\15tbl_extend\21sandwich#recipes\6g0runtime macros/sandwich/keymap/surround.vim\bcmd\bvim\0", "config", "vim-sandwich")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\nR\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\bcss\2\1\3\0\0\6*\t!vim\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: formatter.nvim
try_loadstring("\27LJ\2\né\2\0\0\a\0\n\1\0185\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\15\0016\2\2\0009\2\5\0029\2\6\0026\4\2\0009\4\a\0049\4\b\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\t\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\14textwidth\abo\bvim\1\17\0\0\24--config-precedence\16prefer-file\19--single-quote\25--no-bracket-spacing\17--prose-wrap\valways\19--arrow-parens\valways\21--trailing-comma\ball\14--no-semi\18--end-of-line\alf\18--print-width\0\21--stdin-filepath\1\0\2\bexe\rprettier\nstdin\2#€€À™\0046\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nshfmt\nstdin\2#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\nrefmt\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2>\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\3\0\0\f--quiet\6-\1\0\2\bexe\nblack\nstdin\2'\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\14goimports\nstdin\2$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\vnixfmt\nstdin\2s\0\0\3\0\6\0\b5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2>\2\4\1=\1\5\0L\0\2\0\targs\14textwidth\abo\bvim\1\6\0\0\19--indent-count\3\2\a-l\0\f--stdin\1\0\2\bexe\vluafmt\nstdin\2û\3\1\0\b\0\"\0M3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\0\1\6=\6\18\0054\6\3\0>\1\1\6=\6\19\0054\6\3\0>\1\1\6=\6\20\0054\6\3\0003\a\21\0>\a\1\6=\6\22\0054\6\3\0003\a\23\0>\a\1\6=\6\24\0054\6\3\0003\a\25\0>\a\1\6=\6\26\0054\6\3\0003\a\27\0>\a\1\6=\6\28\0054\6\3\0003\a\29\0>\a\1\6=\6\30\0054\6\3\0003\a\31\0>\a\1\6=\6 \5=\5!\4B\2\2\1K\0\1\0\rfiletype\blua\0\bnix\0\ago\0\vpython\0\trust\0\vreason\0\tbash\ash\thtml\fgraphql\tyaml\tless\tscss\tjson\bcss\rmarkdown\19typescript.tsx\19javascript.jsx\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0", "config", "formatter.nvim")
-- Config for: lspkind-nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17_.statusline\frequire\0", "config", "galaxyline.nvim")
-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16_.file_tree\frequire\0", "config", "nvim-tree.lua")
-- Conditional loads
if vim.fn.has('nvim-0.5.0') then
	vim.cmd [[packadd nvim-lspconfig]]
	-- Config for: nvim-lspconfig
	try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\n_.lsp\frequire\0", "config", "nvim-lspconfig")
		vim.cmd [[packadd nvim-treesitter]]
	-- Config for: nvim-treesitter
	try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17_.treesitter\frequire\0", "config", "nvim-treesitter")
end


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Grepper lua require("packer.load")({'vim-grepper'}, { cmd = "Grepper", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Limelight lua require("packer.load")({'limelight.vim'}, { cmd = "Limelight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

-- Keymap lazy-loads
vim.cmd [[noremap <silent> <Plug>(git-messenger) <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>Plug>(git-messenger)", prefix = "" }, _G.packer_plugins)<cr>]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType scheme ++once lua require("packer.load")({'vim-sexp', 'conjure', 'compe-conjure'}, { ft = "scheme" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-sexp', 'conjure', 'compe-conjure'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'vim-sexp', 'conjure', 'compe-conjure'}, { ft = "lisp" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
