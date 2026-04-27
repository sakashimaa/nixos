require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Format
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- ESLint
map("n", "<leader>ef", "<cmd>LspEslintFixAll<cr>", { desc = "ESLint fix all" })

-- Inlay hints
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

---------------------------------------------------------------------------
-- Find (Telescope)
---------------------------------------------------------------------------
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
map("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Undo history" })

---------------------------------------------------------------------------
-- Git
---------------------------------------------------------------------------
map("n", "<leader>gg", function()
  require("nvchad.term").toggle { pos = "float", id = "lazygit", cmd = "lazygit" }
end, { desc = "LazyGit" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history" })

---------------------------------------------------------------------------
-- Diagnostics (Trouble)
---------------------------------------------------------------------------
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })

---------------------------------------------------------------------------
-- TODO comments
---------------------------------------------------------------------------
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO" })

---------------------------------------------------------------------------
-- Terminals
---------------------------------------------------------------------------
map({ "n", "t" }, "<A-1>", function()
  require("nvchad.term").toggle { pos = "sp", id = "term1", size = 0.3 }
end, { desc = "Terminal #1" })

map({ "n", "t" }, "<A-2>", function()
  require("nvchad.term").toggle { pos = "sp", id = "term2", size = 0.3 }
end, { desc = "Terminal #2" })

map("n", "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Vertical terminal" })

---------------------------------------------------------------------------
-- Window resize
---------------------------------------------------------------------------
map("n", "<leader>=", "<cmd>resize +3<cr>", { desc = "Taller" })
map("n", "<leader>-", "<cmd>resize -3<cr>", { desc = "Shorter" })
map("n", "<leader>.", "<cmd>vertical resize +5<cr>", { desc = "Wider" })
map("n", "<leader>,", "<cmd>vertical resize -5<cr>", { desc = "Narrower" })

---------------------------------------------------------------------------
-- Copilot
---------------------------------------------------------------------------
map("i", "<A-]>", "<Plug>(copilot-next)", { desc = "Copilot Next" })
map("i", "<A-[>", "<Plug>(copilot-previous)", { desc = "Copilot Previous" })
map("i", "<C-e>", "<Plug>(copilot-dismiss)", { desc = "Copilot Dismiss" })


---------------------------------------------------------------------------
-- Terminal paste helpers
---------------------------------------------------------------------------
vim.keymap.set("t", "<C-S-v>", function()
  local reg = vim.fn.getreg "+"
  if reg ~= "" then
    vim.api.nvim_chan_send(vim.b.terminal_job_id, reg)
  end
end, { desc = "Paste in terminal" })

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
