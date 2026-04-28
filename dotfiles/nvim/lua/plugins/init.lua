return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "vimdoc", "lua",
        "html", "css", "javascript", "typescript", "tsx",
        "json", "json5", "yaml", "toml",
        "markdown", "markdown_inline", "regex",
        "rust", "vue", "svelte", "graphql",
        "bash", "dockerfile", "sql", "gitignore",
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    },
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
    },
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git", "tsconfig.json", "package.json" },
      }
    end,
  },

  -- Flash (navigation)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = { enabled = true },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- Trouble (diagnostics)
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

  -- Diffview — diffs + 3-way merge tool
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gm", "<cmd>DiffviewOpen<cr>", desc = "Merge conflicts (Diffview)" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed", -- 3 panels top (LOCAL/BASE/REMOTE) + MERGED bottom
          disable_diagnostics = true,
          winbar_info = true,     -- show LOCAL/BASE/REMOTE labels
        },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { width = 35 },
      },
      hooks = {
        diff_buf_read = function(bufnr)
          -- disable some distractions in diff buffers
          vim.opt_local.wrap = false
          vim.opt_local.list = false
          vim.opt_local.colorcolumn = ""
        end,
      },
    },
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  -- Harpoon 2
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Render markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },

  ---------------------------------------------------------------------------
  -- NEW: UI upgrades
  ---------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {},
        hover = { enabled = false },
        signature = { enabled = false },
        documentation = {
          enabled = false,
        },
      },
      cmdline = {
        view = "cmdline_popup",
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
        { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
        { filter = { event = "msg_show", kind = "search_count" },       opts = { skip = true } },
      },
    },
  },
  -- Notify — pretty notifications
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
      render = "wrapped-compact",
      stages = "fade",
      top_down = true,
    },
  },

  -- Dressing — better vim.ui.select / vim.ui.input
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { relative = "editor" },
      select = { backend = { "telescope", "builtin" } },
    },
  },

  -- Which-key — keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 300,
      icons = {
        rules = false,
        breadcrumb = "»",
        separator = "➜",
      },
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>i", group = "Info" },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- NEW: Productivity / Navigation
  ---------------------------------------------------------------------------

  -- Oil — file manager as a buffer
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
        max_width = 100,
        max_height = 30,
        border = "rounded",
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["<C-p>"] = false, -- don't conflict with telescope
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Indent blankline — indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false }, -- we use mini.indentscope for this
      exclude = {
        filetypes = { "help", "NvimTree", "Trouble", "lazy", "mason", "notify", "oil" },
      },
    },
  },

  -- Mini.indentscope — animated current scope
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.indentscope").setup {
        symbol = "│",
        options = { try_as_border = true },
        draw = { animation = require("mini.indentscope").gen_animation.none() },
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "NvimTree", "Trouble", "lazy", "mason", "notify", "oil", "dashboard" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },

  -- Aerial — code outline / symbol navigation
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialNavToggle" },
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Code outline" },
    },
    opts = {
      backends = { "treesitter", "lsp" },
      layout = {
        min_width = 28,
        default_direction = "right",
      },
      show_guides = true,
      filter_kind = false,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },

  -- Telescope extensions
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "debugloop/telescope-undo.nvim",
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
    },
  },

  -- Persistence — auto sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      { "<leader>sr", function() require("persistence").load() end,               desc = "Restore session" },
      { "<leader>sl", function() require("persistence").load { last = true } end, desc = "Last session" },
      { "<leader>sd", function() require("persistence").stop() end,               desc = "Stop session tracking" },
    },
  },

  -- Zen mode — focused editing
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
      plugins = {
        gitsigns = { enabled = true },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        documentation = false,
      },
    },
  },
}
