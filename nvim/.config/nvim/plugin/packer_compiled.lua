-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/txema/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/txema/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/txema/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/txema/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/txema/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n@\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\27custom_plugins/luasnip\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nC\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\30custom_plugins/bufferline\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dracula.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27custom_plugins/dracula\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÓ\1\0\0\4\0\f\0\0206\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\n\0005\3\t\0=\3\v\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\2\25show_current_context\2\31show_current_context_start\2\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\feol:‚Ü¥\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupyter_ascending.vim"] = {
    commands = { "JupyterExecute", "JupyterExecuteAll" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/opt/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n@\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\27custom_plugins/lualine\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n>\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\25custom_plugins/neorg\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n…\1\0\0\b\0\v\1\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\0065\a\a\0=\a\b\6B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\radapters\1\0\0\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\1\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\a\0\v\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\6\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\a\0049\4\b\4>\4\3\3=\3\n\2B\0\2\1K\0\1\0\fsources\1\0\0\tmypy\16diagnostics\tyapf\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n<\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\23custom_plugins/cmp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nÖ\3\0\0\4\0\15\0!6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0005\3\b\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\t\0005\3\n\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0005\3\f\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0005\3\14\0B\0\3\1K\0\1\0\1\0\4\vtexthl\5\nnumhl\5\ttext\f‚û°Ô∏è \vlinehl\5\15DapStopped\1\0\4\vtexthl\5\nnumhl\5\ttext\tüü¢\vlinehl\5\16DapLogPoint\1\0\4\vtexthl\5\nnumhl\5\ttext\tüü†\vlinehl\5\27DapBreakpointCondition\1\0\4\vtexthl\5\nnumhl\5\ttext\tüî¥\vlinehl\5\18DapBreakpoint\16sign_define\afn\bvim\nsetup\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/lspconfig\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-miniyank"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-miniyank",
    url = "https://github.com/bfredl/nvim-miniyank"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n?\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\26custom_plugins/notify\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\n¶\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fexclude\1\3\0\0\vSearch\15CursorLine\17extra_groups\1\3\0\0\20TelescopeNormal\19NvimTreeNormal\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/nvim-tree\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "neorg" },
    config = { "\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["opsort.vim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/opsort.vim",
    url = "https://github.com/ralismark/opsort.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-vimwiki.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/telescope-vimwiki.nvim",
    url = "https://github.com/ElPiloto/telescope-vimwiki.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nò\3\0\0\2\0\17\1)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\f\0006\0\0\0009\0\1\0*\1\0\0=\1\r\0006\0\0\0009\0\1\0*\1\0\0=\1\14\0006\0\0\0009\0\1\0)\1\0\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0K\0\1\0\23floaterm_autoclose\22floaterm_wintitle\20floaterm_height\19floaterm_width\24floaterm_autoinsert\rfloaterm\23floaterm_gitcommit\t<F4>\24floaterm_keymap_new\t<F3>\25floaterm_keymap_prev\t<F2>\25floaterm_keymap_next\t<F1>\27floaterm_keymap_toggle\6g\bvimµÊÃô\19ô≥¶ˇ\3\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30custom_plugins.illuminate\frequire\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  vimwiki = {
    config = { "\27LJ\2\n÷\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0K\0\1\0\23vimwiki_hl_headers\23vimwiki_global_ext\1\0\3\bext\b.md\tpath\25~/Documents/vimwiki/\vsyntax\rmarkdown\17vimwiki_list\14<Leader>W\23vimwiki_map_prefix\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/which-key\frequire\npcall\0" },
    loaded = true,
    path = "/Users/txema/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/nvim-tree\frequire\npcall\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nÖ\3\0\0\4\0\15\0!6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0005\3\b\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\t\0005\3\n\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0005\3\f\0B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0005\3\14\0B\0\3\1K\0\1\0\1\0\4\vtexthl\5\nnumhl\5\ttext\f‚û°Ô∏è \vlinehl\5\15DapStopped\1\0\4\vtexthl\5\nnumhl\5\ttext\tüü¢\vlinehl\5\16DapLogPoint\1\0\4\vtexthl\5\nnumhl\5\ttext\tüü†\vlinehl\5\27DapBreakpointCondition\1\0\4\vtexthl\5\nnumhl\5\ttext\tüî¥\vlinehl\5\18DapBreakpoint\16sign_define\afn\bvim\nsetup\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/which-key\frequire\npcall\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nB\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\29custom_plugins/lspconfig\frequire\npcall\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fexclude\1\3\0\0\vSearch\15CursorLine\17extra_groups\1\3\0\0\20TelescopeNormal\19NvimTreeNormal\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: dracula.nvim
time([[Config for dracula.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27custom_plugins/dracula\frequire\0", "config", "dracula.nvim")
time([[Config for dracula.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n<\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\23custom_plugins/cmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n?\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\26custom_plugins/notify\frequire\npcall\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\a\0\v\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\6\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\a\0049\4\b\4>\4\3\3=\3\n\2B\0\2\1K\0\1\0\fsources\1\0\0\tmypy\16diagnostics\tyapf\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n@\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\27custom_plugins/luasnip\frequire\npcall\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nò\3\0\0\2\0\17\1)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\f\0006\0\0\0009\0\1\0*\1\0\0=\1\r\0006\0\0\0009\0\1\0*\1\0\0=\1\14\0006\0\0\0009\0\1\0)\1\0\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0K\0\1\0\23floaterm_autoclose\22floaterm_wintitle\20floaterm_height\19floaterm_width\24floaterm_autoinsert\rfloaterm\23floaterm_gitcommit\t<F4>\24floaterm_keymap_new\t<F3>\25floaterm_keymap_prev\t<F2>\25floaterm_keymap_next\t<F1>\27floaterm_keymap_toggle\6g\bvimµÊÃô\19ô≥¶ˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n…\1\0\0\b\0\v\1\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\0065\a\a\0=\a\b\6B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\radapters\1\0\0\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\1\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\30custom_plugins/bufferline\frequire\npcall\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30custom_plugins.illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÓ\1\0\0\4\0\f\0\0206\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\n\0005\3\t\0=\3\v\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\2\25show_current_context\2\31show_current_context_start\2\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\feol:‚Ü¥\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\4\0\3\0\0056\0\0\0006\2\1\0'\3\2\0B\0\3\1K\0\1\0\27custom_plugins/lualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file JupyterExecuteAll lua require("packer.load")({'jupyter_ascending.vim'}, { cmd = "JupyterExecuteAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file JupyterExecute lua require("packer.load")({'jupyter_ascending.vim'}, { cmd = "JupyterExecute", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/txema/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /Users/txema/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /Users/txema/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
