require "nvchad.options"

local o = vim.o

o.relativenumber = true
o.scrolloff = 8
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.cursorlineopt = "both"
o.shell = "fish"
o.pumblend = 10
o.winblend = 10

vim.g.nvchad_term_size = 0.3
vim.g.copilot_assume_mapped = true
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.clipboard = "unnamedplus"

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"

local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup {
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
}
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-1>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-2>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-3>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-4>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)
