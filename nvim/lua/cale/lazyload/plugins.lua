return {
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- LSP Configuration & Plugins
    {
      'neovim/nvim-lspconfig',
      config = function () require 'cale.lang.lsp' end,
      lazy = false,
      dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        {
            'williamboman/mason.nvim',
            build = ':MasonUpdate',
            config = function() require 'cale.lang.mason' end,
        },
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },
    {
        'nvimtools/none-ls.nvim',
        lazy = false,
        config = function () require 'cale.lang.null-ls' end,
    },
    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = { 'User NvimStartupDone'},
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
      },
      config = function() require 'cale.lang.cmp' end,
    },
    {
        "windwp/nvim-autopairs",
        -- Optional dependency
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function() require 'cale.plugins.autopairs' end,
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
          -- Creates a beautiful debugger UI
          'rcarriga/nvim-dap-ui',
          -- Installs the debug adapters for you
          'williamboman/mason.nvim',
          'jay-babu/mason-nvim-dap.nvim',
          -- Add your own debuggers here
          'leoluz/nvim-dap-go',
        },
        config = function() require 'cale.lang.dap' end,
    },
    -- Useful plugin to show you pending keybinds.
    { 
        'folke/which-key.nvim',  
        opts = {} ,
    },
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
      'lewis6991/gitsigns.nvim',
      event = { 'User NvimStartupDone' },
      config = function() require 'cale.ui.gitsigns' end,
    },
    -- Theme
    {
        'AlexvZyl/nordic.nvim',
        priority = 1000,
        config = function() require 'cale.ui.nordic' end,
        lazy = false,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- event = { 'User NvimStartupDone' },
        config = function() require 'cale.ui.lualine' end,
    },
    -- Add indentation guides even on blank lines
    {
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = { indent = { char = '▏' } },
    },
    -- "gc" to comment visual regions/lines
    { 
        'numToStr/Comment.nvim', 
        opts = {},
    },
    -- Fuzzy Finder (files, lsp, etc)
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- Only load if `make` is available. Make sure you have the system
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
      },
      config = function() require 'cale.plugins.telescope' end,
    },
    -- Highlight, edit, and navigate code
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
      config = function() require 'cale.plugins.treesitter' end,
    },
    {
        "RRethy/nvim-treesitter-endwise",
        event = "InsertEnter",
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require 'custom.ui.tree' end,
    },
    -- { "tmux-plugins/vim-tmux" },
    -- { "tmux-plugins/vim-tmux-focus-events" },
    -- { "christoomey/vim-tmux-navigator" },
}