return { {
  'numToStr/Comment.nvim',
  opts = {
    mappings = {
      basic = true,   -- Enables `gcc` for toggling current line
      extra = true,   -- Enables `gc` operator (e.g., `gcj` to comment lines below)
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
  },
  lazy = false,
} }
