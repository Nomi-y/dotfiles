return { {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    direction = 'horizontal',
    open_mapping = false,   -- Disable default mapping
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    -- Simple toggle mapping - only in normal mode
    vim.keymap.set("n", "gz", "<cmd>ToggleTerm direction=horizontal size=15<CR>",
      { noremap = true, silent = true, desc = "Toggle horizontal terminal" }
    )
    -- Use Esc to exit terminal mode and close (or just exit terminal mode)
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>",
      { noremap = true, silent = true, desc = "Exit terminal mode" }
    )
    -- Optional: Add a mapping to close the terminal completely from normal mode
    vim.keymap.set("n", "<leader>tc", "<cmd>ToggleTerm<CR>",
      { noremap = true, silent = true, desc = "Close terminal" }
    )
  end
} }
