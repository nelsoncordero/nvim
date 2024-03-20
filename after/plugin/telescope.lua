local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fW', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        -- ["<C-m>"] = action_layout.toggle_preview
        ["q"] = actions.close,
        ["<C-J>"] = actions.preview_scrolling_down,
        ["<C-K>"] = actions.preview_scrolling_up,
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview,
        -- ["<C-n>"] = actions.cycle_previewers_next,
        -- ["<C-a>"] = actions.cycle_previewers_prev,
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-J>"] = actions.preview_scrolling_down,
        ["<C-K>"] = actions.preview_scrolling_up,
      },
    },
  }
}

vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
