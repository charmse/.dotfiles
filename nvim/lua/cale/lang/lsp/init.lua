-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = true,
}

local C = require 'nordic.colors'
vim.cmd [[
     sign define DiagnosticSignError text= texthl=LineNr linehl= numhl=DiagnosticSignError
     sign define DiagnosticSignWarn  text= texthl=LineNr linehl= numhl=DiagnosticSignWarn
     sign define DiagnosticSignInfo  text= texthl=LineNr linehl= numhl=DiagnosticSignInfo
     sign define DiagnosticSignHint  text=󱤅 texthl=LineNr linehl= numhl=DiagnosticSignHint
]]

-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'

-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--       filetypes = (servers[server_name] or {}).filetypes,
--     }
--   end,
-- }