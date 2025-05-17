vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set('n', ',<leader>', ':nohlsearch<CR>', { desc = "Clear search highlights" })

-- #grib
-- vim.g.markdown_folding = 1 -- enable markdown folding
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', 'Q', '<nop')

-- #grib
-- keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
-- keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
-- keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
 
-- #grib
-- keymap.set('n', '<leader>es', ':EslintFixAll<CR>')

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
 
keymap.set('n', '*', '*N')
 
keymap.set('n', 'zc', 'za')
