local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  view = {
    mappings = {
      list = {
        { key = 's', action = 'vsplit' },
        { key = 'v', action = 'split' }
      }
    }
  }
})

-- keymap
vim.keymap.set("n", "<Leader>t", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>T", "<cmd>NvimTreeFindFileToggle<CR>")

-- open the tree
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
