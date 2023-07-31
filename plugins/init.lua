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
    dependencies = {"nvim-dap"},
    ft = "py",
    config = function()
      require("dap-python").setup{}
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {"nvim-dap"},
    config = function()
      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable, _buf, _stackframe, _node)
          local maxlen = 40
          if #variable.value <= maxlen then
            return variable.name .. ' = ' .. variable.value
          else
            local first = variable.value:sub(1, maxlen / 2 - 2)
            local last = variable.value:sub(-(maxlen / 2 - 2))
            return variable.name .. ' = ' .. first .. " .. " .. last
          end
        end,
      })
    end,
    cmd = {"DapContinue", "DapStepInto", "DapStepOver"},
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
  },

  {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      require'window-picker'.setup({
        -- the foreground (text) color of the picker
        fg_color = '#cd12dc',
      })
    end,
  },

  {
    'nvim-telescope/telescope-media-files.nvim',
    module = "telescope._extensions.media_files",
    config = function()
      require'telescope'.setup {
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
            -- find command (defaults to `fd`)
            find_cmd = "rg"
          }
        },
        require('telescope').load_extension('media_files')
      }
    end,
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    lazy = false,
  },

  {
    'samodostal/image.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'm00qek/baleia.nvim',
        tags = 'v*',
      }
    },
    -- ft = { "jpg", "jpeg", "png", "gif", "bmp", "tif", "tiff" },
    lazy = false,
    config = function()
      require('image').setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
          foreground_color = true,
          background_color = true
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end
  },

  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy"
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy"
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        -- api_key_cmd = "bash -c \"bw get item openaiapirc | jq -r '.fields | map( { (.name|tostring): . }) | add | .secret_key.value'\""
        api_key_cmd = "bash -c \"cat ~/.config/openaiapirc | grep secret_key | awk '{print $3}'\""
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}
