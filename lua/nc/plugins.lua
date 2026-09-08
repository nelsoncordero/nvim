local plugins = {
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
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    event = {"BufReadPre", "BufNewFile"},
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })
    end,
  },

  -- 'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- For vsnip users.
  --'hrsh7th/cmp-vsnip',
  --'hrsh7th/vim-vsnip',

  -- For luasnip users.
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',     -- Required

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  }
}

return plugins
