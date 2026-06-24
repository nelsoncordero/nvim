local constants = require('nc.constants')

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
})

vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        pyflakes = { enabled = false },
        flake8 = {
          enabled = true,
          maxLineLength = constants.PY_MAXLENGHT
        },
      },
      configurationSources = { 'flake8' },
    }
  }
})

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)

    local opts = {buffer = ev.buf, silent = true}

    -- keymap.set("n", "<leader>ga", "<cmd>Telescope lsp_references<cr>", opts)
    keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  end,
})


vim.diagnostic.config({
    virtual_text = true,
    float = {
      source = "always",  -- Or "if_many"
    },
})
