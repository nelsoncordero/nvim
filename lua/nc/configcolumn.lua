local configcolumn = {}

local config = {
   colorcolumn = "80",
   custom_colorcolumn = {},
   disabled_filetypes = { "help", "text", "markdown" },
}


local function set(win, colorcolumns)
   if vim.tbl_contains(config.disabled_filetypes, vim.bo.ft) then
      vim.wo[win].colorcolumn = ""
      return
   end

   if type(colorcolumns) == "table" then
      vim.wo[win].colorcolumn = table.concat(colorcolumns, ",")
      return
   end

   vim.wo[win].colorcolumn = colorcolumns
end


local function update()
   local buf_filetype = vim.api.nvim_buf_get_option(0, "filetype")
   local colorcolumns = config.custom_colorcolumn[buf_filetype] or config.colorcolumn
   local current_buf = vim.api.nvim_get_current_buf()
   local wins = vim.api.nvim_list_wins()

   for _, win in pairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      if buf == current_buf and vim.b.prev_state ~= true then
         vim.b.prev_state = true
         set(win, colorcolumns)
      end
   end
end

function configcolumn.setup(user_config)
   user_config = user_config or {}

   for option, value in pairs(user_config) do
      config[option] = value
   end

   local group = vim.api.nvim_create_augroup("SmartColumn", {})
   vim.api.nvim_create_autocmd(
      { "BufEnter" },
      {
         group = group,
         callback = update,
      }
   )
end

return configcolumn
