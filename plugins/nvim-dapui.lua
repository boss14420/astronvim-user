-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/nvim-dapui.lua
return {
  "rcarriga/nvim-dap-ui",
  config = function()
    local dap, dapui = require "dap", require "dapui"
    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        expand = "<cr>",
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "watches", size = 0.5 },
            { id = "scopes", size = 0.75 },
            { id = "breakpoints", size = 0.10 },
            { id = "stacks", size = 0.25 },
          },
          size = 80,
          position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 20,
          position = "bottom",
        },
      },
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<esc>" },
        },
      },
      windows = { indent = 1 },
    }
    -- add listeners to auto open DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
