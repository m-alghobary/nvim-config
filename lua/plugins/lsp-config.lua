return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require("lspconfig")

            -- LSP language servers
            lspconfig.lua_ls.setup {}
            lspconfig.ts_ls.setup {}
            lspconfig.rust_analyzer.setup {}

            -- LSP keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, 'ca', vim.lsp.buf.code_action, {})
        end
    }
}
