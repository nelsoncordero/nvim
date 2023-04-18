-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'sheerun/vim-polyglot'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  use 'vim-airline/vim-airline'
  use 'doums/darcula'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'mbbill/undotree'
  use 'tpope/vim-commentary'
  use 'akinsho/toggleterm.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)
