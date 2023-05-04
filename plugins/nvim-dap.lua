return {
  "mfussenegger/nvim-dap",
  module = "dap",
  after = "lua-json5",
  dependencies = {"lua-json5"},
  config = function()
    local dap = require('dap')

    -- require("mason-nvim-dap").setup({
    --   ensure_installed = {"cppdbg", "codeclr"},
    --   automatic_setup = true,
    --   handler = {},
    -- })

    require('dap.ext.vscode').json_decode = require'json5'.parse
    require('dap.ext.vscode').load_launchjs(nil, {coreclr = {'cs'}})

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description =  'enable pretty printing',
            ignoreFailures = false
          }
        },
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }
  end
}
