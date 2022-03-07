local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "marko-cerovac/material.nvim" -- Material Colorscheme
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lualine/lualine.nvim" -- Bottom status bar
  use "lukas-reineke/indent-blankline.nvim" -- Line indentation visualization
  use "folke/zen-mode.nvim" -- Zen mode
  use "vimwiki/vimwiki" -- Vimwiki
  use "kyazdani42/nvim-web-devicons" -- Icons
  use "windwp/nvim-autopairs" -- Auto pairs
  use "lewis6991/gitsigns.nvim" -- git icons
  use "hrsh7th/nvim-cmp" -- auto complete
  use "hrsh7th/cmp-buffer" -- buffer completion
  use "hrsh7th/cmp-path" -- path completion
  use "hrsh7th/cmp-cmdline" -- cmdline completion
  use "hrsh7th/cmp-nvim-lsp" --  autocompletion for lsp
  use "hrsh7th/cmp-nvim-lua" -- autocompletio for lua
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "neovim/nvim-lspconfig" -- enable nvim-lspconfig
  use "williamboman/nvim-lsp-installer" -- simple to use server installer
  use "nvim-telescope/telescope.nvim" -- Telescope, file finder" -- Telescope, file finder
  use {
    "nvim-treesitter/nvim-treesitter", -- syntax highlighting
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- rainbow ()
  use "JoosepAlviste/nvim-ts-context-commentstring" -- comments on context
  use "numToStr/Comment.nvim" -- auto comment
  use "kyazdani42/nvim-tree.lua" -- files explorer
  use "akinsho/bufferline.nvim" -- buffers and tabs
  use "jose-elias-alvarez/null-ls.nvim" -- linter for syntax
  use "akinsho/toggleterm.nvim" -- terminal inside vim
  use "ahmedkhalf/project.nvim" -- project management
  use "lewis6991/impatient.nvim" -- nvim optimization
  use "goolord/alpha-nvim" -- vim starting theme
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim" -- which key like emacs


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
