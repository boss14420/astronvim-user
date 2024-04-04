return function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    -- old plugins
    -- local inlayhints_avail, inlayhints = pcall(require, "lsp-inlayhints")
    -- if inlayhints_avail then
    --   inlayhints.on_attach(client, bufnr)
    --   inlayhints.toggle()
    --   vim.keymap.set("n", "<leader>uH", function() inlayhints.toggle() end, { desc = "Toggle inlay hints" })
    -- end
    -- require("astronvim.utils.ui").toggle_buffer_inlay_hints(bufnr)
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end
