return {
  clangd = function(_, opts)
    require("clangd_extensions").setup {
      server = opts,
      extensions = {
        -- use lsp-inlayhints instead
        -- https://github.com/lvimuser/lsp-inlayhints.nvim#clangd
        autoSetHints = false,
      }
    }
  end
}
