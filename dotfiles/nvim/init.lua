vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- bootstrap lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

---------------------------------------------------------------------------
-- Neovide
---------------------------------------------------------------------------
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"

  -- cursor
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true

  -- scroll
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_scroll_animation_far_lines = 1

  -- window
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 10
  vim.g.neovide_padding_left = 10
  vim.g.neovide_padding_right = 10
  vim.g.neovide_fullscreen = false

  -- transparency
  vim.g.neovide_opacity = 0.92
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 3.0
  vim.g.neovide_floating_blur_amount_y = 3.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  -- misc
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_remember_window_size = true

  -- вставка через Ctrl+Shift+V
  vim.keymap.set({ "n", "i", "c" }, "<C-S-v>", "<C-r>+")
end

vim.defer_fn(function()
  pcall(vim.api.nvim_clear_autocmds, { group = "noice_lsp_signature" })
  pcall(vim.api.nvim_clear_autocmds, { group = "LspSignature" })
end, 500)
