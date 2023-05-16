-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- View treesitter highlight groups
    ["<leader>k"] = { ":TSHighlightCapturesUnderCursor<cr>", desc = "View Highlight Group" },
    ["F3"] = { ":Vista!!" },
    -- treesj
    ["<leader>jt"] = {
      function() require('treesj').toggle({split = {recursive = true}}) end,
    },
    ["<leader>js"] = {
      function() require('treesj').split({split = {recursive = true}}) end,
    },
    ["<leader>jj"] = {
      function() require('treesj').join({split = {recursive = true,}}) end,
    },
    -- move lines
    ["sj"] = { ":m .+1<CR>==", desc = "Move line down", remap = false},
    ["sk"] = { ":m .-2<CR>==", desc = "Move line up", remap = false},
    -- telescope dap
    ["<leader>dm"] = { require'telescope'.extensions.dap.commands, desc = "List commands", remap = false },
    ["<leader>de"] = { require'telescope'.extensions.dap.configurations, desc = "List configurations", remap = false },
    ["<leader>dk"] = { require'telescope'.extensions.dap.list_breakpoints, desc = "List breakpoints", remap = false },
    ["<leader>dv"] = { require'telescope'.extensions.dap.variables, desc = "List variables", remap = false },
    ["<leader>df"] = { require'telescope'.extensions.dap.frames, desc = "List frames", remap = false },
    -- window picker
    ["<C-w>p"] = {
      function()
        local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end,
      desc = "Pick a window"
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- move lines
    ["<C-j>"] = { "<ESC>:m .+1<CR>==gi", desc = "Move line down", remap = false},
    ["<C-k>"] = { "<ESC>:m .-2<CR>==gi", desc = "Move line up", remap = false},
  },
  v = {
    -- move lines
    ["sj"] = { ":m '>+1<CR>gv=gv", desc = "Move line down", remap = false},
    ["sk"] = { ":m '<-2<CR>gv=gv", desc = "Move line up", remap = false},
  },
}
