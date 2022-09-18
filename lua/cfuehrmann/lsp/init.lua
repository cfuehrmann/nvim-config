require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
require'lspconfig'.tsserver.setup {}
