vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- LSP rename
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Move cursor
vim.keymap.set('n', 'J', '10j', { desc = 'Move down 10 lines' })
vim.keymap.set('n', 'K', '10k', { desc = 'Move up 10 lines' })

-- LSP code action
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- Because OmniSharp is a bitch
vim.keymap.set('n', '<leader>R', '<cmd>LspRestart<cr>', { desc = 'Restart LSP' })

-- I forgor
vim.keymap.set('n', '<leader>?', '<cmd>WhichKey<cr>', { desc = 'Show keybindings cheatsheet' })

-- LSP Diagnostics
vim.keymap.set('n', '<leader>wd', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

-- CTRL A selects all
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-a>', '<Esc>ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true, silent = true })

-- VSCode-like shift line
local function move_line(direction)
    local mode = vim.api.nvim_get_mode().mode

    if mode:match('[vV]') or mode == '' then
        if direction == 'up' then
            vim.cmd('normal! \'<k\'<gv')
        else
            vim.cmd('normal! \'>j\'>gv')
        end
    else
        if direction == 'up' then
            vim.cmd('move-2')
        else
            vim.cmd('move+')
        end
    end
end

vim.keymap.set('n', '<A-j>', function() move_line('down') end, { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', function() move_line('up') end, { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', function() move_line('down') end, { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', function() move_line('up') end, { desc = 'Move selection up' })
vim.keymap.set('i', '<A-j>', '<Esc><cmd>lua move_line("down")<CR>a', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<Esc><cmd>lua move_line("up")<CR>a', { desc = 'Move line up' })


-- Normal/Visual mode
vim.keymap.set('n', '<C-S-7>', function() require('Comment.api').toggle.linewise.current() end)
vim.keymap.set('v', '<C-S-7>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Insert mode
vim.keymap.set('i', '<C-S-7>', '<Esc><Cmd>lua require("Comment.api").toggle.linewise.current()<CR>a')

-- Window commands
vim.keymap.set('n', '<C-j>', '<C-f>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-b>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Disable F1 showing help
vim.keymap.set('n', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('i', '<F1>', '<Nop>', { noremap = true, silent = true })
