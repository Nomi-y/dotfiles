return { {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  init = function()
    -- Set up your key mappings here
    vim.g.VM_maps = {
      ['Add Cursor Up'] = '<A-K>',
      ['Add Cursor Down'] = '<A-J>',
      ['Select All'] = '<A-a>',
    }
  end
} }
