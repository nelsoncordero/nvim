local constants = require('nc.constants')
local config = {
   colorcolumn = "100",
   custom_colorcolumn = { python = tostring(constants.PY_MAXLENGHT+1) },
}
require("nc.configcolumn").setup(config)
