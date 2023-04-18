vim.g.mapleader = ";"
vim.keymap.set("i", "kj", "<ESC>")

-- Paste
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("n", "J", 'mzJ`z')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Move text up and down
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
-- vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Duplicate window
vim.keymap.set("n", "<Leader>v", vim.cmd.vsplit)
vim.keymap.set("i", "<Leader>v", vim.cmd.vsplit)

-- Window
vim.keymap.set("n", "<Leader>w", "<C-w>")

-- Resize window
vim.keymap.set("i", "<A-l>", "<C-w>5>")
vim.keymap.set("i", "<A-h>", "<C-w>5<")
vim.keymap.set("n", "<A-l>", "<C-w>5>")
vim.keymap.set("n", "<A-h>", "<C-w>5<")

