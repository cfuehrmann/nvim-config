require("mason").setup()
require("mason-lspconfig").setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<cr>", bufopts)
  vim.keymap.set('n', 'gi', ":Telescope lsp_implementations<cr>", bufopts)
  vim.keymap.set('n', 'gs', ":Telescope lsp_document_symbols<cr>", bufopts)
  vim.keymap.set('n', 'gS', ":Telescope lsp_workspace_symbols<cr>", bufopts)
  vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('v', '<leader>ca', vim.lsp.buf.range_code_action, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local pid = vim.fn.getpid()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require "lspconfig"

lspconfig.omnisharp.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<cr>", bufopts)
    vim.keymap.set('n', 'gi', ":Telescope lsp_implementations<cr>", bufopts)
    vim.keymap.set('n', 'gs', ":Telescope lsp_document_symbols<cr>", bufopts)
    vim.keymap.set('n', 'gS', ":Telescope lsp_workspace_symbols<cr>", bufopts)
    vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('v', '<leader>ca', vim.lsp.buf.range_code_action, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
  end,
  cmd = { "/home/carsten/.local/share/nvim/mason/packages/omnisharp/omnisharp", "--languageserver", "--hostPID",
    tostring(pid), "Sdk:IncludePrereleases=true" },
  -- cmd = { "/home/carsten/dotnet/dotnet", "/home/carsten/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll", "Sdk:IncludePrereleases=true" },
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
