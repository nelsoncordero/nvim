local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")

telescope.setup{
  pickers = {
    buffers = {
      theme = "dropdown",
      previewer = false,
    }
  },
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-J>"] = actions.preview_scrolling_down,
        ["<C-K>"] = actions.preview_scrolling_up,
        ["d"] = actions.delete_buffer,
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview,
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<C-J>"] = actions.preview_scrolling_down,
        ["<C-K>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.delete_buffer,
      },
    },
    layout_config = {
      scroll_speed = 1,
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = false,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    }
  }
}
telescope.load_extension("live_grep_args")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", "<leader>fa", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fW', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
