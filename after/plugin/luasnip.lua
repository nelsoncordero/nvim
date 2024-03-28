local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
  return
end

require("luasnip").filetype_extend("htmldjango", {"html"})
require('luasnip.loaders.from_vscode').lazy_load()

vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})
