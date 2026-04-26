require "nvchad.mappings"

local map = vim.keymap.set

vim.keymap.set("t", "<A-p>", function()
  local handle = io.popen(os.getenv "HOME" .. "/.local/bin/clip2path")
  if handle then
    local result = handle:read "*a"
    handle:close()
    if result and result ~= "" then
      vim.api.nvim_chan_send(vim.b.terminal_job_id, result)
    end
  end
end, { desc = "Paste clipboard image as path" })

vim.keymap.set("t", "<C-S-v>", function()
  local reg = vim.fn.getreg "+"
  if reg ~= "" then
    vim.api.nvim_chan_send(vim.b.terminal_job_id, reg)
  end
end, { desc = "Paste text from clipboard" })

map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Turn off highlighting after search" })

-- Stuff
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })

map("n", "<leader>ef", "<cmd>LspEslintFixAll<cr>", { desc = "ESLint fix all" })

map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next TODO comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous TODO comment" })

map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs (Telescope)" })

-- Terminals
map("n", "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toggle vertical terminal" })

map("t", "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toggle vertical terminal" })

map({ "n", "t" }, "<A-1>", function()
  require("nvchad.term").toggle { pos = "sp", id = "term1", size = 0.3 }
end, { desc = "Terminal #1" })

map({ "n", "t" }, "<A-2>", function()
  require("nvchad.term").toggle { pos = "sp", id = "term2", size = 0.3 }
end, { desc = "Terminal #2" })

-- LazyGit
map("n", "<leader>gg", function()
  require("nvchad.term").toggle { pos = "float", id = "lazygit", cmd = "lazygit" }
end, { desc = "LazyGit" })

map("i", "<A-]>", "<Plug>(copilot-next)", { desc = "Copilot Next" })
map("i", "<A-[>", "<Plug>(copilot-previous)", { desc = "Copilot Previous" })
map("i", "<C-e>", "<Plug>(copilot-dismiss)", { desc = "Copilot Dismiss" })

map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })

map("n", "<leader>.", "<cmd>vertical resize +5<cr>", { desc = "Wider" })
map("n", "<leader>,", "<cmd>vertical resize -5<cr>", { desc = "Narrower" })
map("n", "<leader>=", "<cmd>resize +3<cr>", { desc = "Taller" })
map("n", "<leader>-", "<cmd>resize -3<cr>", { desc = "Shorter" })

map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history" })
