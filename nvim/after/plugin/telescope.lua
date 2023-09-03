local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_previous, -- move to prev result
                ['<C-j>'] = actions.move_selection_next,     -- move to next result
                ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})

-- set keymaps
local keymap = vim.keymap
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>pf', '<cmd>Telescope find_files<cr>', {})
keymap.set('n', '<C-p>', '<cmd>Telescope git_files<cr>', {})
keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
