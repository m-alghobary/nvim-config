return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "intelephense" },
        },

        config = function(_, opts)
            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP Server with options
            local servers = {
                lua_ls = {},
                ts_ls = {},
                rust_analyzer = {},
                intelephense = {},
            }

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- LSP keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, {})
        end,
    },
}
