return {
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {}
    end,
  },

  { "lvimuser/lsp-inlayhints.nvim", config = true },

  {
    "Joakker/lua-json5",
    build = "./install.sh",
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = {"nvim-dap"}
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    module = "telescope._extensions.dap",
  },

  {
    "hrsh7th/cmp-nvim-lua",
    dependencies = {"cmp_luasnip"}
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {"nvim-dap"},
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {"nvim-treesitter"}
  },

  {"tpope/vim-surround", lazy = false},
  {"lukas-reineke/indent-blankline.nvim", lazy = false},

  { "derekwyatt/vim-fswitch", ft = { "c", "cpp", "cc", "h", "hh", "hpp" }},
  { "tikhomirov/vim-glsl", ft = "glsl" },

  -- tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({ transparent = true })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },

  {
    "p00f/clangd_extensions.nvim",
    dependencies = {"mason-lspconfig.nvim"},
  },

  {
    'Hoffs/omnisharp-extended-lsp.nvim',
    -- dependencies = {"mason-lspconfig.nvim"},
    name = 'omnisharp_extended',
    ft = 'cs',
  },

  {
    'mfussenegger/nvim-jdtls',
  }
}
