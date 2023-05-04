local autocmd = vim.api.nvim_create_autocmd

autocmd("FocusLost", {
  callback = function()
    vim.o.relativenumber = false
  end
})
autocmd("FocusGained", {
  callback = function()
    vim.o.relativenumber = true
  end
})
autocmd("InsertEnter", {
  callback = function()
    vim.o.relativenumber = false
  end
})
autocmd("InsertLeave", {
  callback = function()
    vim.o.relativenumber = true
  end
})

-- cpp switch
autocmd("BufEnter", {
  pattern = {"*.hh"},
  callback = function()
    vim.b.fswitchdst = "c,cpp,cc,m"
    vim.b.fswitchlocs = "reg:|include.*|src/**|"
  end
})
autocmd("BufEnter", {
  pattern = {"*.cc"},
  callback = function()
    vim.b.fswitchdst = "h,hh,hpp"
  end
})

autocmd('FileType', {
  pattern = {"cpp"},
  callback = function(opts)
    -- fswitch
    vim.keymap.set('n', "<leader>ss", ":FSHere<CR>", {remap = false})
    vim.keymap.set('n', "<leader>sh", ":FSSplitLeft<CR>", {remap = false})
    vim.keymap.set('n', "<leader>sj", ":FSSplitBellow<CR>", {remap = false})
    vim.keymap.set('n', "<leader>sk", ":FSSplitAbove<CR>", {remap = false})
    vim.keymap.set('n', "<leader>sl", ":FSSplitRight<CR>", {remap = false})

    -- build
    vim.keymap.set('n', "<C-B>", ":make %<<CR>", {remap = false})
  end
})
