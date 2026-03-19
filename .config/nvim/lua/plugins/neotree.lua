return { {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,   -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,   -- When true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    git_status = {
      symbols = {
        -- Change all git status icons to empty strings to hide them
        added     = "",   -- or set to "" to remove
        modified  = "",   -- or set to "" to remove
        deleted   = "",   -- or set to "" to remove
        renamed   = "",   -- or set to "" to remove
        untracked = "",   -- or set to "" to remove
        ignored   = "",   -- or set to "" to remove
        unstaged  = "",   -- or set to "" to remove
        staged    = "",   -- or set to "" to remove
        conflict  = "",   -- or set to "" to remove
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
} }
