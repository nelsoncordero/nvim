local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

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

local ignored_dirs = {
  '%.git/',
  '%.idea/',
  'node_modules/',
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', function()
	builtin.find_files({ hidden = true, no_ignore = true, file_ignore_patterns = ignored_dirs });
end)
vim.keymap.set("n", "<leader>fa", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fW', builtin.grep_string, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--', entry.current_file }
    return { "git", "-c", "core.pager=delta", "-c", "delta.pager=less -R", "show", entry.value, '--', entry.current_file }
  end
}

local delta_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

vim.keymap.set('n', '<leader>fG', function() delta_git_bcommits(); end)


local delta_previewer = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- Handle git_commits, git_bcommits, and git_status
    local command = { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff' }
    if entry.status and entry.status == '??' then
      return { 'cat', entry.value } -- Show untracked files
    end
    table.insert(command, entry.value .. (entry.status and '' or '^!'))
    return command
  end
}

-- Apply custom previewer to pickers
local function git_with_delta(picker)
  return function(opts)
    opts = opts or {}
    opts.previewer = delta_previewer
    picker(opts)
  end
end

-- Example Keymaps
-- vim.keymap.set('n', '<leader>gc', git_with_delta(builtin.git_commits), { desc = "Git Commits (Delta)" })
vim.keymap.set('n', '<leader>fg', git_with_delta(builtin.git_status), { desc = "Git Status (Delta)" })

