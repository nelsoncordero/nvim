vim.g.mapleader = ";"
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "KJ", "<ESC>")
vim.keymap.set("n", "<Leader>w", ":w<CR>")

-- Remove
vim.keymap.set("n", "<Leader>d", "dd")

-- Sync scroll
vim.keymap.set('n', '<leader>s', function()
  local current_win = vim.api.nvim_get_current_win()
  local is_bound = vim.wo.scrollbind

  if is_bound then
    vim.cmd('windo set noscb')
    print("Scroll-binding DISABLED!")
  else
    vim.cmd('windo set scb')
    print("Scroll-binding ENABLED!")
  end

  vim.api.nvim_set_current_win(current_win)
end, { desc = "Scrollbind all windows without losing focus" })
vim.keymap.set('n', 'j', function() return vim.wo.scrollbind and '<C-e>' or 'j' end, { expr = true, replace_keycodes = true })
vim.keymap.set('n', 'k', function() return vim.wo.scrollbind and '<C-y>' or 'k' end, { expr = true, replace_keycodes = true })

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
vim.keymap.set("n", "<Leader>l", "<C-w>l")
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>q", "<C-w>q")

-- Resize window
vim.keymap.set("i", "<A-l>", "<C-w>5>")
vim.keymap.set("i", "<A-h>", "<C-w>5<")
vim.keymap.set("n", "<A-l>", "<C-w>5>")
vim.keymap.set("n", "<A-h>", "<C-w>5<")
vim.keymap.set("i", "<A-j>", "<C-w>2+")
vim.keymap.set("i", "<A-k>", "<C-w>2-")
vim.keymap.set("n", "<A-j>", "<C-w>2+")
vim.keymap.set("n", "<A-k>", "<C-w>2-")

vim.keymap.set("n", "<leader>/", function()
    if vim.v.hlsearch == 1 then vim.cmd("nohlsearch")
    else vim.cmd("set hlsearch") end
end, { silent = true, desc = "Toggle search highlight" })

