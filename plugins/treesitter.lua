return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua", "c", "cpp", "c_sharp", "python", "java", "glsl"
      },
      highlight = {
        enable = true,
        -- disable = { "cs" },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        disable = true,
        enable = { "c_sharp", "cs" },
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = ";",
          node_decremental = "<BS>",
        },
      },
      indent = {
        enable = true,
      },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    }
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
        require("nvim-treesitter.configs").setup {
          textobjects = {
            enable = true,
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = { query = "@class.outer", desc = "Next class start" },
              },
              goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
              },
              goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
              },
              goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
              },
            },

            lsp_interop = {
              enable = true,
              border = 'rounded',
              peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
              },
            },
          },
        }
      end,
    },
    {
      "RRethy/nvim-treesitter-textsubjects",
      config = function()
        require("nvim-treesitter.configs").setup {
          textsubjects = {
            enable = true,
            disable = { 'c_sharp' },
            prev_selection = '<BS>', -- (Optional) keymap to select the previous selection
            keymaps = {
              ['<CR>'] = 'textsubjects-smart',
              [';'] = 'textsubjects-container-outer',
              ['i;'] = 'textsubjects-container-inner',
            },
          },
        }
      end,
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            -- disable = { "jsx", "cpp" },
            -- Which query to use for finding delimiters
            query = "rainbow-parens",
            -- Highlight the entire buffer all at once
            strategy = require "ts-rainbow.strategy.global",
          },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
          callback = function()
            vim.cmd "TSDisable rainbow"
            vim.cmd "TSEnable rainbow"
          end,
        })
      end,
    },
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
      },
    },
    {
      "Wansmer/sibling-swap.nvim",
      opts = {
        keymaps = {
          ["sl"] = "swap_with_right",
          ["sh"] = "swap_with_left",
          -- ['sL'] = 'swap_with_right_with_opp',
          -- ['sH'] = 'swap_with_left_with_opp',
        },
      },
    },
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  }
}
