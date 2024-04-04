return {
  -- add custom handler
  jdtls = function(_, opts)
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "java", -- autocmd to start jdtls
      callback = function()
        print("start jdtls at " .. vim.inspect(opts.root_dir))
        if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
        -- print("finish start jdtls")
      end,
    })
  end
}
