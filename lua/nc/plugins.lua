local plugins = {
  -- Packer can manage itself
  -- 'wbthomason/packer.nvim',

  { 'christoomey/vim-tmux-navigator', lazy = false },

  'nvim-lua/plenary.nvim',
  'sheerun/vim-polyglot',
  { 'nvim-telescope/telescope.nvim', tag = '0.1.8' },
  { 'nvim-telescope/telescope-live-grep-args.nvim' },

  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',

  'vim-airline/vim-airline',
  'doums/darcula',
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  'mbbill/undotree',
  'tpope/vim-commentary',
  'akinsho/toggleterm.nvim',
  'lewis6991/gitsigns.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
--
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-cmdline'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'saadparwaiz1/cmp_luasnip'},     -- Required
    {'rafamadriz/friendly-snippets'},     -- Required
  }
},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
},
}

return plugins
