local colorscheme = "darcula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "Border" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "Border" })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
local p = vim.api.nvim_get_var("darcula#palette")
local px = {
  bg = {'#282727', 235},
  keywordParam = {'#A34A29', 145},
  self = {'#93557E', 145},
  builtin = {'#7886C5', 145},
  constructor = {'#AB0299', 145},
}

vim.api.nvim_call_function("darcula#Hi", {"Normal", p.fg, px.bg})
vim.api.nvim_call_function("darcula#Hi", {"Conceal", p.muted, px.bg})
vim.api.nvim_call_function("darcula#Hi", {"Terminal", p.stdOutput, px.bg})

-- New Hi
vim.api.nvim_call_function("darcula#Hi", {"KeywordParameter", px.keywordParam, px.bg})
vim.api.nvim_call_function("darcula#Hi", {"VariableSelf", px.self, px.bg})
vim.api.nvim_call_function("darcula#Hi", {"BuiltInName", px.builtin, px.bg})
vim.api.nvim_call_function("darcula#Hi", {"ClassConstructor", px.constructor, px.bg})

-- TreeSitter
vim.api.nvim_set_hl(0, "@variable", { link = "Normal" })
vim.api.nvim_set_hl(0, "@variable.parameter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@variable.type.parameter", { link = "KeywordParameter" })
vim.api.nvim_set_hl(0, "@variable.type.self", { link = "VariableSelf" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.special", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "BuiltInName" })
-- vim.api.nvim_set_hl(0, "@function.builtin", { link = "BuiltInName" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "BuiltInName" })
vim.api.nvim_set_hl(0, "@import.name", { link = "Normal" })
vim.api.nvim_set_hl(0, "@class.constructor", { link = "ClassConstructor" })
