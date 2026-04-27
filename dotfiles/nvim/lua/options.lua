require "nvchad.options"

local o = vim.o

-- Indentation
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.smartindent = true

-- UI
o.relativenumber = true
o.scrolloff = 8
o.cursorlineopt = "both"
o.pumblend = 10
o.winblend = 10
o.shell = "fish"
o.autoread = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Block cursor everywhere
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"

-- Russian langmap
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Copilot
vim.g.copilot_assume_mapped = true

-- Terminal size
vim.g.nvchad_term_size = 0.3

-- Auto-reload files changed outside vim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

---------------------------------------------------------------------------
-- Harpoon 2
---------------------------------------------------------------------------
local harpoon = require "harpoon"
harpoon:setup {
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
}

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

---------------------------------------------------------------------------
-- Telescope extensions
---------------------------------------------------------------------------
vim.schedule(function()
  local ok, telescope = pcall(require, "telescope")
  if ok then
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "undo")
    pcall(telescope.load_extension, "projects")
  end
end)
