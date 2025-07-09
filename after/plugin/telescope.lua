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

local previewers = require('telescope.previewers')

-- local delta = previewers.new_termopen_previewer {
--   get_command = function(entry)
--     -- note we can't use pipes
--     -- this command is for git_commits and git_bcommits
--     return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

--     -- this is for status
--     -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
--     -- just do an if and return a different command
--     -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
--   end
-- }


-- local my_git_bcommits = function(opts)
--   opts = opts or {}
--   opts.previewer = delta

--   builtin.git_bcommits(opts)
-- end

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--', entry.current_file }
    return { "git", "-c", "core.pager=delta", "-c", "delta.line-numbers=true", "-c", "delta.pager=less -R", "show", entry.value, '--', entry.current_file }
  end
}

local my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

vim.keymap.set('n', '<leader>fG', function() my_git_bcommits(); end)
