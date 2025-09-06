-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- LSP / Completion
  { "mason-org/mason.nvim", tag = "v1.11.0", pin = true },
  { "mason-org/mason-lspconfig.nvim", tag = "v1.32.0", pin = true },
  { "neovim/nvim-lspconfig", tag = "v1.8.0", pin = true },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",

  -- Useful keybind helper
  { "folke/which-key.nvim", opts = {} },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Theme
  {
    "olivercederborg/poimandres.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("poimandres")
    end,
  },

  -- Autopairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "poimandres",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },
    },
  },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- Headlines for markdown/org
  { "lukas-reineke/headlines.nvim", dependencies = "nvim-treesitter/nvim-treesitter", config = true },

  -- Comments
  { "numToStr/Comment.nvim", opts = {} },

  -- Telescope
  { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
  },

  -- Undo history
  "mbbill/undotree",

  -- Refactoring
  { "ThePrimeagen/refactoring.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },

  -- Diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
    end,
  },

  -- Surround motions
  "tpope/vim-surround",

  -- Fun
  "eandrju/cellular-automaton.nvim",

  -- Transparency
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        groups = {
          "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
          "Statement", "PreProc", "Type", "Underlined", "Todo", "String",
          "Function", "Conditional", "Repeat", "Operator", "Structure",
          "LineNr", "NonText", "SignColumn", "CursorLine", "CursorLineNr",
          "StatusLine", "StatusLineNC", "EndOfBuffer",
        },
        extra_groups = {}, -- keep empty
        exclude_groups = {},
      })
      vim.cmd("TransparentEnable")

      -- Clear backgrounds globally for all highlight groups
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
          end
        end,
      })
    end,
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left", preserve_window_proportions = true },
        renderer = { group_empty = false, root_folder_modifier = ":~" },
        git = { enable = true, ignore = true, timeout = 400 },
      })
    end,
  },

  -- Tabline
  { "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- LaTeX
  "lervag/vimtex",

  -- Deoplete
  {
    "Shougo/deoplete.nvim",
    run = ":UpdateRemotePlugins",
    config = function()
      vim.g["deoplete#enable_at_startup"] = 1
    end,
  },

  -- Goose + markdown rendering
  {
    "azorng/goose.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { anti_conceal = { enabled = false } },
      },
    },
    config = function()
      require("goose").setup({})
    end,
  },
}, {})

